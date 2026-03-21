// Doubly linked list implementation

class DoublyLinkedList<Value: Equatable> {
  var head: DoublyLinkedListNode<Value>?
  var tail: DoublyLinkedListNode<Value>?

  var isEmpty: Bool { head == nil }

  func insertAtHead(_ value: Value) {
    let node = DoublyLinkedListNode(value: value)
    node.next = head
    head?.prev = node
    head = node
    if tail == nil { tail = node }
  }

  func insertAtTail(_ value: Value) {
    let node = DoublyLinkedListNode(value: value)
    guard let tailNode = tail else {
      head = node
      tail = node
      return
    }
    tailNode.next = node
    node.prev = tailNode
    tail = node
  }

  func insert(_ value: Value, at index: Int) {
    guard index >= 0 else { return }
    if index == 0 {
      insertAtHead(value)
      return
    }

    var current = head
    var i = 0
    while i < index - 1, current != nil {
      current = current?.next
      i += 1
    }

    guard let prevNode = current else {
      insertAtTail(value)
      return
    }

    if prevNode === tail {
      insertAtTail(value)
      return
    }

    let newNode = DoublyLinkedListNode(value: value, next: prevNode.next, prev: prevNode)
    prevNode.next?.prev = newNode
    prevNode.next = newNode
  }

  func find(value: Value) -> DoublyLinkedListNode<Value>? {
    var current = head
    while let node = current {
      if node.value == value { return node }
      current = node.next
    }
    return nil
  }

  func deleteHead() {
    guard let oldHead = head else { return }
    if head === tail {
      head = nil
      tail = nil
      return
    }
    head = oldHead.next
    head?.prev = nil
  }

  func deleteTail() {
    guard let oldTail = tail else { return }
    if head === tail {
      head = nil
      tail = nil
      return
    }
    tail = oldTail.prev
    tail?.next = nil
  }

  func delete(value: Value) {
    guard let node = find(value: value) else { return }
    if node === head {
      deleteHead()
      return
    }
    if node === tail {
      deleteTail()
      return
    }
    node.prev?.next = node.next
    node.next?.prev = node.prev
  }

  func reverse() {
    if head == nil { return }

    var current = head
    var prev: DoublyLinkedListNode<Value>? = nil

    while current != nil {
      let next = current!.next
      current!.next = prev
      current!.prev = next
      prev = current
      current = next
    }

    // Now prev is the new head, and head is the new tail
    tail = head
    head = prev
  }

  func printList() {
    guard !isEmpty else {
      print("Empty doubly linked list")
      return
    }

    var current = head
    while let node = current {
      print(node.value, terminator: " <-> ")
      current = node.next
    }
    print("nil")
  }
}
