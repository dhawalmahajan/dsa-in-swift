final class CircularDoublyListNode<Value> {
  var value: Value
  var next: CircularDoublyListNode?
  weak var prev: CircularDoublyListNode?

  init(value: Value, next: CircularDoublyListNode? = nil, prev: CircularDoublyListNode? = nil) {
    self.value = value
    self.next = next
    self.prev = prev
  }
}
