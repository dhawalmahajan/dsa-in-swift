import Foundation

class StaticPolymorphismManualCar {
  // Properties (Swift uses 'let' for constants and 'var' for variables)
  private let brand: String
  private let model: String
  private var isEngineOn: Bool
  private var currentSpeed: Int
  private var currentGear: Int

  // Constructor (Swift uses 'init')
  init(brand: String, model: String) {
    self.brand = brand
    self.model = model
    self.isEngineOn = false
    self.currentSpeed = 0
    self.currentGear = 0
  }

  func startEngine() {
    isEngineOn = true
    print("\(brand) \(model) : Engine started.")
  }

  func stopEngine() {
    isEngineOn = false
    currentSpeed = 0
    print("\(brand) \(model) : Engine turned off.")
  }

  // Overloading accelerate - Swift supports parameter-based overloading
  func accelerate() {
    guard isEngineOn else {
      print("\(brand) \(model) : Cannot accelerate! Engine is off.")
      return
    }
    currentSpeed += 20
    print("\(brand) \(model) : Accelerating to \(currentSpeed) km/h")
  }

  func accelerate(speed: Int) {
    guard isEngineOn else {
      print("\(brand) \(model) : Cannot accelerate! Engine is off.")
      return
    }
    currentSpeed += speed
    print("\(brand) \(model) : Accelerating to \(currentSpeed) km/h")
  }

  func brake() {
    currentSpeed -= 20
    if currentSpeed < 0 { currentSpeed = 0 }
    print("\(brand) \(model) : Braking! Speed is now \(currentSpeed) km/h")
  }

  func shiftGear(gear: Int) {
    currentGear = gear
    print("\(brand) \(model) : Shifted to gear \(currentGear)")
  }
}

// --- Main Execution ---
func staticPolymorphismDemo() {
  // No need for 'new' or pointers. Instances are reference types by default.
  let myManualCar = StaticPolymorphismManualCar(brand: "Suzuki", model: "WagonR")

  myManualCar.startEngine()
  myManualCar.accelerate()
  myManualCar.accelerate()  // Swift requires parameter names by default
  myManualCar.brake()
  myManualCar.stopEngine()
}
// No 'delete' required. ARC handles cleanup automatically.
