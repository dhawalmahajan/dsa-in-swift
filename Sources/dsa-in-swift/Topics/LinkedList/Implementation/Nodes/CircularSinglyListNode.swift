final class CircularSinglyListNode<Value> {
  var value: Value
  var next: CircularSinglyListNode?

  init(value: Value, next: CircularSinglyListNode? = nil) {
    self.value = value
    self.next = next
  }
}
