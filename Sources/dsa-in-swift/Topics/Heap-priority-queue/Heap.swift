struct Heap<T: Comparable> {
  private var heap: [T] = []

  mutating func insert(_ value: T) {
    heap.append(value)
    shiftUp(heap.count - 1)
  }

  mutating func extractMin() -> T? {
    guard !heap.isEmpty else { return nil }
    heap.swapAt(0, heap.count - 1)
    let min = heap.removeLast()
    shiftDown(0)
    return min
  }

  func peek() -> T? {
    heap.first
  }

  private mutating func shiftUp(_ index: Int) {
    var child = index
    var parent = (child - 1) / 2
    while child > 0 && heap[child] < heap[parent] {
      heap.swapAt(child, parent)
      child = parent
      parent = (child - 1) / 2
    }
  }

  private mutating func shiftDown(_ index: Int) {
    var parent = index
    while true {
      let left = 2 * parent + 1
      let right = left + 1
      var smallest = parent

      if left < heap.count && heap[left] < heap[smallest] {
        smallest = left
      }
      if right < heap.count && heap[right] < heap[smallest] {
        smallest = right
      }
      if smallest == parent { break }
      heap.swapAt(parent, smallest)
      parent = smallest
    }
  }
}
