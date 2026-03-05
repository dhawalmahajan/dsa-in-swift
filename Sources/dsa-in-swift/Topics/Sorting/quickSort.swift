func quickSort<T: Comparable>(_ array: [T]) -> [T] {
  guard array.count > 1 else { return array }

  let pivot = array[array.count / 2]

  let less = array.filter { $0 < pivot }
  let equal = array.filter { $0 == pivot }
  let greater = array.filter { $0 > pivot }

  return quickSort(less) + equal + quickSort(greater)
}

func quickSortDemo() {
  let array = [38, 27, 43, 3, 9, 82, 10]
  let sortedArray = quickSort(array)
  print("Original array: \(array)")
  print("Sorted array: \(sortedArray)")
}
