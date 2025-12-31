import {
	ParserRuleContext,
	ParseTree,
	ParseTreeWalker,
	TerminalNode,
} from "antlr4ng";
import { SmaliParserListener } from "./SmaliParserListener.js";
import * as fs from "fs";
import { SmaliLexer } from "./SmaliLexer.js";
import {
	FieldDirectiveContext,
	FieldModifierContext,
	SourceDirectiveContext,
} from "./SmaliParser.js";

export class SmaliWriter extends SmaliParserListener {
	private out?: fs.WriteStream;

	private constructor(file?: string) {
		super();

		if (file !== undefined) {
			this.out = fs.createWriteStream(file, { encoding: "utf8" });
		}
	}

	override visitTerminal(node: TerminalNode): void {
		const terminal = node.getText();
		this.write(terminal);

		const symbolName = SmaliLexer.symbolicNames[node.symbol.type];
		if (
			terminal === "," ||
			symbolName?.startsWith("OP_") ||
			symbolName?.endsWith("_DIRECTIVE")
		) {
			this.space();
		}
	}

	override exitClassModifier = () => {
		this.space();
	};
	override exitClassDirective = () => {
		this.endOfLine();
	};
	override exitSuperDirective = () => {
		this.endOfLine();
	};
	override exitMethodModifier = () => {
		this.space();
	};
	override exitMethodReturnType = () => {
		this.endOfLine();
	};
	override enterMethodBodyStatement = () => {
		this.tab();
	};
	override exitMethodBodyStatement = () => {
		this.endOfLine();
	};
	override exitMethodDirective = () => {
		this.endOfLine(2);
	};
	override exitRegistersDirective = () => {
		this.endOfLine();
	};
	override exitLocalsDirective = () => {
		this.endOfLine();
	};
	override exitSourceDirective = () => {
		this.endOfLine();
	};
	override exitFieldDirective = () => {
		this.endOfLine(2);
	};
	override exitFieldModifier = () => {
		this.space();
	};

	private constText(txt: string): void {
		this.write(txt);
	}
	private contextText(ctx: ParserRuleContext): void {
		this.write(ctx.getText());
	}
	private endOfLine(nth?: number): void {
		this.write("\n".repeat(nth ?? 1));
	}
	private space(nth?: number): void {
		this.write(" ".repeat(nth ?? 1));
	}
	private tab(nth?: number): void {
		this.write("\t".repeat(nth ?? 1));
	}

	private write(data: string): void {
		(this.out ?? process.stdout).write(data);
	}
	private finish(): void {
		this.out?.end();
	}

	public static write(tree: ParseTree, file?: string) {
		const writer = new SmaliWriter(file);
		ParseTreeWalker.DEFAULT.walk(writer, tree);
		writer.finish();
	}
}
