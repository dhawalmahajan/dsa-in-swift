private func detect(_ list: Node<Int>?) -> Bool {
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
