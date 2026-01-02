func isPalindromicString(str: String) -> Bool {
  return str.charArray() == str.reversedString().charArray()
}
