final class BinarySearchTree<T: Comparable> {
  var root: TreeNode<T>?
  // MARK: Insert
  func insert(_ value: T) {
    root = insertHelper(root, value)
  }

  private func insertHelper(_ node: TreeNode<T>?, _ value: T) -> TreeNode<T> {
    guard let node = node else {
      return TreeNode(value)
    }
    if value < node.value {
      node.left = insertHelper(node.left, value)
    } else {
      node.right = insertHelper(node.right, value)
    }

    return node
  }

  // MARK: Search
  func search(_ value: T) -> Bool {
    return searchHelper(root, value)
  }

  private func searchHelper(_ node: TreeNode<T>?, _ value: T) -> Bool {
    guard let node = node else { return false }

    if value == node.value { return true }
    if value < node.value {
      return searchHelper(node.left, value)
    } else {
      return searchHelper(node.right, value)
    }
  }

  // MARK: Inorder
  func inorder(_ node: TreeNode<T>?) {
    guard let node = node else { return }
    inorder(node.left)
    print(node.value, terminator: " ")
    inorder(node.right)
  }

  func preorder(_ node: TreeNode<T>?) {
    guard let node = node else { return }
    print(node.value, terminator: " ")
    preorder(node.left)
    preorder(node.right)
  }

  func postorder(_ node: TreeNode<T>?) {
    guard let node = node else { return }
    postorder(node.left)
    postorder(node.right)
    print(node.value, terminator: " ")
  }

  // MARK: Level Order
  func levelOrder() {
    guard let root = root else { return }
    var queue = [root]

    while !queue.isEmpty {
      let node = queue.removeFirst()
      print(node.value, terminator: " ")

      if let left = node.left { queue.append(left) }
      if let right = node.right { queue.append(right) }
    }
  }
  // MARK: Min
  func findMin(_ node: TreeNode<T>?) -> TreeNode<T>? {
    var current = node
    while current?.left != nil {
      current = current?.left
    }
    return current
  }

  // MARK: Delete
  func delete(_ value: T) {
    root = deleteHelper(root, value)
  }

  private func deleteHelper(_ node: TreeNode<T>?, _ value: T) -> TreeNode<T>? {
    guard let node = node else { return nil }

    if value < node.value {
      node.left = deleteHelper(node.left, value)
    } else if value > node.value {
      node.right = deleteHelper(node.right, value)
    } else {
      // Case 1 & 2: 0 or 1 child
      if node.left == nil { return node.right }
      if node.right == nil { return node.left }

      // Case 3: 2 children
      if let minNode = findMin(node.right) {
        node.value = minNode.value
        node.right = deleteHelper(node.right, minNode.value)
      }
    }
    return node
  }

  // MARK: Height
  func height(_ node: TreeNode<T>?) -> Int {
    guard let node = node else { return 0 }
    return 1 + max(height(node.left), height(node.right))
  }

}
