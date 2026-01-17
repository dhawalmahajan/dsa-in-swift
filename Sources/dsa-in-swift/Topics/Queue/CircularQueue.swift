// MARK: - Circular Queue (Fixed Size)

struct CircularQueue<T>: QueueProtocol {
  private var items: [T?]
  private var front = 0
  private var rear = 0
  private(set) var count = 0
  private let capacity: Int

  init(capacity: Int) {
    self.capacity = capacity
    self.items = Array(repeating: nil, count: capacity)
  }

  mutating func enqueue(_ element: T) {
    guard count < capacity else { return }
    items[rear] = element
    rear = (rear + 1) % capacity
    count += 1
  }

  mutating func dequeue() -> T? {
    guard count > 0 else { return nil }
    let element = items[front]
    items[front] = nil
    front = (front + 1) % capacity
    count -= 1
    return element
  }

  func peek() -> T? {
    items[front]
  }

  var isEmpty: Bool {
    count == 0
  }
}
