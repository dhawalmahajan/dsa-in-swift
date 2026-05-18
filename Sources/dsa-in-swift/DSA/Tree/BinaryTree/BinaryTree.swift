final class BinaryTree<T: Equatable> {
  var root: TreeNode<T>?
  // MARK: Insert (Level Order)
  func insert(_ value: T) {
    let newNode = TreeNode(value)
    guard let root = root else {
      self.root = newNode
      return
    }

    var queue: [TreeNode<T>] = [root]

    while !queue.isEmpty {
      let node = queue.removeFirst()

      if node.left == nil {
        node.left = newNode
        return
      } else {
        queue.append(node.left!)
      }

      if node.right == nil {
        node.right = newNode
        return
      } else {
        queue.append(node.right!)
      }
    }
  }

  // MARK: Traversals

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

  // MARK: Height
  func height(_ node: TreeNode<T>?) -> Int {
    guard let node = node else { return 0 }
    return 1 + max(height(node.left), height(node.right))
  }

  // MARK: Search
  func search(_ value: T) -> Bool {
    guard let root = root else { return false }
    var queue = [root]

    while !queue.isEmpty {
      let node = queue.removeFirst()
      if node.value == value { return true }

      if let left = node.left { queue.append(left) }
      if let right = node.right { queue.append(right) }
    }
    return false
  }
  func delete(_ value: T) {
    guard let root = root else { return }

    var queue: [TreeNode<T>] = [root]
    var nodeToDelete: TreeNode<T>?
    var deepestNode: TreeNode<T>?
    var parentOfDeepest: TreeNode<T>?
    // Step 1: Find nodeToDelete and deepest node
    while !queue.isEmpty {
      let node = queue.removeFirst()

      if node.value == value {
        nodeToDelete = node
      }

      if let left = node.left {
        parentOfDeepest = node
        queue.append(left)
      }

      if let right = node.right {
        parentOfDeepest = node
        queue.append(right)
      }

      deepestNode = node
    }

    guard let target = nodeToDelete,
      let deepest = deepestNode
    else {
      return
    }

    // Step 2: Replace value
    target.value = deepest.value

    // Step 3: Delete deepest node
    if parentOfDeepest?.right === deepest {
      parentOfDeepest?.right = nil
    } else {
      parentOfDeepest?.left = nil
    }
  }

  // MARK: Count Nodes
  func countNodes(_ node: TreeNode<T>?) -> Int {
    guard let node = node else { return 0 }
    return 1 + countNodes(node.left) + countNodes(node.right)
  }
}
