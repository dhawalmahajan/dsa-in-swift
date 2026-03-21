// Circular Doubly Linked List implementation

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

class CircularDoublyLinkedList<Value: Equatable> {
  var head: CircularDoublyListNode<Value>?
  var tail: CircularDoublyListNode<Value>?

  var isEmpty: Bool { head == nil }

  private func connectEnds() {
    guard let head = head, let tail = tail else { return }
    head.prev = tail
    tail.next = head
  }

  func insertAtHead(_ value: Value) {
    let node = CircularDoublyListNode(value: value)

    if isEmpty {
      head = node
      tail = node
      connectEnds()
      return
    }

    node.next = head
    head?.prev = node
    head = node
    connectEnds()
  }

  func insertAtTail(_ value: Value) {
    let node = CircularDoublyListNode(value: value)

    if isEmpty {
      insertAtHead(value)
      return
    }

    tail?.next = node
    node.prev = tail
    tail = node
    connectEnds()
  }

  func insert(_ value: Value, at index: Int) {
    guard index >= 0 else { return }
    if index == 0 {
      insertAtHead(value)
      return
    }

    var current = head
    var i = 0

    while i < index - 1, current?.next !== head {
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

    let newNode = CircularDoublyListNode(value: value, next: prevNode.next, prev: prevNode)
    prevNode.next?.prev = newNode
    prevNode.next = newNode
    connectEnds()
  }

  func find(value: Value) -> CircularDoublyListNode<Value>? {
    var current = head

    if current == nil { return nil }

    repeat {
      if current?.value == value { return current }
      current = current?.next
    } while current !== head

    return nil
  }

  func deleteHead() {
    guard !isEmpty else { return }

    if head === tail {
      head = nil
      tail = nil
      return
    }

    head = head?.next
    head?.prev = tail
    connectEnds()
  }

  func deleteTail() {
    guard !isEmpty else { return }

    if head === tail {
      head = nil
      tail = nil
      return
    }

    tail = tail?.prev
    tail?.next = head
    connectEnds()
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
    connectEnds()
  }

  func reverse() {
    guard !isEmpty else { return }

    let originalHead = head
    let originalTail = tail
    var current = head

    repeat {
      guard let node = current else { break }
      swap(&node.next, &node.prev)
      current = node.prev
    } while current !== originalHead

    head = originalTail
    tail = originalHead
    connectEnds()
  }

  func printList() {
    guard !isEmpty else {
      print("Empty circular doubly linked list")
      return
    }

    var current = head

    repeat {
      print(current!.value, terminator: " <-> ")
      current = current?.next
    } while current !== head

    print("(back to head)")
  }
}
