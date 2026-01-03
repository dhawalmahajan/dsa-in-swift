func majorElement(_ arr: [Int]) -> Int {
  var major = arr.first
  var counter = 0
  for item in arr {
    if item == major {
      counter += 1
    } else {
      counter -= 1
    }
    if counter == 0 {
      major = item
      counter = 1
    }
  }
  return major ?? 0
}
