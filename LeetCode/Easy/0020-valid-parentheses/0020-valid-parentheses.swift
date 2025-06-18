class Solution {
    func isValid(_ s: String) -> Bool {
        let stack = s.map { String($0) }

        var opened = [String]()

        for char in stack {
            if isOpeningBracket(char) {
                opened.append(char)
            } else {
                if opened.isEmpty { return false }
                else {
                    let currentOpened = opened.removeLast()

                    if !isSameBracket(currentOpened, char) {
                        return false
                    }
                }
            }
        }

        if opened.isEmpty { return true }
        else { return false }
    }

    func isOpeningBracket(_ char: String) -> Bool {
        return char == "{" || char == "(" || char == "["
    }

    func isSameBracket(_ opening: String, _ closing: String) -> Bool {
        return (opening == "{" && closing == "}")
        || (opening == "(" && closing == ")")
        || (opening == "[" && closing == "]")
    }
}