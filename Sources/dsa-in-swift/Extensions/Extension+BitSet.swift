extension BitSet: Equatable {

}
public func == (lhs: BitSet, rhs: BitSet) -> Bool {
  return lhs.words == rhs.words
}
// MARK: - Hashing

extension BitSet: Hashable {
  public func hash(into hasher: inout Hasher) {
    for x in words {
      hasher.combine(x)
    }
  }
  /* Based on the hashing code from Java's BitSet. */
  public var hashValue: Int {
    var h = Word(1234)
    for i in stride(from: words.count, to: 0, by: -1) {
      h ^= words[i - 1] &* Word(i)
    }
    return Int((h >> 32) ^ h)
  }
}

// MARK: - Bitwise operations

extension BitSet {
  public static var allZeros: BitSet {
    return BitSet(size: 64)
  }
}
extension BitSet: CustomStringConvertible {
  public var description: String {
    var s = ""
    for x in words {
      s += x.bitsToString() + " "
    }
    return s
  }
}

private func copyLargest(_ lhs: BitSet, _ rhs: BitSet) -> BitSet {
  return (lhs.words.count > rhs.words.count) ? lhs : rhs
}
public func & (lhs: BitSet, rhs: BitSet) -> BitSet {
  let m = max(lhs.size, rhs.size)
  var out = BitSet(size: m)
  let n = min(lhs.words.count, rhs.words.count)
  for i in 0..<n {
    out.words[i] = lhs.words[i] & rhs.words[i]
  }
  return out
}

public func | (lhs: BitSet, rhs: BitSet) -> BitSet {
  var out = copyLargest(lhs, rhs)
  let n = min(lhs.words.count, rhs.words.count)
  for i in 0..<n {
    out.words[i] = lhs.words[i] | rhs.words[i]
  }
  return out
}

public func ^ (lhs: BitSet, rhs: BitSet) -> BitSet {
  var out = copyLargest(lhs, rhs)
  let n = min(lhs.words.count, rhs.words.count)
  for i in 0..<n {
    out.words[i] = lhs.words[i] ^ rhs.words[i]
  }
  return out
}

prefix public func ~ (rhs: BitSet) -> BitSet {
  var out = BitSet(size: rhs.size)
  for i in 0..<rhs.words.count {
    out.words[i] = ~rhs.words[i]
  }
  out.clearUnusedBits()
  return out
}
