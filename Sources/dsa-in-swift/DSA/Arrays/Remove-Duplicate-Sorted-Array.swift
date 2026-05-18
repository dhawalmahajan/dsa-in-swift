private func removeDuplicates(_ nums: inout [Int]) -> Int {
  var k = 0
  for i in 0..<nums.count {
    if i == 0 || nums[i] != nums[i - 1] {
      nums[k] = nums[i]
      k += 1
    }
  }
  return k
}
func removeDuplicatesDemo() {
    var nums = [1, 2, 2, 3, 3, 5, 5, 6]
    print(removeDuplicates(&nums))
}
