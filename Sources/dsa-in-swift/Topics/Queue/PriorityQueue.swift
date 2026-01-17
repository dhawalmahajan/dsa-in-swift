// MARK: - Priority Queue (Custom Comparator)

struct PriorityQueue<T>: QueueProtocol {
  private var heap: [T] = []
  private let isHigherPriority: (T, T) -> Bool

  init(sort: @escaping (T, T) -> Bool) {
    self.isHigherPriority = sort
  }

  mutating func enqueue(_ element: T) {
    heap.append(element)
    siftUp(from: heap.count - 1)
  }

  mutating func dequeue() -> T? {
    guard !heap.isEmpty else { return nil }
    if heap.count == 1 {
      return heap.removeLast()
    }
    let value = heap[0]
    heap[0] = heap.removeLast()
    siftDown(from: 0)
    return value
  }

  func peek() -> T? {
    heap.first
  }

  var isEmpty: Bool {
    heap.isEmpty
  }

  var count: Int {
    heap.count
  }

  // MARK: - Heap Helpers

  private mutating func siftUp(from index: Int) {
    var child = index
    var parent = (child - 1) / 2

    while child > 0 && isHigherPriority(heap[child], heap[parent]) {
      heap.swapAt(child, parent)
      child = parent
      parent = (child - 1) / 2
    }
  }

  private mutating func siftDown(from index: Int) {
    var parent = index

    while true {
      let left = 2 * parent + 1
      let right = left + 1
      var candidate = parent

      if left < heap.count && isHigherPriority(heap[left], heap[candidate]) {
        candidate = left
      }

      if right < heap.count && isHigherPriority(heap[right], heap[candidate]) {
        candidate = right
      }

      if candidate == parent { return }
      heap.swapAt(parent, candidate)
      parent = candidate
    }
  }
}
