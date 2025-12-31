import { ParserRuleContext, ParseTree, ParseTreeWalker } from "antlr4ng";
import { SmaliParserListener } from "./SmaliParserListener.js";

export class SmaliPrinter extends SmaliParserListener {
	override enterEveryRule(node: ParserRuleContext): void {
		const proto = Object.getPrototypeOf(node);
		const nodeName = proto.constructor.name;

		if (node.depth() > 1) {
			let prefix = "├" + "-".repeat(node.depth() - 1);
			console.log(prefix, nodeName);
		} else {
			console.log(nodeName);
		}
	}

	public static print(tree: ParseTree) {
		const printer = new SmaliPrinter();
		ParseTreeWalker.DEFAULT.walk(printer, tree);
	}
}
