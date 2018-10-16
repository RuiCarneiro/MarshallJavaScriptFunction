// (CopyLeft) 2018 Rui Carneiro.

public func jsCallString(function: String, arguments: CustomStringConvertible...) -> String {
    let argumentsStrings : [String] = arguments.map {
        if let stringArgument = $0 as? String {
            return stringArgument.debugDescription
        }
        else if let dictionaryArgument = $0 as? Dictionary<AnyHashable, CustomStringConvertible> {
            var newDictionary : [String: CustomStringConvertible] = [:]
            for key in dictionaryArgument.keys {
                newDictionary[key.description] = dictionaryArgument[key]
            }
            return newDictionary.description
        }
        else {
            return $0.description
        }
    }

    let argumentString = argumentsStrings.joined(separator: ", ")

    return "\(function)(\(argumentString))"
}

