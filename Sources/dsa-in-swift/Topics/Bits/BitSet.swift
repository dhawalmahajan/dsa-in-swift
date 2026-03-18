/*
  A fixed-size sequence of n bits. Bits have indices 0 to n-1.
*/
public struct BitSet {
  /* How many bits this object can hold. */
  private(set) public var size: Int

  /*
    We store the bits in a list of unsigned 64-bit integers.
    The first entry, `words[0]`, is the least significant word.
  */
  fileprivate let N = 64
  public typealias Word = UInt64
  public var words: [Word]

  private let allOnes = ~Word()

  /* Creates a bit set that can hold `size` bits. All bits are initially 0. */
  public init(size: Int) {
    precondition(size > 0)
    self.size = size

    // Round up the count to the next multiple of 64.
    let n = (size + (N - 1)) / N
    words = [Word](repeating: 0, count: n)
  }

  /* Converts a bit index into an array index and a mask inside the word. */
  private func indexOf(_ i: Int) -> (Int, Word) {
    precondition(i >= 0)
    precondition(i < size)
    let o = i / N
    let m = Word(i - o * N)
    return (o, 1 << m)
  }

  /* Returns a mask that has 1s for all bits that are in the last word. */
  private func lastWordMask() -> Word {
    let diff = words.count * N - size
    if diff > 0 {
      // Set the highest bit that's still valid.
      let mask = 1 << Word(63 - diff)
      // Subtract 1 to turn it into a mask, and add the high bit back in.
      return (Word)(mask | (mask - 1))
    } else {
      return allOnes
    }
  }

  /*
    If the size is not a multiple of N, then we have to clear out the bits
    that we're not using, or bitwise operations between two differently sized
    BitSets will go wrong.
  */
  public mutating func clearUnusedBits() {
    words[words.count - 1] &= lastWordMask()
  }

  /* So you can write bitset[99] = ... */
  public subscript(i: Int) -> Bool {
    get { return isSet(i) }
    set { if newValue { set(i) } else { clear(i) } }
  }

  /* Sets the bit at the specified index to 1. */
  public mutating func set(_ i: Int) {
    let (j, m) = indexOf(i)
    words[j] |= m
  }

  /* Sets all the bits to 1. */
  public mutating func setAll() {
    for i in 0..<words.count {
      words[i] = allOnes
    }
    clearUnusedBits()
  }

  /* Sets the bit at the specified index to 0. */
  public mutating func clear(_ i: Int) {
    let (j, m) = indexOf(i)
    words[j] &= ~m
  }

  /* Sets all the bits to 0. */
  public mutating func clearAll() {
    for i in 0..<words.count {
      words[i] = 0
    }
  }

  /* Changes 0 into 1 and 1 into 0. Returns the new value of the bit. */
  public mutating func flip(_ i: Int) -> Bool {
    let (j, m) = indexOf(i)
    words[j] ^= m
    return (words[j] & m) != 0
  }

  /* Determines whether the bit at the specific index is 1 (true) or 0 (false). */
  public func isSet(_ i: Int) -> Bool {
    let (j, m) = indexOf(i)
    return (words[j] & m) != 0
  }

  /*
    Returns the number of bits that are 1. Time complexity is O(s) where s is
    the number of 1-bits.
  */
  public var cardinality: Int {
    var count = 0
    for var x in words {
      while x != 0 {
        let y = x & ~(x - 1)  // find lowest 1-bit
        x = x ^ y  // and erase it
        count += 1
      }
    }
    return count
  }

  /* Checks if all the bits are set. */
  public func all1() -> Bool {
    for i in 0..<words.count - 1 {
      if words[i] != allOnes { return false }
    }
    return words[words.count - 1] == lastWordMask()
  }

  /* Checks if any of the bits are set. */
  public func any1() -> Bool {
    for x in words {
      if x != 0 { return true }
    }
    return false
  }

  /* Checks if none of the bits are set. */
  public func all0() -> Bool {
    for x in words {
      if x != 0 { return false }
    }
    return true
  }
}

public func << (lhs: BitSet, numBitsLeft: Int) -> BitSet {
  var out = lhs
  let offset = numBitsLeft / lhs.N
  let shift = numBitsLeft % lhs.N
  for i in 0..<lhs.words.count {
    out.words[i] = 0
    if i - offset >= 0 {
      out.words[i] = lhs.words[i - offset] << shift
    }
    if i - offset - 1 >= 0 {
      out.words[i] |= lhs.words[i - offset - 1] >> (lhs.N - shift)
    }
  }

  out.clearUnusedBits()
  return out
}

public func >> (lhs: BitSet, numBitsRight: Int) -> BitSet {
  var out = lhs
  let offset = numBitsRight / lhs.N
  let shift = numBitsRight % lhs.N
  for i in 0..<lhs.words.count {
    out.words[i] = 0
    if i + offset < lhs.words.count {
      out.words[i] = lhs.words[i + offset] >> shift
    }
    if i + offset + 1 < lhs.words.count {
      out.words[i] |= lhs.words[i + offset + 1] << (lhs.N - shift)
    }
  }

  out.clearUnusedBits()
  return out
}

// MARK: - Debugging

extension UInt64 {
  /* Writes the bits in little-endian order, LSB first. */
  public func bitsToString() -> String {
    var s = ""
    var n = self
    for _ in 1...64 {
      s += ((n & 1 == 1) ? "1" : "0")
      n >>= 1
    }
    return s
  }
}

func bitSetDemo() {
  var bits = BitSet(size: 140)

  // Initially, it looks like all zeros:
  // 0000000000000000000000000000000000000000000000000000000000000000
  // 0000000000000000000000000000000000000000000000000000000000000000
  // 0000000000000000000000000000000000000000000000000000000000000000
  print(bits)

  bits[2] = true
  bits[99] = true
  bits[128] = true
  print(bits.cardinality)  // 3

  // 0010000000000000000000000000000000000000000000000000000000000000
  // 0000000000000000000000000000000000010000000000000000000000000000
  // 1000000000000000000000000000000000000000000000000000000000000000
  print(bits)

  bits.setAll()
  print(bits.cardinality)  // 140

  // 1111111111111111111111111111111111111111111111111111111111111111
  // 1111111111111111111111111111111111111111111111111111111111111111
  // 1111111111110000000000000000000000000000000000000000000000000000
  print(bits)

  print("")

  // Bitwise operations

  var a = BitSet(size: 4)
  var b = BitSet(size: 8)

  a.setAll()
  print(a.cardinality)  // 4

  a[1] = false
  a[2] = false
  a[3] = false

  b[2] = true
  b[6] = true
  b[7] = true

  print(a)  // 1000000000000000000000000000000000000000000000000000000000000000
  print(b)  // 0010001100000000000000000000000000000000000000000000000000000000

  let c = a | b
  c.size  // 8

  print(c)  // 1010001100000000000000000000000000000000000000000000000000000000

  print(a.cardinality)  // 1
  print(b.cardinality)  // 3
  print(c.cardinality)  // 4

  print("")
  print(~a)  // 0111000000000000000000000000000000000000000000000000000000000000
  print(~b)  // 1101110000000000000000000000000000000000000000000000000000000000
  print(~c)  // 0101110000000000000000000000000000000000000000000000000000000000

  print((~a).cardinality)  // 3
  print((~b).cardinality)  // 5
  print((~c).cardinality)  // 4

  var z = BitSet(size: 66)
  print(z.all0())  // true
  print(z.all1())  // false

  z[45] = true
  print(z.any1())  // true
  print(z.all0())  // false

  z[45] = false
  print(z.any1())  // false
  print(z.all0())  // true

  z[65] = true
  print(z.any1())  // true

  z.setAll()
  print(z.all1())  // true

  z[65] = false
  print(z.all1())  // false

  //var bigBits = BitSet(size: 10000)
  //print(bigBits)

  var smallBitSet = BitSet(size: 16)
  smallBitSet[5] = true
  smallBitSet[10] = true
  print(smallBitSet >> 3)
  print(smallBitSet << 6)  // one bit shifts off the end

  var bigBitSet = BitSet(size: 120)
  bigBitSet[1] = true
  bigBitSet[3] = true
  bigBitSet[7] = true
  bigBitSet[32] = true
  bigBitSet[55] = true
  bigBitSet[64] = true
  bigBitSet[80] = true
  print(bigBitSet)
  print(bigBitSet << 32)
  print(bigBitSet << 64)
  print(bigBitSet >> 32)
  print(bigBitSet >> 64)

}
