final class TrieNode {
  var children: [Character: TrieNode] = [:]
  var isEnd = false
}

final class Trie {
  private let root = TrieNode()

  func insert(_ word: String) {
    var node = root
    for ch in word {
      node.children[ch, default: TrieNode()] = node.children[ch] ?? TrieNode()
      node = node.children[ch]!
    }
    node.isEnd = true
  }

  func search(_ word: String) -> Bool {
    var node = root
    for ch in word {
      guard let next = node.children[ch] else { return false }
      node = next
    }
    return node.isEnd
  }

  func startsWith(_ prefix: String) -> Bool {
    var node = root
    for ch in prefix {
      guard let next = node.children[ch] else { return false }
      node = next
    }
    return true
  }
}
