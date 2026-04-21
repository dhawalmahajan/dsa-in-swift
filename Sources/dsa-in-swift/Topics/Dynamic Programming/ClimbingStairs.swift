/*
You are climbing a staircase. It takes n steps to reach the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?



Example 1:

Input: n = 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps
Example 2:

Input: n = 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step


Constraints:

1 <= n <= 45
*/

private func recursive(_ i: Int, _ n: Int) -> Int {
  if i == n { return 1 }
  if i > n { return 0 }
  return recursive(i + 1, n) + recursive(i + 2, n)
}
private func dpTopDownApproch(_ i: Int, _ n: Int) -> Int {
  var dp: [Int] = Array(repeating: -1, count: n + 2)
  if i == n { return 1 }
  if i > n { return 0 }
  if dp[i] != -1 {
    return dp[i]
  }
  dp[i] = recursive(i + 1, n) + recursive(i + 2, n)
  return dp[i]
}
private func climbStairs(_ n: Int) -> Int {
  //   return recursive(0, n)
  return dpTopDownApproch(0, n)

}

func climbStairsDemo() {
  let n = climbStairs(5)
  print(n)
}
