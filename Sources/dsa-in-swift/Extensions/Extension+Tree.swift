func inorder<T>(_ root: TreeNode<T>?) {
  guard let r = root else { return }
  inorder(r.left)
  print(r.value)
  inorder(r.right)
}

func preorder<T>(_ root: TreeNode<T>?) {
  guard let r = root else { return }
  print(r.value)
  preorder(r.left)
  preorder(r.right)
}

func postorder<T>(_ root: TreeNode<T>?) {
  guard let r = root else { return }
  postorder(r.left)
  postorder(r.right)
  print(r.value)
}
func levelOrder<T>(_ root: TreeNode<T>?) {
  guard let r = root else { return }
  var queue: [TreeNode<T>] = [r]
  while !queue.isEmpty {
    let current = queue.removeFirst()
    print(current.value)
    if let left = current.left {
      queue.append(left)
    }
    if let right = current.right {
      queue.append(right)
    }
  }
}

func height<T>(_ root: TreeNode<T>?) -> Int {
  guard let r = root else { return 0 }
  return 1 + max(height(r.left), height(r.right))
}

func countNodes<T>(_ root: TreeNode<T>?) -> Int {
  guard let r = root else { return 0 }
  return 1 + countNodes(r.left) + countNodes(r.right)
}

func isBalanced<T>(_ root: TreeNode<T>?) -> Bool {
  guard let r = root else { return true }
  let leftHeight = height(r.left)
  let rightHeight = height(r.right)
  if abs(leftHeight - rightHeight) > 1 {
    return false
  }
  return isBalanced(r.left) && isBalanced(r.right)
}
