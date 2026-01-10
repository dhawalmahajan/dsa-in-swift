func paramBalance(_ str: String) -> Bool {
  var stack: [Character] = []
  for char in str {
    if "({[".contains(char) {
      stack.append(char)
    } else if char == ")" {
      guard stack.count != 0 && stack.removeLast() == "(" else {
        return false
      }

    } else if char == "}" {
      guard stack.count != 0 && stack.removeLast() == "{" else {
        return false
      }
    } else if char == "]" {
      guard stack.count != 0 && stack.removeLast() == "[" else {
        return false
      }
    }
  }
  return stack.isEmpty
}

func validParanthesisDemo() {
  let str1 = "()"
  let str2 = "()[]{}"
  let str3 = "(]"
  let str4 = "([)]"
  let str5 = "{[]}"

  print(paramBalance(str1))  // true
  print(paramBalance(str2))  // true
  print(paramBalance(str3))  // false
  print(paramBalance(str4))  // false
  print(paramBalance(str5))  // true
}
