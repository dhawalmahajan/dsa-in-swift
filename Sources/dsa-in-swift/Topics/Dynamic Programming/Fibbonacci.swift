/*
The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

F(0) = 0, F(1) = 1
F(n) = F(n - 1) + F(n - 2), for n > 1.
Given n, calculate F(n).



Example 1:

Input: n = 2
Output: 1
Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
Example 2:

Input: n = 3
Output: 2
Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
Example 3:

Input: n = 4
Output: 3
Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.


Constraints:

0 <= n <= 30
*/

private func recursion(_ n: Int) -> Int {
  if n <= 1 { return n }
  return fib(n - 1) + fib(n - 2)
}

//MARK: TOP DOWN Approch (Recursion + Memoization)
private func dpTopDownApproch(_ n: Int) -> Int {
  var dp: [Int] = Array(repeating: -1, count: n + 1)
  if n <= 1 { return n }
  if dp[n] != -1 { return dp[n] }
  dp[n] = fib(n - 1) + fib(n - 2)
  return dp[n]
}

//MARK: BOTTOM UP Approch (Tabulation + Loop)
private func dpBottomUpApproch(_ n: Int) -> Int {
  var dp: [Int] = Array(repeating: -1, count: n + 1)
  if n <= 1 { return n }
  dp[0] = 0
  dp[1] = 1

  for i in 2...n {
    dp[i] = dp[i - 1] + dp[i - 2]
  }
  return dp[n]
}

//MARK: SPACE OPTIMIZE APPROCH
private func dpSpaceOptimizeApproch(_ n: Int) -> Int {
  var prev2 = 0
  var prev1 = 1
  var curr: Int = 1
  for _ in 2...n {
    curr = prev1 + prev2
    prev2 = prev1
    prev1 = curr
  }
  return curr
}
private func fib(_ n: Int) -> Int {
  //    return recursion(n)
  // return dpTopDownApproch(n)
  // return dpBottomUpApproch(n)
  return dpSpaceOptimizeApproch(n)
}
func fibbonacciDemo() {
  let num = fib(5)
  print(num)

}
