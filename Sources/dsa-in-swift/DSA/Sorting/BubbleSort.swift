func bubbleSort<T: Comparable>(_ array: [T], _ comparison: (T, T) -> Bool) -> [T] {
  var arr = array

  for i in 0..<arr.count {
    for j in 0..<arr.count - i - 1 {
      if comparison(arr[j], arr[j + 1]) {
        arr.swapAt(j, j + 1)
      }
    }
  }
  return arr
}

func bubbleSortAscending<T: Comparable>(_ array: [T]) -> [T] {
  return bubbleSort(array, >)
}
func bubbleSortDescending<T: Comparable>(_ array: [T]) -> [T] {
  return bubbleSort(array, <)
}
// Example Usage:
func bubbleSortExample() {
  let numbers = [64, 34, 25, 12, 22, 11, 90]
  let sortedAscending = bubbleSortAscending(numbers)
  let sortedDescending = bubbleSortDescending(numbers)
  print("Original array", numbers)

  print(sortedAscending)
  print(sortedDescending)
}
