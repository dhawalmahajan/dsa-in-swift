struct Stack<T> {
  private var items: [T] = []

  mutating func push(_ item: T) {
    items.append(item)
  }

  mutating func pop() -> T? {
    items.popLast()
  }

  func peek() -> T? {
    items.last
  }

  var isEmpty: Bool {
    items.isEmpty
  }
}
