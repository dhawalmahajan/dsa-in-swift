final class AVLNode<T: Comparable> {
  var value: T
  var left: AVLNode?
  var right: AVLNode?
  var height: Int

  init(_ value: T) {
    self.value = value
    self.height = 1
  }
}
