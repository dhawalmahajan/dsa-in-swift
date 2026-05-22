import Foundation

// Abstract-like Base Class
class DynamicPolymorphismCar {
  // In Swift, 'internal' or 'fileprivate' is used instead of 'protected'
  // 'internal' allows access within the same module/app
  var brand: String
  var model: String
  var isEngineOn: Bool
  var currentSpeed: Int

  init(brand: String, model: String) {
    self.brand = brand
    self.model = model
    self.isEngineOn = false
    self.currentSpeed = 0
  }

  // Common methods
  func startEngine() {
    isEngineOn = true
    print("\(brand) \(model) : Engine started.")
  }

  func stopEngine() {
    isEngineOn = false
    currentSpeed = 0
    print("\(brand) \(model) : Engine turned off.")
  }

  // Abstract methods for Dynamic Polymorphism
  func accelerate() {
    // Equivalent to virtual void accelerate() = 0;
    fatalError("Subclasses must implement accelerate()")
  }

  func brake() {
    fatalError("Subclasses must implement brake()")
  }
}

class ManualCar: DynamicPolymorphismCar {
  private var currentGear: Int = 0

  // Specialized method
  func shiftGear(_ gear: Int) {
    currentGear = gear
    print("\(brand) \(model) : Shifted to gear \(currentGear)")
  }

  // Overriding accelerate
  override func accelerate() {
    if !isEngineOn {
      print("\(brand) \(model) : Cannot accelerate! Engine is off.")
      return
    }
    currentSpeed += 20
    print("\(brand) \(model) : Accelerating to \(currentSpeed) km/h")
  }

  // Overriding brake
  override func brake() {
    currentSpeed -= 20
    if currentSpeed < 0 { currentSpeed = 0 }
    print("\(brand) \(model) : Braking! Speed is now \(currentSpeed) km/h")
  }
}

class ElectricCar: DynamicPolymorphismCar {
  private var batteryLevel: Int = 100

  // Specialized method
  func chargeBattery() {
    batteryLevel = 100
    print("\(brand) \(model) : Battery fully charged!")
  }

  // Overriding accelerate
  override func accelerate() {
    if !isEngineOn {
      print("\(brand) \(model) : Cannot accelerate! Engine is off.")
      return
    }
    if batteryLevel <= 0 {
      print("\(brand) \(model) : Battery dead! Cannot accelerate.")
      return
    }
    batteryLevel -= 10
    currentSpeed += 15
    print("\(brand) \(model) : Accelerating to \(currentSpeed) km/h. Battery at \(batteryLevel)%.")
  }

  // Overriding brake
  override func brake() {
    currentSpeed -= 15
    if currentSpeed < 0 { currentSpeed = 0 }
    print(
      "\(brand) \(model) : Regenerative braking! Speed is now \(currentSpeed) km/h. Battery at \(batteryLevel)%."
    )
  }
}

func dynamicPolymorphismDemo() {
  print("=== Dynamic Polymorphism Demo ===")

  let myManualCar: DynamicPolymorphismCar = ManualCar(brand: "Suzuki", model: "WagonR")
  myManualCar.startEngine()
  myManualCar.accelerate()
  myManualCar.accelerate()
  myManualCar.brake()
  myManualCar.stopEngine()

  print("----------------------")

  let myElectricCar: DynamicPolymorphismCar = ElectricCar(brand: "Tesla", model: "Model S")
  myElectricCar.startEngine()
  myElectricCar.accelerate()
  myElectricCar.accelerate()
  myElectricCar.brake()
  myElectricCar.stopEngine()
}
