final class SinglyListNode<Value> {
  var value: Value
  var next: SinglyListNode?

  init(value: Value, _ next: SinglyListNode? = nil) {
    self.value = value
    self.next = next
  }
}
