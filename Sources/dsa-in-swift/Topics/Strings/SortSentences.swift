/*
A sentence is a list of words that are separated by a single space with no leading or trailing spaces. Each word consists of lowercase and uppercase English letters.

A sentence can be shuffled by appending the 1-indexed word position to each word then rearranging the words in the sentence.

For example, the sentence "This is a sentence" can be shuffled as "sentence4 a3 is2 This1" or "is2 sentence4 This1 a3".
Given a shuffled sentence s containing no more than 9 words, reconstruct and return the original sentence.



Example 1:

Input: s = "is2 sentence4 This1 a3"
Output: "This is a sentence"
Explanation: Sort the words in s to their original positions "This1 is2 a3 sentence4", then remove the numbers.
Example 2:

Input: s = "Myself2 Me1 I4 and3"
Output: "Me Myself and I"
Explanation: Sort the words in s to their original positions "Me1 Myself2 and3 I4", then remove the numbers.


Constraints:

2 <= s.length <= 200
s consists of lowercase and uppercase English letters, spaces, and digits from 1 to 9.
The number of words in s is between 1 and 9.
The words in s are separated by a single space.
s contains no leading or trailing spaces.
*/

//runtime - 7ms
private func sortSentence(_ s: String) -> String {
  let words = s.split(separator: " ")
  let sortedWords = words.sorted { word1, word2 in
    guard let last1 = word1.last, let last2 = word2.last,
      let index1 = Int(String(last1)), let index2 = Int(String(last2))
    else {
      return false
    }
    return index1 < index2
  }
  return sortedWords.map { String($0.dropLast()) }.joined(separator: " ")
}

//runtime - 0ms
func alternateSortSentence(_ s: String) -> String {
  var indices: [String.Index?] = []
  for _ in 0...9 {
    indices.append(nil)
  }
  var current = s.startIndex
  for iS in s.indices {
    let ch = s[iS]
    if ch == " " {
      current = s.index(after: iS)
    } else if let ascii = ch.asciiValue, ascii < 58 {
      if let i = Int("\(ch)") {
        indices[i] = current
      }
    }
  }
  var r = ""
  for n in 1...9 {
    if var iS = indices[n] {
      while true {
        let ch = s[iS]
        if let ascii = ch.asciiValue, ascii < 58 {
          break
        }
        r.append(ch)
        iS = s.index(after: iS)
        if iS == s.endIndex {
          break
        }
      }
      r.append(" ")
    }
  }
  r.removeLast()
  return r
}

func sortSentenceDemo() {
  let s = "is2 sentence4 This1 a3"
  print(alternateSortSentence(s))  // Output: "This is a sentence"
}
