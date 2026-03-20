extension SinglyListNode {

  func printList() {
    var curr: SinglyListNode? = self
    while let node = curr {
      print(node.value, terminator: " -> ")
      curr = node.next
    }
    print("nil")
  }
}
