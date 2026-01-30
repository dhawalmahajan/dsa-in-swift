/*
A pangram is a sentence where every letter of the English alphabet appears at least once.

Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or false otherwise.



Example 1:

Input: sentence = "thequickbrownfoxjumpsoverthelazydog"
Output: true
Explanation: sentence contains at least one of every letter of the English alphabet.
Example 2:

Input: sentence = "leetcode"
Output: false


Constraints:

1 <= sentence.length <= 1000
sentence consists of lowercase English letters.
*/
private func checkIfPangram(_ sentence: String) -> Bool {
  let chars = Array(sentence)
  let sets: Set<Character> = Set(chars)
  return sets.count == 26
}

private func swiftApproch(_ sentence: String) -> Bool {
  let letters = Set(sentence)
  return letters.count == 26
}

func pangramDemo() {
  let sentence = "thequickbrownfoxjumpsoverthelazydog"
  print(checkIfPangram(sentence))
}
