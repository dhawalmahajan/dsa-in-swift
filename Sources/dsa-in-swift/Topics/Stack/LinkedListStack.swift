struct LinkedListStack<Element> {
  var head: Node<Element>?
  private(set) var length: Int
  init() {

    self.length = 0
  }
  mutating func push(_ item: Element) {
    let newNode = Node(value: item)
    newNode.next = head
    head = newNode
    length += 1
  }

  mutating func pop() -> Element? {
    if head == nil { return nil }
    let value = head?.value
    head = head?.next
    length -= 1
    length = max(0, length)
    return value
  }

  func peek() -> Node<Element>? {
    head
  }

  var isEmpty: Bool {
    head == nil
  }
}

func printLinkedListStack() {
  var stack = LinkedListStack<Int>()
  stack.push(10)
  stack.push(20)
  stack.push(30)
  stack.push(40)

  var current = stack.head

  print(stack.peek()?.value)
  print(stack.pop())
  while current != nil {
    current = current?.next
    print(current)

  }

}
