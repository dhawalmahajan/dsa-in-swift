import Foundation

/// Extension to provide safe subscripting on collections.
public extension Collection {
   
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public extension Collection where Index == Int {
    /// Returns the element at the specified integer index if it is within bounds, otherwise nil.
    ///
    /// This subscript provides ergonomic safe access for collections that use `Int` as their index,
    /// such as arrays.
    ///
    /// - Parameter index: The integer index of the element to access.
    /// - Returns: The element at `index` if it exists, otherwise `nil`.
    subscript(safe index: Int) -> Element? {
        return (0..<count).contains(index) ? self[index] : nil
    }
}
