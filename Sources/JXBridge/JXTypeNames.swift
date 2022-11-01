extension String {
    public var fromJXTypeName: String {
        guard let genericsIndex = self.firstIndex(of: "$"), genericsIndex != self.index(before: self.endIndex) else {
            return self
        }
        let typeName = self.prefix(upTo: genericsIndex)

        let genericsSuffix = self.suffix(from: self.index(after: genericsIndex))
        let endGenericsIndex = genericsSuffix.lastIndex(of: "$") ?? genericsSuffix.endIndex
        let generics = genericsSuffix.prefix(upTo: endGenericsIndex)

        var depth = 0
        var startIndex = generics.startIndex
        var endIndex = generics.endIndex
        var index = startIndex
        while index != endIndex {
            switch generics[index] {
            case "$":
                let nextIndex = generics.index(after: index)
                if nextIndex == endIndex || generics[nextIndex] == "_" || generics[nextIndex] == "$" {
                    depth -= 1
                } else {
                    depth += 1
                }
            case "_":
                if depth == 0 {
                    let genericTypeName = generics[startIndex ..< index]
                    //~~~ add generic type
                } else {
                    fallthrough
                }
            default:                                                                                                                                   
            }
        }
        //~~~ split generic types on _ by iterating through string and keeping track of $ depth
    }

    /*
     GenericMap<GenericKey<X, Y>, GenericValue>
        GenericMap$GenericKey$X_Y_GenericValue
        GenericMap$GenericKey$X_Y$_GenericValue$
     GenericMap<GenericKey<X, Y, GenericValue>
        GenericMap$GenericKey$X_Y_GenericValue$$

     GenericMap_GenericKey_X$Y$GenericValue__

     GenericMap0GenericKey0X$69

     GenericMap$Int_String$
     MyType$Int$
     Array$Int$
     Map$Int_String$
     Map$Key$Int$_Value$String$$
     */
}
