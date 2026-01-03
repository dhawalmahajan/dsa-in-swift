func firstUniqueChar(in str: String) -> Int {
  let arr = Array(str)
  var dict: [Character: Bool] = [:]
  for item in arr {
    if dict[item] != nil {
      dict[item] = false
    } else {
      dict[item] = true
    }
  }
  for (index, item) in arr.enumerated() {
    if dict[item] == true {
      return index
    }
  }
  return -1
}
