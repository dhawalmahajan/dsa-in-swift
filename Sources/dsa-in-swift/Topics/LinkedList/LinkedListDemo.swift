func linkedList() {
  print("===== LINKED LIST DEMO =====")

  // Change isCircular to true to test Circular Linked List
  let list = LinkedList<Int>(isCircular: false)

  print("\n➡️ Insert at Head")
  list.insertAtHead(5)
  list.insertAtHead(4)
  list.insertAtHead(3)
  list.insertAtHead(2)
  list.insertAtHead(1)
  list.printList()
  // Expected: 1 -> 2 -> 3 -> 4 -> 5 -> nil

  print("\n➡️ Insert at Tail")
  list.insertAtTail(6)
  list.insertAtTail(7)
  list.printList()
  // Expected: 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> nil

  print("\n➡️ Insert at Index")
  list.insert(99, at: 3)
  list.printList()
  // Expected: 1 -> 2 -> 3 -> 99 -> 4 -> 5 -> 6 -> 7 -> nil

  print("\n➡️ Search Operation")
  if let node = list.find(value: 4) {
    print("Found node with value:", node.value)
  } else {
    print("Value not found")
  }

  print("\n➡️ Delete Head")
  list.deleteHead()
  list.printList()
  // Expected: 2 -> 3 -> 99 -> 4 -> 5 -> 6 -> 7 -> nil

  print("\n➡️ Delete Tail")
  list.deleteTail()
  list.printList()
  // Expected: 2 -> 3 -> 99 -> 4 -> 5 -> 6 -> nil

  print("\n➡️ Delete by Value (99)")
  list.delete(99)
  list.printList()
  // Expected: 2 -> 3 -> 4 -> 5 -> 6 -> nil

  print("\n➡️ Reverse List")
  list.reverse()
  list.printList()
  // Expected: 6 -> 5 -> 4 -> 3 -> 2 -> nil

  print("\n➡️ Search After Reverse")
  print(list.find(value: 3) != nil ? "3 found" : "3 not found")

  print("\n===== DEMO COMPLETE =====\n")
}
func circularLinkedListDemo() {
  print("===== CIRCULAR LINKED LIST DEMO =====")

  let list = LinkedList<Int>(isCircular: true)

  print("\n➡️ Insert at Head")
  list.insertAtHead(5)
  list.insertAtHead(4)
  list.insertAtHead(3)
  list.insertAtHead(2)
  list.insertAtHead(1)
  list.printList()
  // Expected: 1 -> 2 -> 3 -> 4 -> 5 -> (back to head)

  print("\n➡️ Insert at Tail")
  list.insertAtTail(6)
  list.insertAtTail(7)
  list.printList()
  // Expected: 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> (back to head)

  print("\n➡️ Insert at Index")
  list.insert(99, at: 3)
  list.printList()
  // Expected: 1 -> 2 -> 3 -> 99 -> 4 -> 5 -> 6 -> 7 -> (back to head)

  print("\n➡️ Search Operation")
  if let node = list.find(value: 4) {
    print("Found node with value:", node.value)
  } else {
    print("Value not found")
  }

  print("\n➡️ Delete Head")
  list.deleteHead()
  list.printList()
  // Expected: 2 -> 3 -> 99 -> 4 -> 5 -> 6 -> 7 -> (back to head)

  print("\n➡️ Delete Tail")
  list.deleteTail()
  list.printList()
  // Expected: 2 -> 3 -> 99 -> 4 -> 5 -> 6 -> (back to head)

  print("\n➡️ Delete by Value (99)")
  list.delete(99)
  list.printList()
  // Expected: 2 -> 3 -> 4 -> 5 -> 6 -> (back to head)

  print("\n⚠️ Reverse Operation")
  print("Reverse is NOT recommended for circular lists unless explicitly handled.")
  // list.reverse()  // ❌ Do not call unless you implemented circular-safe reverse

  print("\n===== CIRCULAR DEMO COMPLETE =====\n")
}
