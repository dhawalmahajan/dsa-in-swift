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
  func delete(_ word: String) {
    deleteHelper(root, word, 0)
  }
  @discardableResult
  private func deleteHelper(_ node: TrieNode, _ word: String, _ index: Int) -> Bool {
    let chars = Array(word)
    if index == chars.count {
      if !node.isEnd { return false }
      node.isEnd = false
      return node.children.isEmpty  // delete node if no children
    }
    let char = chars[index]
    guard let child = node.children[char] else { return false }
    let shouldDelete = deleteHelper(child, word, index + 1)
    if shouldDelete {
      node.children.removeValue(forKey: char)
      return node.children.isEmpty && !node.isEnd
    }
    return false
  }
  func autocomplete(_ prefix: String) -> [String] {
    var node = root
    for char in prefix {
      guard let next = node.children[char] else { return [] }
      node = next
    }
    var results: [String] = []
    dfs(node, prefix, &results)
    return results
  }
  private func dfs(_ node: TrieNode, _ current: String, _ results: inout [String]) {
    if node.isEnd { results.append(current) }
    for (char, child) in node.children {
      dfs(child, current + String(char), &results)
    }
  }
}

func trieDemo() {
  let trie = Trie()
  trie.insert("hello")
  trie.insert("hell")
  trie.insert("heaven")
  trie.insert("heavy")

  print(trie.search("hell"))  // true
  print(trie.search("heavenly"))  // false
  print(trie.startsWith("hea"))  // true
  print(trie.startsWith("hi"))  // false

  trie.delete("heaven")
  print(trie.search("heaven"))  // false
  print(trie.startsWith("hea"))  // true (still has "heavy")

  print(trie.autocomplete("he"))  // ["hello", "hell", "heavy"]
}
