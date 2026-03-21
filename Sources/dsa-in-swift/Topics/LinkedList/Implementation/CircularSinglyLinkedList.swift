// Circular Singly Linked List implementation

class CircularSinglyLinkedList<Value: Equatable> {
  var head: CircularSinglyListNode<Value>?
  var tail: CircularSinglyListNode<Value>?

  var isEmpty: Bool { head == nil }

  func insertAtHead(_ value: Value) {
    let newNode = CircularSinglyListNode(value: value)

    if isEmpty {
      head = newNode
      tail = newNode
      newNode.next = newNode
      return
    }

    newNode.next = head
    head = newNode
    tail?.next = head
  }

  func insertAtTail(_ value: Value) {
    let newNode = CircularSinglyListNode(value: value)

    if isEmpty {
      insertAtHead(value)
      return
    }

    tail?.next = newNode
    tail = newNode
    tail?.next = head
  }

  func insert(_ value: Value, at index: Int) {
    if index < 0 { return }

    if index == 0 {
      insertAtHead(value)
      return
    }

    var current = head
    var currentIndex = 0

    while currentIndex < index - 1 && current?.next !== head {
      current = current?.next
      currentIndex += 1
    }

    let newNode = CircularSinglyListNode(value: value)
    newNode.next = current?.next
    current?.next = newNode

    if current === tail {
      tail = newNode
      tail?.next = head
    }
  }

  func find(value: Value) -> CircularSinglyListNode<Value>? {
    var current = head

    if current == nil { return nil }

    repeat {
      if current?.value == value {
        return current
      }
      current = current?.next
    } while current !== head

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
    tail?.next = head
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

    current?.next = head
    tail = current
  }

  func delete(_ value: Value) {
    if isEmpty { return }

    var current = head
    var previous: CircularSinglyListNode<Value>?

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
  }

  func reverse() {
    if isEmpty || head === tail { return }

    var previous: CircularSinglyListNode<Value>?
    var current = head
    var next: CircularSinglyListNode<Value>?

    repeat {
      next = current?.next
      current?.next = previous
      previous = current
      current = next
    } while current !== head

    head = previous
    tail = current?.next
    tail?.next = head
  }

  func printList() {
    if isEmpty {
      print("Empty circular singly linked list")
      return
    }

    var current = head

    repeat {
      print(current!.value, terminator: " -> ")
      current = current?.next
    } while current !== head

    print("(back to head)")
  }
}
