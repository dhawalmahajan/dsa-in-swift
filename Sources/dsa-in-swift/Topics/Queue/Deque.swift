struct Deque<T> {
  private var items: [T] = []

  mutating func pushFront(_ item: T) {
    items.insert(item, at: 0)
  }

  mutating func pushBack(_ item: T) {
    items.append(item)
  }

  mutating func popFront() -> T? {
    isEmpty ? nil : items.removeFirst()
  }

  mutating func popBack() -> T? {
    items.popLast()
  }

  var isEmpty: Bool {
    items.isEmpty
  }
  func peekFront() -> T? {
    items.first
  }
  func peekBack() -> T? {
    items.last
  }

}
