// MARK: - AVL Tree
final class AVLTree<T: Comparable> {

  private(set) var root: AVLNode<T>?

  // MARK: - Public Insert
  func insert(_ value: T) {
    root = insert(root, value)
  }

  // MARK: - Public Delete
  func delete(_ value: T) {
    root = delete(root, value)
  }

  // MARK: - Public Search
  func search(_ value: T) -> Bool {
    return search(root, value)
  }

  // MARK: - Height
  private func height(_ node: AVLNode<T>?) -> Int {
    return node?.height ?? 0
  }

  // MARK: - Balance Factor
  private func balanceFactor(_ node: AVLNode<T>?) -> Int {
    return node == nil ? 0 : height(node?.left) - height(node?.right)
  }

  // MARK: - Update Height
  private func updateHeight(_ node: AVLNode<T>?) {
    guard let node = node else { return }
    node.height = max(height(node.left), height(node.right)) + 1
  }

  // MARK: - Right Rotation (LL)
  private func rightRotate(_ y: AVLNode<T>) -> AVLNode<T> {
    guard let x = y.left else { return y }
    let T2 = x.right

    x.right = y
    y.left = T2

    updateHeight(y)
    updateHeight(x)

    return x
  }

  // MARK: - Left Rotation (RR)
  private func leftRotate(_ x: AVLNode<T>) -> AVLNode<T> {
    guard let y = x.right else { return x }
    let T2 = y.left

    y.left = x
    x.right = T2

    updateHeight(x)
    updateHeight(y)

    return y
  }

  // MARK: - Insert Logic
  private func insert(_ node: AVLNode<T>?, _ value: T) -> AVLNode<T> {
    guard let node = node else {
      return AVLNode(value)
    }

    if value < node.value {
      node.left = insert(node.left, value)
    } else if value > node.value {
      node.right = insert(node.right, value)
    } else {
      return node
    }

    updateHeight(node)

    let balance = balanceFactor(node)

    // LL / LR
    if balance > 1, let left = node.left {
      if value < left.value {
        return rightRotate(node)
      } else if value > left.value {
        node.left = leftRotate(left)
        return rightRotate(node)
      }
    }

    // RR / RL
    if balance < -1, let right = node.right {
      if value > right.value {
        return leftRotate(node)
      } else if value < right.value {
        node.right = rightRotate(right)
        return leftRotate(node)
      }
    }

    return node
  }

  // MARK: - Delete Logic
  private func delete(_ node: AVLNode<T>?, _ value: T) -> AVLNode<T>? {
    guard let node = node else { return nil }

    if value < node.value {
      node.left = delete(node.left, value)
    } else if value > node.value {
      node.right = delete(node.right, value)
    } else {

      // One child or no child
      if node.left == nil || node.right == nil {
        return node.left ?? node.right
      }

      // Two children
      if let right = node.right {
        let minNode = minValueNode(right)
        node.value = minNode.value
        node.right = delete(node.right, minNode.value)
      }
    }

    updateHeight(node)

    let balance = balanceFactor(node)

    // LL
    if balance > 1 && balanceFactor(node.left) >= 0 {
      return rightRotate(node)
    }

    // LR
    if balance > 1 && balanceFactor(node.left) < 0 {
      if let left = node.left {
        node.left = leftRotate(left)
      }
      return rightRotate(node)
    }

    // RR
    if balance < -1 && balanceFactor(node.right) <= 0 {
      return leftRotate(node)
    }

    // RL
    if balance < -1 && balanceFactor(node.right) > 0 {
      if let right = node.right {
        node.right = rightRotate(right)
      }
      return leftRotate(node)
    }

    return node
  }

  private func minValueNode(_ node: AVLNode<T>) -> AVLNode<T> {
    var current = node
    while let left = current.left {
      current = left
    }
    return current
  }

  private func search(_ node: AVLNode<T>?, _ value: T) -> Bool {
    guard let node = node else { return false }

    if value == node.value { return true }
    if value < node.value {
      return search(node.left, value)
    }
    return search(node.right, value)
  }

  // MARK: - Traversals

  func inorder() {
    inorder(root)
    print()
  }

  private func inorder(_ node: AVLNode<T>?) {
    guard let node = node else { return }
    inorder(node.left)
    print(node.value, terminator: " ")
    inorder(node.right)
  }

  func preorder() {
    preorder(root)
    print()
  }

  private func preorder(_ node: AVLNode<T>?) {
    guard let node = node else { return }
    print(node.value, terminator: " ")
    preorder(node.left)
    preorder(node.right)
  }

  func postorder() {
    postorder(root)
    print()
  }

  private func postorder(_ node: AVLNode<T>?) {
    guard let node = node else { return }
    postorder(node.left)
    postorder(node.right)
    print(node.value, terminator: " ")
  }
}
func avlTreeExample() {
  let avlTree = AVLTree<Int>()
  avlTree.insert(10)
  avlTree.insert(20)
  avlTree.insert(30)
  avlTree.insert(40)
  avlTree.insert(50)
  avlTree.insert(25)

  print("Inorder Traversal:")
  avlTree.inorder()

  print("Preorder Traversal:")
  avlTree.preorder()

  print("Postorder Traversal:")
  avlTree.postorder()

  print("Search for 25: \(avlTree.search(25))")
  print("Search for 60: \(avlTree.search(60))")

  avlTree.delete(40)
  print("Inorder Traversal after deleting 40:")
  avlTree.inorder()
}
