func romanToInt(_ s: String) -> Int {
  var count = 0
  let arr = Array(s)
  for i in 0..<arr.count {
    switch arr[i] {
    case "I":
      if i < arr.count - 1 && (arr[i + 1] == "V" || arr[i + 1] == "X") {
        count -= 1
      } else {
        count += 1
      }
    case "V":
      count += 5
    case "X":
      if i < arr.count - 1 && (arr[i + 1] == "L" || arr[i + 1] == "C") {
        count -= 10
      } else {
        count += 10
      }

    case "L":
      count += 50
    case "C":
      if i < arr.count - 1 && (arr[i + 1] == "D" || arr[i + 1] == "M") {
        count -= 100
      } else {
        count += 100
      }
    case "D":
      count += 500
    case "M":
      count += 1000
    default:
      break

    }
  }
  return count
}
