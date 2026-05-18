/*
Given a string s, find the length of the longest substring without duplicate characters.



Example 1:

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.
Example 2:

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.


Constraints:

0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.
*/
private func lengthOfLongestSubstring(_ s: String) -> Int {
  var first = 0
  var second = 0
  var length = 0
  let arr = Array(s)
  var count: [Bool] = Array(repeating: false, count: 256)
  while second < arr.count {
    if let asciiValue = arr[second].asciiValue {
      if !count[Int(asciiValue)] {
        count[Int(asciiValue)] = true
        length = max(length, second - first + 1)
        second += 1
      } else {
        if let asciiValue1 = arr[first].asciiValue {
          count[Int(asciiValue1)] = false
          first += 1
        }
      }
    }
  }
  return length
}

func lengthOfLongestSubstringDemo() {
  let s = "abcabcbb"
  let result = lengthOfLongestSubstring(s)
  print("Length of longest substring without repeating characters in '\(s)' is: \(result)")
}
