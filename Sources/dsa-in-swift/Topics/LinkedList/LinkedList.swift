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
  func find(value: Value) -> Node<Value>? {
    var current = head
    while current != nil && current?.value != value {
      current = current?.next
    }
    return current
  }

  func printList() {
    var current = head
    while current != nil {
      print(current?.value ?? "")
      current = current?.next
    }
  }
}
