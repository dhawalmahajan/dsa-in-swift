func bucketSort(_ array: [Double]) -> [Double] {
  let bucketCount = array.count
  var buckets = Array(repeating: [Double](), count: bucketCount)

  for value in array {
    let index = Int(value * Double(bucketCount))
    buckets[index].append(value)
  }

  for i in 0..<bucketCount {
    buckets[i] = buckets[i].sorted()
  }

  return buckets.flatMap { $0 }
}
func bucketSortDemo() {
  let array: [Double] = [0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51]
  let sortedArray = bucketSort(array)
  print("Original array: \(array)")
  print("Sorted array: \(sortedArray)")
}
