func linkList() {
  let list = LinkedList<Int>()
  list.insertData(data: 10)
  list.insertData(data: 9)
  list.insertData(data: 8)
  list.insertData(data: 11)
  list.insertData(data: 12)
  list.append(11)

  let found = list.find(value: 9)
  print(found?.value ?? -1)
  // list.printList()
}
