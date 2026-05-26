struct SimpleBitset: CustomStringConvertible {
    // Stores up to 64 bits
    private var storage: UInt64 = 0 
    
    mutating func set(_ index: Int) {
        precondition(index < 64, "Index out of bounds")
        storage |= (1 << index)
    }
    
    mutating func clear(_ index: Int) {
        precondition(index < 64, "Index out of bounds")
        storage &= ~(1 << index)
    }
    
    func contains(_ index: Int) -> Bool {
        precondition(index < 64, "Index out of bounds")
        return (storage & (1 << index)) != 0
    }
    
    var description: String {
        String(storage, radix: 2)
    }
}
func simpleBitsetDemo() {
// Usage
    var mySet = SimpleBitset()
    mySet.set(2)
    mySet.set(5)
    print(mySet) // Output: 100100 (Bits 2 and 5 are 1)

}
