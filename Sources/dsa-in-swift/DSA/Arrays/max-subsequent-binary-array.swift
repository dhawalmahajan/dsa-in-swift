func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
  var globalCount = 0
  var localCount = 0
  for num in nums {
    if num == 1 {
      localCount += 1
      globalCount = max(globalCount, localCount)
    } else {
      localCount = 0
    }

  }
  return globalCount
}
