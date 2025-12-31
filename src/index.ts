import { CharStream, CommonTokenStream } from "antlr4ng";
import { SmaliLexer } from "./lib/SmaliLexer.js";
import { ParseContext, SmaliParser } from "./lib/SmaliParser.js";
import { SmaliWriter } from "./lib/SmaliWriter.js";
import { execSync } from "child_process";
import * as fs from "fs";
import * as path from "path";
import { AndroidManifestParser, AndroidManifest } from "./lib/AndroidManifest.js";

/**
 * Helper function to find the main activity from the AndroidManifest structure.
 * Returns the activity name or null if not found.
 */
function findMainActivity(manifest: AndroidManifest): string | null {
	const activities = manifest?.manifest?.application?.activity ?? [];

	for (const activity of activities) {
		const intentFilters = activity["intent-filter"] ?? [];

		for (const filter of intentFilters) {
			const actions = Array.isArray(filter?.action) ? filter.action : [filter?.action];
			const categories = Array.isArray(filter?.category) ? filter.category : [filter?.category];

			const hasMain = actions.some(
				(a: any) => a?.["@android:name"] === "android.intent.action.MAIN"
			);

			const hasLauncher = categories.some(
				(c: any) => c?.["@android:name"] === "android.intent.category.LAUNCHER"
			);

			if (hasMain && hasLauncher) {
				return activity["@android:name"] ?? null;
			}
		}
	}

	return null;
}

/**
 * Converts a Java class name to Smali format.
 * Example: com.example.MainActivity -> Lcom/example/MainActivity;
 */
function javaToSmaliClassName(javaClassName: string): string {
	return `L${javaClassName.replace(/\./g, "/")};`;
}

/**
 * Converts a Smali class name to a file path.
 * Example: Lcom/example/MainActivity; -> com/example/MainActivity.smali
 */
function smaliClassNameToPath(smaliClassName: string): string {
	// Remove L prefix and ; suffix, then add .smali extension
	const cleaned = smaliClassName.replace(/^L/, "").replace(/;$/, "");
	return `${cleaned}.smali`;
}

/**
 * Recursively finds all .smali files in a directory
 */
function findSmaliFiles(dir: string): string[] {
	const files: string[] = [];
	if (!fs.existsSync(dir)) return files;

	for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
		const fullPath = path.join(dir, entry.name);
		if (entry.isDirectory()) {
			files.push(...findSmaliFiles(fullPath));
		} else if (entry.isFile() && entry.name.endsWith(".smali")) {
			files.push(fullPath);
		}
	}
	return files;
}

/**
 * Finds the Smali file containing the main activity class using AST parsing.
 * Returns the file path or null if not found.
 */
function findMainActivitySmaliFile(decompiledDir: string, mainActivityClassName: string): string | null {
	const targetSmaliClass = javaToSmaliClassName(mainActivityClassName);
	console.log(`Searching for Smali class: ${targetSmaliClass}`);

	// Search in all smali directories (smali, smali_classes2, etc.)
	const smaliDirs = fs.readdirSync(decompiledDir)
		.filter(name => name.startsWith("smali"))
		.map(name => path.join(decompiledDir, name));

	for (const smaliDir of smaliDirs) {
		const smaliFiles = findSmaliFiles(smaliDir);
		console.log(`Searching in ${smaliDir} (${smaliFiles.length} files)...`);

		for (const filePath of smaliFiles) {
			try {
				const content = fs.readFileSync(filePath, "utf8");
				const lexer = new SmaliLexer(CharStream.fromString(content));
				const tokens = new CommonTokenStream(lexer);
				const parser = new SmaliParser(tokens);
				const tree = parser.parse();

				// Navigate through statements to find class directive
				const statements = tree.statement();
				for (const statement of statements) {
					const classDirective = statement.classDirective();
					if (classDirective && classDirective.className()) {
						const className = classDirective.className().getText();

						if (className === targetSmaliClass) {
							console.log(`Found main activity in: ${filePath}`);
							return filePath;
						}
					}
				}
			} catch (error) {
				// Skip files that fail to parse
				continue;
			}
		}
	}

	return null;
}

/**
 * Injects the security check call into the MainActivity's onCreate method.
 * Uses text-based injection to add the call after the super.onCreate() call.
 */
function injectSecurityCheckCall(mainActivitySmaliPath: string, mainActivityPackage: string): void {
	console.log("Injecting security check call into MainActivity...");

	// Read the MainActivity.smali file
	let content = fs.readFileSync(mainActivitySmaliPath, "utf8");

	// Extract package path for SecurityDetectors
	const packagePath = mainActivityPackage.substring(0, mainActivityPackage.lastIndexOf(".")).replace(/\./g, "/");

	// Create the injection code
	const injectionCode = `
    .line 1000
    sget-object v0, L${packagePath}/SecurityDetectors;->Companion:L${packagePath}/SecurityDetectors$Companion;

    move-object v1, p0

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v0, v1}, L${packagePath}/SecurityDetectors$Companion;->performSecurityChecks(Landroid/app/Activity;)L${packagePath}/SecurityStatus;
`;

	// Find the super.onCreate() call using regex
	// Pattern: invoke-super {p0, p1}, ...->onCreate(Landroid/os/Bundle;)V
	const superCallRegex = /([ \t]*)invoke-super\s+\{[^}]+\},\s+\S+->onCreate\([^)]*\)V/;
	const match = content.match(superCallRegex);

	if (!match) {
		console.error("super.onCreate() call not found in MainActivity");
		console.error("This might not be a standard Activity onCreate method");
		process.exit(17);
	}

	// Insert the injection code after the super call
	// We need to find the line break after the super call and insert there
	const superCallEnd = (match.index || 0) + match[0].length;
	const beforeSuper = content.substring(0, superCallEnd);
	const afterSuper = content.substring(superCallEnd);

	content = beforeSuper + injectionCode + afterSuper;

	// Write the modified content back to the file
	fs.writeFileSync(mainActivitySmaliPath, content, "utf8");
	console.log(`Security check call injected into onCreate method at ${mainActivitySmaliPath}`);
}

/**
 * Injects the SecurityDetectors.smali file into the decompiled APK.
 */
function injectSecurityDetectors(decompiledDir: string, mainActivityPackage: string): void {
	const sourceFile = path.resolve("./src/assets/SecurityDetectors.smali");

	if (!fs.existsSync(sourceFile)) {
		console.error(`SecurityDetectors.smali not found at: ${sourceFile}`);
		console.error("Please create this file from your Exercise 4 work");
		process.exit(10);
	}

	// Extract package path from main activity
	// e.g., com.example.myapp.MainActivity -> com/example/myapp
	const packagePath = mainActivityPackage.substring(0, mainActivityPackage.lastIndexOf(".")).replace(/\./g, "/");

	// Determine smali directory (could be smali, smali_classes2, etc.)
	const smaliDir = path.join(decompiledDir, "smali");
	if (!fs.existsSync(smaliDir)) {
		console.error(`Smali directory not found: ${smaliDir}`);
		process.exit(11);
	}

	// Create target directory if it doesn't exist
	const targetDir = path.join(smaliDir, packagePath);
	if (!fs.existsSync(targetDir)) {
		fs.mkdirSync(targetDir, { recursive: true });
	}

	const targetFile = path.join(targetDir, "SecurityDetectors.smali");

	try {
		let fileContent = fs.readFileSync(sourceFile, "utf8");

		// Update the .class directive to match the package
		const smaliPackage = packagePath.replace(/\//g, "/");
		const classDirectiveRegex = /\.class\s+public\s+L[^;]+;/;
		const newClassDirective = `.class public L${smaliPackage}/SecurityDetectors;`;

		if (classDirectiveRegex.test(fileContent)) {
			fileContent = fileContent.replace(classDirectiveRegex, newClassDirective);
		}

		fs.writeFileSync(targetFile, fileContent, "utf8");
		console.log(`SecurityDetectors.smali injected at: ${targetFile}`);
	} catch (error) {
		console.error("Error injecting SecurityDetectors:", error);
		process.exit(12);
	}
}

function decompileApk(apkPath: string, outputDir: string): void {
	console.log(`Decompiling APK: ${apkPath}`);
	console.log(`Output directory: ${outputDir}`);

	try {
		const command = `apktool decode -o "${outputDir}" "${apkPath}"`;
		execSync(command, { stdio: "inherit" });
		console.log("Decompilation completed successfully");
	} catch (error) {
		console.error("Error during decompilation:", error);
		process.exit(1);
	}
}

/**
 * Rebuilds the modified APK from the decompiled directory.
 */
function rebuildApk(decompiledDir: string, outputApkPath: string): void {
	console.log(`Rebuilding APK from: ${decompiledDir}`);
	console.log(`Output APK: ${outputApkPath}`);

	try {
		const command = `apktool build -o "${outputApkPath}" "${decompiledDir}"`;
		execSync(command, { stdio: "inherit" });
		console.log("APK rebuild completed successfully");
	} catch (error) {
		console.error("Error during APK rebuild:", error);
		process.exit(20);
	}
}

function main() {
	const args = process.argv.slice(2);

	if (args.length === 0 || !args[0]) {
		console.error("Error: APK file path is required");
		console.error("Usage: npm start <apk-file-path>");
		process.exit(1);
	}

	const apkPath: string = args[0];

	if (!fs.existsSync(apkPath)) {
		console.error(`Error: APK file not found: ${apkPath}`);
		process.exit(1);
	}

	console.log(`Processing APK file: ${apkPath}`);

	const apkName = path.basename(apkPath, ".apk");
	const outputDir = path.join(process.cwd(), `${apkName}_decompiled`);

	// Step 3 - Decompile the APK using Apktool
	decompileApk(apkPath, outputDir);

	// Step 4 - Find main activity and inject detectors
	const manifestPath = path.join(outputDir, "AndroidManifest.xml");
	if (!fs.existsSync(manifestPath)) {
		console.error(`AndroidManifest.xml not found at: ${manifestPath}`);
		process.exit(13);
	}

	let manifest: AndroidManifest;
	try {
		const manifestParser = new AndroidManifestParser();
		manifest = manifestParser.parse(manifestPath);
	} catch (error) {
		console.error("Failed to parse AndroidManifest.xml:", error);
		process.exit(14);
	}

	const mainActivity = findMainActivity(manifest);
	if (!mainActivity) {
		console.error("Main activity not found in AndroidManifest.xml");
		process.exit(15);
	}

	console.log(`Main activity identified: ${mainActivity}`);

	// Inject SecurityDetectors into the appropriate package
	injectSecurityDetectors(outputDir, mainActivity);

	// Step 5 - Find the main activity Smali file using AST
	const mainActivitySmaliFile = findMainActivitySmaliFile(outputDir, mainActivity);
	if (!mainActivitySmaliFile) {
		console.error(`Main activity Smali file not found for: ${mainActivity}`);
		process.exit(16);
	}

	console.log(`Main activity Smali file: ${mainActivitySmaliFile}`);

	// Step 6 - Modify AST to inject detection calls
	injectSecurityCheckCall(mainActivitySmaliFile, mainActivity);

	// Step 7 - Rebuild APK
	const outputApkPath = path.join(process.cwd(), `${apkName}_modified.apk`);
	rebuildApk(outputDir, outputApkPath);

	console.log("\n" + "=".repeat(60));
	console.log("APK modification completed successfully!");
	console.log("=".repeat(60));
	console.log(`Original APK: ${apkPath}`);
	console.log(`Modified APK: ${outputApkPath}`);
	console.log("\nNext steps:");
	console.log("1. Sign the APK (required for installation)");
	console.log("2. Install on emulator or device: adb install " + path.basename(outputApkPath));
	console.log("=".repeat(60));
}

main();
