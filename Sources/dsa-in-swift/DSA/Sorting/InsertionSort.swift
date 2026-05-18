func insertionSort<T: Comparable>(_ array: inout [T], n: Int) {
  for i in 1..<n {
    let temp = array[i]
    var j = i - 1
    while j >= 0 && array[j] > temp {
      array[j + 1] = array[j]
      j -= 1
    }
    array[j + 1] = temp
  }
}

func insertionSortExample() {
  var arr = [12, 11, 13, 5, 6]
  print("Original array:", arr)
  insertionSort(&arr, n: arr.count)
  print("Sorted array:", arr)
}
