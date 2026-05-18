final class DoublyLinkedListNode<Value> {
  var value: Value
  var next: DoublyLinkedListNode?
  weak var prev: DoublyLinkedListNode?

  init(value: Value, next: DoublyLinkedListNode? = nil, prev: DoublyLinkedListNode? = nil) {
    self.value = value
    self.next = next
    self.prev = prev
  }
}
