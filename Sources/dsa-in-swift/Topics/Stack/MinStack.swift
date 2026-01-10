class MinStack<T: Equatable> {
  private var stack: Stack<T>
  private var minStack: Stack<T>

  init() {
    stack = Stack<T>()
    minStack = Stack<T>()
  }
  func push(_ item: T) where T: Comparable {
    stack.push(item)
    if let currentMin = minStack.peek() {
      if item < currentMin {
        minStack.push(item)
      }
    } else {
      minStack.push(item)
    }
  }

  func pop() -> T? {
    if stack.isEmpty {
      return nil
    }
    let returnVal = stack.pop()

    if let item = returnVal, let currentMin = minStack.peek(), item == currentMin {
      _ = minStack.pop()
    }
    return returnVal
  }
  func top() -> T? {
    return stack.peek()
  }
  func getMin() -> T? {
    return minStack.peek()
  }
}

func minStackDemo() {
  let minStack = MinStack<Int>()
  minStack.push(-2)
  minStack.push(0)
  minStack.push(-3)
  print(minStack.getMin() ?? "No minimum")  // Returns -3
  _ = minStack.pop()
  print(minStack.top() ?? "No top element")  // Returns 0
  print(minStack.getMin() ?? "No minimum")  // Returns -2
}
