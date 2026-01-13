func longestValidParentheses(_ s: String) -> Int {
  var stack: [Int] = []

  var result = 0
  stack.append(-1)
  for (i, char) in s.enumerated() {
    if char == "(" {
      stack.append(i)
    } else {
      stack.popLast()
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
