// Doubly linked list implementation with optional circular behavior

final class DoublyListNode<Value> {
  var value: Value
  var next: DoublyListNode?
  weak var prev: DoublyListNode?

  init(value: Value, next: DoublyListNode? = nil, prev: DoublyListNode? = nil) {
    self.value = value
    self.next = next
    self.prev = prev
  }
}

class DoublyLinkedList<Value: Equatable> {
  var head: DoublyListNode<Value>?
  var tail: DoublyListNode<Value>?
  private let isCircular: Bool

  init(isCircular: Bool = false) {
    self.isCircular = isCircular
  }

  var isEmpty: Bool { head == nil }

  private func connectEndsIfCircular() {
    guard isCircular, let head = head, let tail = tail else { return }
    head.prev = tail
    tail.next = head
  }

  private func disconnectEndsIfNonCircular() {
    guard !isCircular else { return }
    head?.prev = nil
    tail?.next = nil
  }

  func insertAtHead(_ value: Value) {
    let node = DoublyListNode(value: value)

    if isEmpty {
      head = node
      tail = node
      if isCircular { connectEndsIfCircular() }
      return
    }

    node.next = head
    head?.prev = node
    head = node

    if isCircular {
      connectEndsIfCircular()
    } else {
      disconnectEndsIfNonCircular()
    }
  }

  func insertAtTail(_ value: Value) {
    let node = DoublyListNode(value: value)

    if isEmpty {
      head = node
      tail = node
      if isCircular { connectEndsIfCircular() }
      return
    }

    tail?.next = node
    node.prev = tail
    tail = node

    if isCircular {
      connectEndsIfCircular()
    } else {
      disconnectEndsIfNonCircular()
    }
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
      if isCircular, current?.next === head { break }
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

    let newNode = DoublyListNode(value: value, next: prevNode.next, prev: prevNode)
    prevNode.next?.prev = newNode
    prevNode.next = newNode

    if isCircular {
      connectEndsIfCircular()
    }
  }

  func find(value: Value) -> DoublyListNode<Value>? {
    var current = head

    if isCircular {
      guard current != nil else { return nil }
      repeat {
        if current?.value == value { return current }
        current = current?.next
      } while current !== head
      return nil
    }

    while current != nil {
      if current?.value == value { return current }
      current = current?.next
    }

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
    if isCircular {
      head?.prev = tail
      connectEndsIfCircular()
    } else {
      head?.prev = nil
      disconnectEndsIfNonCircular()
    }
  }

  func deleteTail() {
    guard !isEmpty else { return }

    if head === tail {
      head = nil
      tail = nil
      return
    }

    tail = tail?.prev
    if isCircular {
      tail?.next = head
      connectEndsIfCircular()
    } else {
      tail?.next = nil
      disconnectEndsIfNonCircular()
    }
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

    if isCircular {
      connectEndsIfCircular()
    }
  }

  func reverse() {
    guard !isEmpty else { return }

    let originalHead = head
    let originalTail = tail
    var current = head

    if isCircular {
      repeat {
        guard let node = current else { break }

        swap(&node.next, &node.prev)
        current = node.prev
      } while current !== originalHead

      head = originalTail
      tail = originalHead
      connectEndsIfCircular()
      return
    }

    while let node = current {
      swap(&node.next, &node.prev)
      current = node.prev
    }

    tail = head
    head = originalTail
    disconnectEndsIfNonCircular()
  }

  func printList() {
    guard !isEmpty else {
      print("Empty doubly linked list")
      return
    }

    var current = head

    if isCircular {
      repeat {
        print(current!.value, terminator: " <-> ")
        current = current?.next
      } while current !== head
      print("(back to head)")
      return
    }

    while current != nil {
      print(current!.value, terminator: " <-> ")
      current = current?.next
    }

    print("nil")
  }
}
