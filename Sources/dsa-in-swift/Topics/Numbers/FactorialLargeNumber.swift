/*
Given an integer n, find its factorial. Return a list of integers denoting the digits that make up the factorial of n.

Examples:

Input: n = 5
Output: [1, 2, 0]
Explanation: 5! = 1*2*3*4*5 = 120
Input: n = 10
Output: [3, 6, 2, 8, 8, 0, 0]
Explanation: 10! = 1*2*3*4*5*6*7*8*9*10 = 3628800
Input: n = 1
Output: [1]
Explanation: 1! = 1
Constraints:
1 ≤ n ≤ 103
*/
private func factorial(_ n: Int) -> [Int] {
  guard n > 1 else { return [1] }
  var ans: [Int] = [1]
  for i in 2...n {
    var carry = 0

    // Multiply existing digits and propagate carry in-place
    for j in 0..<ans.count {
      let prod = ans[j] * i + carry
      ans[j] = prod % 10
      carry = prod / 10
    }

    // Append remaining carry digits
    while carry > 0 {
      ans.append(carry % 10)
      carry /= 10
    }
  }

  // Reverse once at the end to get correct order
  return ans.reversed()
}

func factorialDemo() {
  let n = 125
  let result = factorial(n)
  print("Factorial of \(n) is: \(result)")
}
