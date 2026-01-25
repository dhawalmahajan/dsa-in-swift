final class BinarySearchTree<Value: Comparable> {
  private(set) var root: TreeNode<Value>?

  func insert(_ value: Value) {
    root = insert(from: root, value)
  }

  private func insert(from node: TreeNode<Value>?, _ value: Value) -> TreeNode<Value> {
    guard let node = node else {
      return TreeNode(value)
    }
    if value < node.value {
      node.left = insert(from: node.left, value)
    } else {
      node.right = insert(from: node.right, value)
    }
    return node
  }
  func search(_ val: Value) -> Bool {
    var curr = root
    while let current = curr {
      if current.value == val { return true }
      curr = val < current.value ? current.left : current.right
    }
    return false
  }

}
