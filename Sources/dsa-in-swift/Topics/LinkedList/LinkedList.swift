class Node<Value> {
  var value: Value
  var next: Node?

  init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}
class LinkedList<Value: Equatable> {
  var head: Node<Value>?
  var tail: Node<Value>?
  private let isCircular: Bool
  init(isCircular: Bool = false) {
    self.isCircular = isCircular
  }

  var isEmpty: Bool {
    return head == nil
  }
  // Insert: Adds to the start of the list - O(1)
  func insertAtHead(_ value: Value) {
    let newNode = Node(value: value)

    if isEmpty {
      head = newNode
      tail = newNode
      if isCircular {
        newNode.next = newNode
      }
      return
    }

    newNode.next = head
    head = newNode

    if isCircular {
      tail?.next = head
    }
  }

  func insertAtTail(_ value: Value) {
    let newNode = Node(value: value)

    if isEmpty {
      insertAtHead(value)
      return
    }

    tail?.next = newNode
    tail = newNode

    if isCircular {
      tail?.next = head
    }
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
      if isCircular && current?.next === head { break }
      current = current?.next
      currentIndex += 1
    }

    let newNode = Node(value: value)
    newNode.next = current?.next
    current?.next = newNode

    if current === tail {
      tail = newNode
      if isCircular {
        tail?.next = head
      }
    }
  }
  // Append: Adds to the end of the list - O(1)

  func find(value: Value) -> Node<Value>? {
    var current = head

    if isCircular {
      repeat {
        if current?.value == value {
          return current
        }
        current = current?.next
      } while current !== head
    } else {
      while current != nil {
        if current?.value == value {
          return current
        }
        current = current?.next
      }
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

    if isCircular {
      tail?.next = head
    }
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

    current?.next = isCircular ? head : nil
    tail = current
  }
  func delete(_ value: Value) {
    if isEmpty { return }

    var current = head
    var previous: Node<Value>?

    if isCircular {
      repeat {
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
      } while current !== head
    } else {
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
  }
  func reverse() {
    var previous: Node<Value>?
    var current = head
    var next: Node<Value>?
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

    if isCircular {
      repeat {
        print(current?.value, terminator: " -> ")
        current = current?.next
      } while current !== head
      print("(back to head)")
    } else {
      while current != nil {
        print(current?.value, terminator: " -> ")
        current = current?.next
      }
      print("nil")
    }
  }
}
