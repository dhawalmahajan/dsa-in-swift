// Given two strings 's1' and 's2' and below operations that can performed on
// 's1'. 1.Insert 2.Remove 3.Replace
// Find minimum number of edits (operations) required to convert ‘s1’ into ‘s2’.

// NOTE: All above operations are of equal cost
// Input:   s1 = "car", s2 = "cars"
// Output:  1
// We can convert s1 into s2 by inserting a 's'.

// Program using Dynamic Programming
// TIME COMPLEXITY: O(m*n)

import Foundation

// Utility function to find minimum of three numbers
func minOfThree(_ x: Int, _ y: Int, _ z: Int) -> Int {
  return min(x, min(y, z))
}

func editDistDP(_ s1: String, _ s2: String) -> Int {
  let m = s1.count
  let n = s2.count

  let s1Array = Array(s1)
  let s2Array = Array(s2)

  // Create DP table (m+1) x (n+1)
  var dp = Array(
    repeating: Array(repeating: 0, count: n + 1),
    count: m + 1
  )

  for i in 0...m {
    for j in 0...n {

      // If first string is empty
      if i == 0 {
        dp[i][j] = j
      }
      // If second string is empty
      else if j == 0 {
        dp[i][j] = i
      }
      // If last characters are same
      else if s1Array[i - 1] == s2Array[j - 1] {
        dp[i][j] = dp[i - 1][j - 1]
      }
      // If last characters are different
      else {
        dp[i][j] =
          1
          + minOfThree(
            dp[i][j - 1],  // Insert
            dp[i - 1][j],  // Remove
            dp[i - 1][j - 1]  // Replace
          )
      }
    }
  }

  return dp[m][n]
}

// MARK: - Main
func editDistanceDemo() {

  let s1 = "car"

  let s2 = "cars"

  let result = editDistDP(s1, s2)

  print("Minimum Edit Distance:", result)
}
