/*
Given a string str, your task is to find the length of the smallest window that contains all the characters of the given string at least once.

Example:

Input: str = "aabcbcdbca"
Output: 4
Explanation: Sub-String "dbca" has the smallest length that contains all the characters of str.
Input: str = "aaab"
Output: 2
Explanation: Sub-String "ab" has the smallest length that contains all the characters of str.
Input: str = "geeksforgeeks"
Output: 7
Explanation: There are multiple substring with smallest length that contains all characters of str, "eksforg" and "ksforge".
Constraints:
1 ≤ str.size() ≤ 105
str contains only lower-case english alphabets.
*/
private func findSmallestWindowLength(_ str: String) -> Int {
  var count: [Int] = Array(repeating: 0, count: 256)
  var first: Int = 0
  var second: Int = 0
  var diff = 0
  var length: Int = str.count
  while first < str.count {
    let i = str.index(str.startIndex, offsetBy: first)
    if let ascii = str[i].asciiValue, count[Int(ascii)] == 0 {
      diff += 1
      count[Int(ascii)] += 1
    }
    first += 1
  }
  for i in 0...256 {
    count[i] = 0
  }
  first = 0
  while second < str.count {
    while diff > 0 && second < str.count {
      let i = str.index(str.startIndex, offsetBy: second)
      if let ascii = str[i].asciiValue {
        if count[Int(ascii)] == 0 {
          diff -= 1
        }
        count[Int(ascii)] += 1
        second += 1
      }
    }
    length = min(length, second - first)
  }
  for char in str {
    if let i = char.asciiValue {
      let index = Int(i)
      count[index] += 1
    }

  }
  return length
}
