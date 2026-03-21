class SinglyLinkedList<Value: Equatable> {
  var head: SinglyListNode<Value>?
  var tail: SinglyListNode<Value>?

  var isEmpty: Bool {
    return head == nil
  }

  func insertAtHead(_ value: Value) {
    let newNode = SinglyListNode(value: value)

    if isEmpty {
      head = newNode
      tail = newNode
      return
    }

    newNode.next = head
    head = newNode
  }

  func insertAtTail(_ value: Value) {
    let newNode = SinglyListNode(value: value)

    if isEmpty {
      insertAtHead(value)
      return
    }

    tail?.next = newNode
    tail = newNode
  }

  func insert(_ value: Value, at index: Int) {
    if index < 0 { return }

    if index == 0 {
      insertAtHead(value)
      return
    }

    var current = head
    var currentIndex = 0

    while currentIndex < index - 1 && current?.next != nil {
      current = current?.next
      currentIndex += 1
    }

    let newNode = SinglyListNode(value: value)
    newNode.next = current?.next
    current?.next = newNode

    if current === tail {
      tail = newNode
    }
  }

  func find(value: Value) -> SinglyListNode<Value>? {
    var current = head

    while current != nil {
      if current?.value == value {
        return current
      }
      current = current?.next
    }

    return nil
  }

  func deleteHead() {
    if isEmpty { return }

    if head === tail {
      head = nil
      tail = nil
      return
    }

    head = head?.next
  }

  func deleteTail() {
    if isEmpty { return }

    if head === tail {
      head = nil
      tail = nil
      return
    }

    var current = head
    while current?.next !== tail {
      current = current?.next
    }

    current?.next = nil
    tail = current
  }

  func delete(_ value: Value) {
    if isEmpty { return }

    var current = head
    var previous: SinglyListNode<Value>?

    while current != nil {
      if current?.value == value {
        if current === head {
          deleteHead()
        } else if current === tail {
          deleteTail()
        } else {
          previous?.next = current?.next
        }
        return
      }
      previous = current
      current = current?.next
    }
  }

  func reverse() {
    var previous: SinglyListNode<Value>?
    var current = head
    var next: SinglyListNode<Value>?
    while current != nil {
      next = current?.next
      current?.next = previous
      previous = current
      current = next
    }
    head = previous
  }

  func printList() {
    if isEmpty {
      print("Empty list")
      return
    }

    var current = head

    while current != nil {
      print(current!.value, terminator: " -> ")
      current = current?.next
    }
    print("nil")
  }
}
