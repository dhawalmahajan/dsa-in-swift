func rotateArray(_ arr: inout [Int], d: Int) {
  let aux = Array(arr[0..<d])
  for index in d..<arr.count {
    arr[index - d] = arr[index]
  }
  for i in 0..<d {
    arr[arr.count - d + i] = aux[i]
  }
  print("Rotated Array: \(arr)")
}
func rotateArrayDemo() {
  var arr = [1, 2, 3, 4, 5, 6, 7]
  let d = 2
  print("Original Array: \(arr)")
  rotateArray(&arr, d: d)
}
