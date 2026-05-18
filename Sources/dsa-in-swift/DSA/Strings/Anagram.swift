func isAnagram(_ s1: String, _ s2: String) -> Bool {
  guard s1.count == s2.count else { return false }
  var charCount: [Character: Int] = [:]
  for char in s1 {
    charCount[char, default: 0] += 1
  }
  for char in s2 {
    if let count = charCount[char] {
      charCount[char] = count - 1
    } else {
      return false
    }
  }
  return true
}

func anagramDemo() {
  print(isAnagram("heart", "hearb"))
}
