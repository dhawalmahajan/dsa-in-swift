extension String {

  func charArray() -> [Character] {
    Array(self)
  }

  func reversedString() -> String {
    String(self.reversed())
  }
}
