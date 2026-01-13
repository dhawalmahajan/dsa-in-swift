import Foundation

// Separate protocol for 2D shapes
protocol TwoDimensionalShape {
  func area() -> Double
}

// Separate protocol for 3D shapes
protocol ThreeDimensionalShape {
  func area() -> Double
  func volume() -> Double
}

// Square conforms only to the 2D protocol
class Square: TwoDimensionalShape {
  private let side: Double

  init(side: Double) {
    self.side = side
  }

  func area() -> Double {
    return side * side
  }
}

// Rectangle conforms only to the 2D protocol
class Rectangle: TwoDimensionalShape {
  private let length: Double
  private let width: Double

  init(length: Double, width: Double) {
    self.length = length
    self.width = width
  }

  func area() -> Double {
    return length * width
  }
}

// Cube conforms to the 3D protocol
class Cube: ThreeDimensionalShape {
  private let side: Double

  init(side: Double) {
    self.side = side
  }

  func area() -> Double {
    return 6 * side * side
  }

  func volume() -> Double {
    return side * side * side
  }
}

// --- Main Execution ---
func interfaceSegregationDemo() {
  let square: TwoDimensionalShape = Square(side: 5)
  let rectangle: TwoDimensionalShape = Rectangle(length: 4, width: 6)
  let cube: ThreeDimensionalShape = Cube(side: 3)

  print("Square Area: \(square.area())")
  print("Rectangle Area: \(rectangle.area())")
  print("Cube Area: \(cube.area())")
  print("Cube Volume: \(cube.volume())")
}
