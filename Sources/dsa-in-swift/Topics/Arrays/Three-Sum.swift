/*
Input: [-1, 0, 1, 2, -1, -4]
Output: [-1, -1, 2]
         [-1, 0, 1]

Input: []
Output: []
*/

private func findTriplet(_ arr: [Int], sum: Int) {
  guard arr.count >= 3 else {
    print("[]")
    return
  }
  let sorted = arr.sorted()
  let n = sorted.count
  var flag = false
  for i in 0..<n - 2 {
    if i > 0 && sorted[i] == sorted[i - 1] {
      continue
    }
    var start = i + 1
    var end = n - 1
    let target = sum - sorted[i]
    while start < end {
      // Skip duplicates for the second element
      if start > i + 1 && sorted[start] == sorted[start - 1] {
        start += 1
        continue
      }
      // Skip duplicates for the third element
      if end < n - 1 && sorted[end] == sorted[end + 1] {
        end -= 1
        continue
      }

      let currentSum = sorted[start] + sorted[end]

      if target == currentSum {
        print("[\(sorted[i]), \(sorted[start]), \(sorted[end])]")
        flag = true
        start += 1
        end -= 1
      } else if target > currentSum {
        start += 1
      } else {
        end -= 1
      }
    }
  }

  if !flag {
    print("No Such Triplets Exist")
  }

}

func solveThreeSum() {
  // Test cases
  let arr1 = [-1, 0, 1, 2, -1, -4]
  print("Input: \(arr1)")
  print("Output:", terminator: " ")
  findTriplet(arr1, sum: 0)

  let arr2: [Int] = []
  print("\nInput: \(arr2)")
  print("Output:", terminator: " ")
  findTriplet(arr2, sum: 0)

}
