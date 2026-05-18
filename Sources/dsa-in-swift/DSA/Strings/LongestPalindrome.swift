/*
Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome.



Example 1:

Input: s = "abccccdd"
Output: 7
Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
Example 2:

Input: s = "a"
Output: 1
Explanation: The longest palindrome that can be built is "a", whose length is 1.


Constraints:

1 <= s.length <= 2000
s consists of lowercase and/or uppercase English letters only.
*/
private func longestPalindrome(_ s: String) -> Int {

  var count = [Character: Int]()
  var res = 0

  for str in s {
    count[str, default: 0] += 1
    if let cnt = count[str] {
      if cnt % 2 == 0 {
        res += 2
      }
    }
  }

  for cnt in count.values {
    if cnt % 2 != 0 {
      res += 1
      break
    }
  }
  return res
}
func longestPalindromeDemo() {
  let str = "abccccdd"
  print(longestPalindrome(str))
}
