final class ListNode {
  var val: Int
  var next: ListNode?

  init(_ val: Int, _ next: ListNode? = nil) {
    self.val = val
    self.next = next
  }
}

extension ListNode {

  func printList() {
    var curr: ListNode? = self
    while let node = curr {
      print(node.val, terminator: " -> ")
      curr = node.next
    }
    print("nil")
  }
}
