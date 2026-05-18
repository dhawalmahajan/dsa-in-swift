func heapSort<T: Comparable>(_ array: [T]) -> [T] {
  var arr = array
  let n = arr.count

  func heapify(_ n: Int, _ i: Int) {
    var largest = i
    let left = 2 * i + 1
    let right = 2 * i + 2

    if left < n && arr[left] > arr[largest] {
      largest = left
    }
    if right < n && arr[right] > arr[largest] {
      largest = right
    }

    if largest != i {
      arr.swapAt(i, largest)
      heapify(n, largest)
    }
  }

  for i in stride(from: n / 2 - 1, through: 0, by: -1) {
    heapify(n, i)
  }

  for i in stride(from: n - 1, through: 0, by: -1) {
    arr.swapAt(0, i)
    heapify(i, 0)
  }

  return arr
}

func heapSortDemo() {
  let array = [38, 27, 43, 3, 9, 82, 10]
  let sortedArray = heapSort(array)
  print("Original array: \(array)")
  print("Sorted array: \(sortedArray)")
}
