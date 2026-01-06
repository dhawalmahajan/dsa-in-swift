final class TreeNode<T> {
  var val: T
  var left: TreeNode?
  var right: TreeNode?
  init(_ val: T) { self.val = val }
}

func inorder<T>(_ root: TreeNode<T>?) {
  guard let r = root else { return }
  inorder(r.left)
  print(r.val)
  inorder(r.right)
}

func preorder<T>(_ root: TreeNode<T>?) {
  guard let r = root else { return }
  print(r.val)
  preorder(r.left)
  preorder(r.right)
}

func postorder<T>(_ root: TreeNode<T>?) {
  guard let r = root else { return }
  postorder(r.left)
  postorder(r.right)
  print(r.val)
}
