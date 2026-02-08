private func findSecondLargestSinglePass(from array: [Int]) -> Int? {
  guard array.count >= 2 else { return nil }
  var largest = Int.min
  var secondLargest = Int.min

  for n in array {
    if n > largest {
      secondLargest = largest
      largest = n
    } else if n > secondLargest && n < largest {
      secondLargest = n
    }

  }
  return secondLargest
}

func secondLargestDemo() {
  let array = [3, 5, 1, 4, 2, 6]
  if let secondLargest = findSecondLargestSinglePass(from: array) {
    print("The second largest element is \(secondLargest).")
  } else {
    print("The array does not have a second largest element.")
  }
}
