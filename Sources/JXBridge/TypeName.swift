/// Return the default JavaScript name for the given type.
public func TypeName(for type: Any.Type) -> String {
    return asJXTypeName(String(describing: type))
}

// Internal for testing
func asJXTypeName(_ typeName: String) -> String {
    if typeName.last != ">" {
        return stripFramework(typeName)
    }
    
    guard let genericsStartIndex = typeName.firstIndex(of: "<") else {
        return typeName
    }
    let baseTypeName = stripFramework(String(typeName.prefix(upTo: genericsStartIndex)))
    let genericsList = genericsList(String(typeName[genericsStartIndex ..< typeName.endIndex]))
    return baseTypeName + "Of" + genericsList
}

private func stripFramework(_ typeName: String) -> String {
    guard let frameworkEndIndex = typeName.lastIndex(of: ".") else {
        return typeName
    }
    return String(typeName.suffix(from: typeName.index(after: frameworkEndIndex)))
}

private func genericsList(_ generics: String) -> String {
    // Strip leading and trailing '<', '>'
    let typeNamesList = generics[generics.index(after: generics.startIndex) ..< generics.index(before: generics.endIndex)]
    
    var typeNames: [String] = []
    var typeNameStartIndex = typeNamesList.startIndex
    var depth = 0
    for index in typeNamesList.indices {
        if typeNamesList.index(after: index) == typeNamesList.endIndex {
            // Add the last type name
            let typeName = String(typeNamesList[typeNameStartIndex ... index])
            typeNames.append(typeName)
            break
        }
        
        let char = typeNamesList[index]
        switch char {
        case "<":
            depth += 1
        case ">":
            depth -= 1
        case ",":
            if depth == 0 {
                let typeName = String(typeNamesList[typeNameStartIndex ..< index])
                typeNames.append(typeName)
                // Skip this comma and the subsequent space
                typeNameStartIndex = typeNamesList.index(index, offsetBy: 2)
            }
        default:
            break
        }
    }
    return typeNames.map { asJXTypeName($0) }.joined(separator: "And")
}
