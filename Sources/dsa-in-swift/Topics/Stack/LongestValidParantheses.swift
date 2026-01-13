func longestValidParentheses(_ s: String) -> Int {
  var stack: [Int] = []

  var result = 0
  stack.append(-1)
  for (i, char) in s.enumerated() {
    if char == "(" {
      stack.append(i)
    } else {
      stack.removeLast()
      if !stack.isEmpty {
        result = max(result, i - (stack.last ?? -1))
        stack.append(i)
      } else {
        result = max(result, i - (stack.last ?? -1))
      }
    }

  }
  return result
}
func validLongParanthesisDemo() {
  let s = "(()))())("
  print("Longest valid parantheses in \(s) is \(longestValidParentheses(s))")
}
