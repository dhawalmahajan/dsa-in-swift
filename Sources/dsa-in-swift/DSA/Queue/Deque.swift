// MARK: - Deque (Double Ended Queue)

struct Deque<T>: QueueProtocol {
  private var items: [T] = []

  mutating func enqueue(_ element: T) {
    items.append(element)  // enqueue at rear
  }

  mutating func enqueueFront(_ element: T) {
    items.insert(element, at: 0)
  }

  mutating func dequeue() -> T? {
    isEmpty ? nil : items.removeFirst()
  }

  mutating func dequeueRear() -> T? {
    isEmpty ? nil : items.removeLast()
  }

  func peek() -> T? {
    items.first
  }

  func peekRear() -> T? {
    items.last
  }

  var isEmpty: Bool {
    items.isEmpty
  }

  var count: Int {
    items.count
  }
}
