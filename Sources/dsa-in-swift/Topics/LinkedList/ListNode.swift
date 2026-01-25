final class ListNode<Value> {
  var value: Value
  var next: ListNode?

  init(_ value: Value, _ next: ListNode? = nil) {
    self.value = value
    self.next = next
  }
}
