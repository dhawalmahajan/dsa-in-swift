// MARK: - Queue Protocol (Common for all Queues)

protocol QueueProtocol {
  associatedtype Element

  mutating func enqueue(_ element: Element)
  mutating func dequeue() -> Element?
  func peek() -> Element?
  var isEmpty: Bool { get }
  var count: Int { get }
}

// MARK: - Simple Queue (FIFO)

struct SimpleQueue<T>: QueueProtocol {
  private var items: [T] = []

  mutating func enqueue(_ element: T) {
    items.append(element)
  }

  mutating func dequeue() -> T? {
    isEmpty ? nil : items.removeFirst()
  }

  func peek() -> T? {
    items.first
  }

  var isEmpty: Bool {
    items.isEmpty
  }

  var count: Int {
    items.count
  }
}
