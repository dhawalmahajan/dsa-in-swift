func validPalindrome(_ str: String) -> Bool {
  let arr = Array(str)
  return internalValidPalindrome(arr, 0, arr.count - 1, removed: false)
}
private func internalValidPalindrome(_ arr: [Character], _ start: Int, _ end: Int, removed: Bool)
  -> Bool
{
  var i = start
  var j = end
  while i <= j {
    if arr[i] == arr[j] {
      i += 1
      j -= 1
    } else {
      if removed == true {
        return false
      } else {
        return internalValidPalindrome(arr, i + 1, j, removed: true)
          || internalValidPalindrome(arr, i, j - 1, removed: true)
      }
    }
  }
  return true
}
