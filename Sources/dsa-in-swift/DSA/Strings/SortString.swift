/*
Given a string consisting of lowercase letters, arrange all its letters in ascending order.

Example 1:

Input:
S = "edcab"
Output: "abcde"
Explanation: characters are in ascending
order in "abcde".
Example 2:

Input:
S = "xzy"
Output: "xyz"
Explanation: characters are in ascending
order in "xyz".


Your Task:
You don't need to read input or print anything. Your task is to complete the function sort() which takes the string as inputs and returns the modified string.

Expected Time Complexity: O(|S| * log |S|)
Expected Auxiliary Space: O(1)

Constraints:
1 ≤ |S| ≤ 105
S contains only lowercase alphabets.
*/

private func sortString(s: String) -> String {
  var alpha = [Int](repeating: 0, count: 26)
  for char in s {
    if let ascii = char.asciiValue, let aAscii = Character("a").asciiValue {
      let index = Int(ascii - aAscii)
      alpha[index] += 1
    }
  }
  var ans = ""
  for i in 0..<26 {
    if let aAscii = Character("a").asciiValue {
      let c = Character(UnicodeScalar(UInt8(i) + aAscii))
      while alpha[i] > 0 {
        ans.append(c)
        alpha[i] -= 1
      }
    }

  }
  return ans
}

func sortStringDemo() {
  let S = "edcab"
  print(sortString(s: S))
}
