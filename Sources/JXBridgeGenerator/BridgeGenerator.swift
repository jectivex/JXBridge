import Foundation
#if os(macOS) || os(Linux)
import SwiftTreeSitter
import TreeSitterSwift

@main
public class BridgeGenerator {
    /// Expected arguments:
    ///
    ///     - Executable
    ///     - Target name
    ///     - Output file
    ///     - [Input files] or ["-d", Input directory]
    static func main() throws {
        let arguments = CommandLine.arguments
        guard arguments.count > 3 else {
            return
        }
        let target = arguments[1]
        let outputFile = arguments[2]

        let inputFiles: [String]
        if arguments[3] == "-d" {
            guard arguments.count > 4 else {
                return
            }
            inputFiles = try findInputFiles(in: arguments[4])
        } else {
            inputFiles = Array(arguments[3...])
        }

        let generator = BridgeGenerator(target: target)
        let output = try generator.process(files: inputFiles)
        try output.write(toFile: outputFile, atomically: true, encoding: .utf8)
    }

    private static func findInputFiles(in directory: String) throws -> [String] {
        let directoryURL = URL(fileURLWithPath: directory, isDirectory: true)
        guard let directoryEnumerator = FileManager.default.enumerator(at: directoryURL, includingPropertiesForKeys: [.isDirectoryKey], options: [.skipsHiddenFiles]) else {
            return []
        }
        var sourceFiles: [String] = []
        for case let fileURL as URL in directoryEnumerator {
            guard fileURL.pathExtension == "swift", let resourceValues = try? fileURL.resourceValues(forKeys: [.isDirectoryKey]), resourceValues.isDirectory != true else {
                continue
            }
            sourceFiles.append(fileURL.path)
        }
        return sourceFiles
    }

    let target: String
    private var typeNameToFiles: [String: [String]] = [:]

    init(target: String) {
        self.target = target
    }

    func process(files: [String]) throws -> String {
        let language = Language(language: tree_sitter_swift())
        let parser = Parser()
        try parser.setLanguage(language)
        try files.forEach { try process(file: $0, with: parser) }
        return ""
    }

    private func process(file: String, with parser: Parser) throws {
        let source = try String(contentsOfFile: file)
        let tree = parser.parse(source)
        if let node = tree?.rootNode {
            //Self.printTree(node, file: file, source: source)
            try process(node: node, file: file, source: source, typePath: [])
        } else {
            print("Unable to parse source file: \(file)")
        }
    }

    private func process(node: Node, file: String, source: String, typePath: [String]) throws {
        let classDecs = node.children(of: "class_declaration")
            .filter { $0.hasChild(ofAny: ["class", "struct", "extension"]) }
        //~~~
    }

    private static func printTree(_ node: Node, file: String, source: String) {
        print("----------")
        print("File: \(file)")
        printNode(node, source: source, level: 0)
        print("----------")
    }

    private static func printNode(_ node: Node, source: String, level: Int) {
        let prefix = String(repeating: "  ", count: level)
        if let nodeType = node.nodeType, let string = node.string(in: source) {
            print("\(prefix)\(nodeType): '\(string)'")
        }
        for i in 0..<node.childCount {
            if let child = node.child(at: i) {
                printNode(child, source: source, level: level + 1)
            }
        }
    }
}

extension Node {
    func children(of nodeType: String) -> [Node] {
        var children: [Node] = []
        for i in 0..<namedChildCount {
            if let child = namedChild(at: i), child.nodeType == nodeType {
                children.append(child)
            }
        }
        return children
    }

    func hasChild(ofAny nodeTypes: [String]) -> Bool {
        for i in 0..<namedChildCount {
            if let nodeType = namedChild(at: i)?.nodeType, nodeTypes.contains(nodeType) {
                return true
            }
        }
        return false
    }

    func string(in source: String) -> String? {
        guard let stringRange = Range(range, in: source) else {
            return nil
        }
        return String(source[stringRange])
    }
}
#else
@main
public class BridgeGenerator {
    static func main() throws {
        throw BridgeGeneratorError(message: "Unsupported platform")
    }
}
#endif
