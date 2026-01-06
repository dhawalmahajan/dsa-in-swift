private func detect(_ list: Node<Int>?) -> Bool {
  var slow = list
  var fast = list
  let slowNext = slow?.next
  let fastNext = fast?.next
  let fastNextNext = fastNext?.next
  while slowNext != nil && fastNext != nil && fastNextNext != nil {
    slow = slowNext
    fast = fastNextNext
    if slow?.value == fast?.value {
      var count = 0
      repeat {
        count += 1
        fast = fast?.next
      } while slow?.value != fast?.value
      print("Cycle length is \(count)")
      return true
    }
  }
  return false
}

func detectCycleLoopAndLength() {
  let list = Node<Int>(value: 1)
  list.next = Node<Int>(value: 2)
  let three = Node<Int>(value: 3)
  list.next?.next = three
  list.next?.next?.next = Node<Int>(value: 4)
  list.next?.next?.next?.next = Node<Int>(value: 5)
  list.next?.next?.next?.next?.next = three

  print(detect(list))
}
