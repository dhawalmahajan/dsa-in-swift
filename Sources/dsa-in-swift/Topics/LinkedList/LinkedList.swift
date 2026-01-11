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

  var isEmpty: Bool {
    return head == nil
  }
  // Insert: Adds to the start of the list - O(1)
  func insertData(data: Value) {
    let newNode = Node(value: data)
    newNode.next = head
    head = newNode
  }

  // Append: Adds to the end of the list - O(1)
  func append(_ value: Value) {
    if isEmpty {
      insertData(data: value)
      return
    }
    var current = head
    while current?.next != nil {
      current = current?.next
    }
    let newNode = Node(value: value)
    current?.next = newNode
  }
  // Insert at specific position (0-based index) - O(n)
  func insert(_ value: Value, at index: Int) {
    if index < 0 {
      return
    }

    // Insert at head
    if index == 0 {
      insertData(data: value)
      return
    }

    var current = head
    var currentIndex = 0

    // Traverse to the node just before the desired index
    while current != nil && currentIndex < index - 1 {
      current = current?.next
      currentIndex += 1
    }

    // If index is out of bounds
    if current == nil {
      return
    }

    let newNode = Node(value: value)
    newNode.next = current?.next
    current?.next = newNode
  }
  func find(value: Value) -> Node<Value>? {
    var current = head
    while current != nil && current?.value != value {
      current = current?.next
    }
    return current
  }

  func delete(value: Value) -> Node<Value>? {
    if head == nil { return head }
    var current = head
    var previous: Node<Value>?
    while current != nil && current?.value != value {
      previous = current
      current = current?.next
    }
    if previous == nil && current != nil {
      head = current?.next
    } else if current == nil {
      return nil
    } else {
      previous?.next = current?.next
    }
    return current
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
    var current = head
    while current != nil {
      print(current?.value ?? "")
      current = current?.next
    }
  }
}
