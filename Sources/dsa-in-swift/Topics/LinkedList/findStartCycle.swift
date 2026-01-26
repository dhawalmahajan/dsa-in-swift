private func detect(_ list: ListNode<Int>?) -> Bool {
  if list == nil {
    return false
  }
  var slow = list
  var fast = list

  while fast?.next != nil && fast?.next?.next != nil {
    slow = slow?.next
    fast = fast?.next?.next
    if slow === fast {
      // Cycle detected, now calculate length
      var count = 1
      var temp = slow?.next
      while temp !== slow {
        count += 1
        temp = temp?.next
      }
      print("Cycle length is \(count)")
      var pointer1 = list
      var pointer2 = list
      while count > 0 {
        pointer1 = pointer1?.next
        count -= 1
      }
      while pointer1?.value != pointer2?.value {
        pointer1 = pointer1?.next
        pointer2 = pointer2?.next
      }
      print("Start of cycle is", pointer1?.value)
      return true
    }
  }
  return false
}
func detectStartofCycleLoopAndLength() {
  let list = ListNode<Int>(value: 1)
  let two = ListNode<Int>(value: 2)
  list.next = two
  let three = ListNode<Int>(value: 3)
  list.next?.next = three
  list.next?.next?.next = ListNode<Int>(value: 4)
  list.next?.next?.next?.next = two

  print(detect(list))
}
