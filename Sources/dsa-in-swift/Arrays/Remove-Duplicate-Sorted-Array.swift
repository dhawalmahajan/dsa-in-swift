func removeDuplicates(_ nums: inout [Int]) -> Int {
  var k = 0
  for i in 0..<nums.count {
    if i == 0 || nums[i] != nums[i - 1] {
      nums[k] = nums[i]
      k += 1
    }
  }
  return k
}
