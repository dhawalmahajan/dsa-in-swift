import Foundation

final class SimpleSingleton: Sendable {
  // Static instance - Swift's lazy initialization ensures thread safety
  static let shared = SimpleSingleton()

  // Private initializer prevents external instantiation
  private init() {
    print("Singleton Constructor called")
  }
}

func simpleSingletonDemo() {
  let s1 = SimpleSingleton.shared
  let s2 = SimpleSingleton.shared
  print(s1 === s2)  // Use === for reference equality in Swift
}
// Main execution
