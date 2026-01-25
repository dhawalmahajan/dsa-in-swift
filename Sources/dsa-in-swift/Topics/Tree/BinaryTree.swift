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
