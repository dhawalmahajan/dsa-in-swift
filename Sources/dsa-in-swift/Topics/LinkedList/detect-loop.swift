private func detect(_ list: SinglyListNode<Int>?) -> Bool {
  if list == nil {
    return false
  }
  var slow = list
  var fast = list

  while fast?.next != nil && fast?.next?.next != nil {
    slow = slow?.next
    fast = fast?.next?.next
    if slow === fast {
      return true
    }
  }
  return false
}
func detectLoopInLinkedList() {
  let list = SinglyListNode<Int>(value: 1)
  list.next = SinglyListNode<Int>(value: 2)
  let three = SinglyListNode<Int>(value: 3)
  list.next?.next = three
  list.next?.next?.next = SinglyListNode<Int>(value: 4)
  list.next?.next?.next?.next = SinglyListNode<Int>(value: 5)
  list.next?.next?.next?.next?.next = three

  print(detect(list))

}
