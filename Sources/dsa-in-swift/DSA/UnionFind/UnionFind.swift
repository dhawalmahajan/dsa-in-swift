final class UnionFind<T: Hashable> {
  private var parent: [T: T] = [:]

  func add(_ x: T) {
    if parent[x] == nil {
      parent[x] = x
    }
  }

  func find(_ x: T) -> T {
    if parent[x] != x {
      parent[x] = find(parent[x]!)
    }
    return parent[x]!
  }

  func union(_ x: T, _ y: T) {
    add(x)
    add(y)
    let rootX = find(x)
    let rootY = find(y)
    if rootX != rootY {
      parent[rootX] = rootY
    }
  }

  func connected(_ x: T, _ y: T) -> Bool {
    guard parent[x] != nil, parent[y] != nil else { return false }
    return find(x) == find(y)
  }
}
