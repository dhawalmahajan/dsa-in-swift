/*
Given two strings s1 and s2. Return true if the string s2 can be obtained by rotating (in any direction) string s1 by exactly 2 places, otherwise, false.

Note: Both rotations should be performed in same direction chosen initially.

Examples:

Input: s1 = "amazon", s2 = "azonam"
Output: true
Explanation: "amazon" can be rotated anti-clockwise by two places, which will make it as "azonam".
Input: s1 = "geeksforgeeks", s2 = "geeksgeeksfor"
Output: false
Explanation: If we rotate "geeksforgeeks" by two place in any direction, we won't get "geeksgeeksfor".
Input: s1 = "ab", s2 = "ab"
Output: true
Explanation: If we rotate "ab" by two place in any direction, we always get "ab".
Constraints:
1 ≤ s1.length, s2.length ≤ 105

*/

private func isRotated(s1: String, s2: String) -> Bool {
  if s1.count != s2.count {
    return false
  }
  let n = s1.count
  if n < 2 {
    return s1 == s2
  }
  // Clockwise rotation by 2 places: move last 2 characters to front
  let clockwise = String(s1.suffix(2)) + String(s1.prefix(n - 2))
  // Anti-clockwise rotation by 2 places: move first 2 characters to end
  let antiClockwise = String(s1.suffix(n - 2)) + String(s1.prefix(2))
  return s2 == clockwise || s2 == antiClockwise
}
private func isRotatedDSAWay(s1: String, s2: String) -> Bool {
  if s1.count != s2.count {
    return false
  }
  let n = s1.count
  if n < 2 {
    return s1 == s2
  }
  let s1Chars = Array(s1)
  let s2Chars = Array(s2)
  // Clockwise rotation by 2 places
  let clockwise = Array(s1Chars[n - 2..<n]) + Array(s1Chars[0..<n - 2])

  // Anti-clockwise rotation by 2 places
  let antiClockwise = Array(s1Chars[2..<n]) + Array(s1Chars[0..<2])

  return s2Chars == clockwise || s2Chars == antiClockwise
}

func isRotatedDemo() {
  // let rotated = isRotated(s1: "amazon", s2: "azonam")
  let rotated = isRotatedDSAWay(s1: "geeksforgeeks", s2: "geeksgeeksfor")
  print(rotated)
}

func rotateClockwise(clockwise: String) {

}
