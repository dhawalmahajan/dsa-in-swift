struct Queue<T> {
  private var items: [T] = []

  mutating func enqueue(_ item: T) {
    items.append(item)
  }

  mutating func dequeue() -> T? {
    isEmpty ? nil : items.removeFirst()
  }

  var isEmpty: Bool {
    items.isEmpty
  }

  func peek() -> T? {
    items.first
  }
}
