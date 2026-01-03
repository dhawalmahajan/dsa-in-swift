func internalCountAndSay(_ nums: [Int]) -> [Int] {
  guard !nums.isEmpty else { return [] }
  var res: [Int] = []
  var curr = nums[0]
  var count = 1
  for i in 1..<nums.count {
    let item = nums[i]
    if curr == item {
      count += 1
    } else {
      res.append(count)
      res.append(curr)
      curr = item
      count = 1
    }
  }
  res.append(count)
  res.append(curr)
  return res
}
func countAndSay(_ n: Int) -> [Int] {
  var res = [1]
  if n <= 0 {
    return res
  }
  for _ in 1..<n {
    res = internalCountAndSay(res)
  }
  return res
}
