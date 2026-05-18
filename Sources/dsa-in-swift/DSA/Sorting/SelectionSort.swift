func selectionSort<T: Comparable>(_ array: [T]) -> [T] {
  var arr = array
  let n = arr.count

  for i in 0..<n {
    var minIndex = i
    for j in i + 1..<n {
      if arr[j] < arr[minIndex] {
        minIndex = j
      }
    }
    arr.swapAt(i, minIndex)
  }
  return arr
}
