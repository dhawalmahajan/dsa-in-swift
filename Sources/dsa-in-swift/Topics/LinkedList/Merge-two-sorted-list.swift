private func mergeTwoList(_ l1: Node<Int>?, _ l2: Node<Int>?) -> Node<Int>? {
  var list1 = l1
  var list2 = l2
  var result: Node<Int>? = Node<Int>(value: -1)
  var head = result
  while list1 != nil && list2 != nil {
    if let v1 = list1?.value, let v2 = list2?.value {
      if v1 < v2 {
        result?.next = list1
        list1 = list1?.next
      } else {
        result?.next = list2
        list2 = list2?.next
      }

    }
    result = result?.next
  }
  if list1 != nil {
    result?.next = list1
  } else {
    result?.next = list2
  }
  head = head?.next
  return head
}

func mergeLinkedLists() {
  let list1 = Node<Int>(value: 1)
  list1.next = Node<Int>(value: 2)

  let list2 = Node<Int>(value: 3)
  list2.next = Node<Int>(value: 4)
  list2.next?.next = Node<Int>(value: 5)
  list2.next?.next?.next = Node<Int>(value: 6)
  let mergedList = mergeTwoList(list1, list2)
  var current = mergedList
  while current != nil {
    print(current?.value ?? "")
    current = current?.next
  }
}
