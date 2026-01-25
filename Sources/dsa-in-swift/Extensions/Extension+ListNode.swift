extension ListNode {

  func printList() {
    var curr: ListNode? = self
    while let node = curr {
      print(node.value, terminator: " -> ")
      curr = node.next
    }
    print("nil")
  }
}
