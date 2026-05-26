func majority(_ arr: [Int]) -> [Int] {
  var dict: [Int: Int] = [:]
  var result: [Int] = []
  for item in arr {
    if dict[item] != nil {
      dict[item] = (dict[item] ?? -1) + 1
    } else {
      dict[item] = 1
    }
  }
  for (key, val) in dict {
    if val >= arr.count / 3 {
      result.append(key)
    }
  }
  return result
}

func majorityDemo() {
    print(majority([1,2,1,2,2,4,5,3,8]))
    print(majorElement([1,2,1,2,2,4,5,3,8]))
}
