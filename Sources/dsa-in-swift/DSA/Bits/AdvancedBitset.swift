struct AdvancedBitset {
    // Each block holds 64 bits
    private(set) var storage: [UInt64] = [] 
    
    // Helper to find which block and which bit inside that block
    private func coordinates(for index: Int) -> (block: Int, bit: Int) {
        return (index / 64, index % 64)
    }
    
    mutating func set(_ index: Int) {
        let (block, bit) = coordinates(for: index)
        // Expand storage if index is larger than current capacity
        if block >= storage.count {
            storage.append(contentsOf: Array(repeating: 0, count: block - storage.count + 1))
        }
        storage[block] |= (1 << bit)
    }
    
    func contains(_ index: Int) -> Bool {
        let (block, bit) = coordinates(for: index)
        guard block < storage.count else { return false }
        return (storage[block] & (1 << bit)) != 0
    }
}
extension AdvancedBitset {
    // Intersection (AND): Find items common to both sets
    func intersection(with other: AdvancedBitset) -> AdvancedBitset {
        var result = AdvancedBitset()
        let minCount = min(self.storage.count, other.storage.count)
        
        for i in 0..<minCount {
            result.storage.append(self.storage[i] & other.storage[i])
        }
        return result
    }
    
    // Count total active bits using Swift's optimized hardware count
    func countActiveBits() -> Int {
        return storage.reduce(0) { $0 + $1.nonzeroBitCount }
    }
}

func advancedBitsetDemo() {
    var mySet = AdvancedBitset()
    mySet.set(2)
    mySet.set(5)
    print(mySet)
}