/*
Given a 0-indexed string s, permute s to get a new string t such that:

All consonants remain in their original places. More formally, if there is an index i with 0 <= i < s.length such that s[i] is a consonant, then t[i] = s[i].
The vowels must be sorted in the nondecreasing order of their ASCII values. More formally, for pairs of indices i, j with 0 <= i < j < s.length such that s[i] and s[j] are vowels, then t[i] must not have a higher ASCII value than t[j].
Return the resulting string.

The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in lowercase or uppercase. Consonants comprise all letters that are not vowels.



Example 1:

Input: s = "lEetcOde"
Output: "lEOtcede"
Explanation: 'E', 'O', and 'e' are the vowels in s; 'l', 't', 'c', and 'd' are all consonants. The vowels are sorted according to their ASCII values, and the consonants remain in the same places.
Example 2:

Input: s = "lYmpH"
Output: "lYmpH"
Explanation: There are no vowels in s (all characters in s are consonants), so we return "lYmpH".


Constraints:

1 <= s.length <= 105
s consists only of letters of the English alphabet in uppercase and lowercase.
*/

private func sortVowels(_ s: String) -> String {
  let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
  var chars = Array(s)
  var vowelList: [Character] = []
  var vowelIndices: [Int] = []
  for (index, char) in chars.enumerated() {
    if vowels.contains(char) {
      vowelList.append(char)
      vowelIndices.append(index)
    }
  }
  vowelList.sort()
  for (i, index) in vowelIndices.enumerated() {
    chars[index] = vowelList[i]
  }
  return String(chars)
}
func sortVowelsDemo() {
  let s = "lEetcOde"
  print(sortVowels(s))
}
