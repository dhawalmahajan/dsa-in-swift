func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
  guard array.count > 1 else { return array }

  let mid = array.count / 2
  let left = mergeSort(Array(array[..<mid]))
  let right = mergeSort(Array(array[mid...]))

  return merge(left, right)
}

private func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
  var result: [T] = []
  var i = 0
  var j = 0

  while i < left.count && j < right.count {
    if left[i] <= right[j] {
      result.append(left[i])
      i += 1
    } else {
      result.append(right[j])
      j += 1
    }
  }

  result.append(contentsOf: left[i...])
  result.append(contentsOf: right[j...])

  return result
}
func mergeSortDemo() {
  let array = [38, 27, 43, 3, 9, 82, 10]
  let sortedArray = mergeSort(array)
  print("Original array: \(array)")
  print("Sorted array: \(sortedArray)")
}
