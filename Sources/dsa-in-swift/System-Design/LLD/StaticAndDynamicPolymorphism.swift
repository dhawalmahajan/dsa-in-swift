import Foundation

// Base Car class (equivalent to the abstract base class)
class StaticAndDynamicPolymorphismCar {
  let brand: String
  let model: String
  var isEngineOn: Bool
  var currentSpeed: Int

  init(brand: String, model: String) {
    self.brand = brand
    self.model = model
    self.isEngineOn = false
    self.currentSpeed = 0
  }

  // Common methods for all cars
  func startEngine() {
    isEngineOn = true
    print("\(brand) \(model) : Engine started.")
  }

  func stopEngine() {
    isEngineOn = false
    currentSpeed = 0
    print("\(brand) \(model) : Engine turned off.")
  }

  // Abstract-like methods (Swift classes don't have an 'abstract' keyword,
  // so we provide a default implementation or use Protocols)
  func accelerate() {
    fatalError("Subclasses must implement accelerate()")
  }

  func accelerate(speed: Int) {
    fatalError("Subclasses must implement accelerate(speed:)")
  }

  func brake() {
    fatalError("Subclasses must implement brake()")
  }
}

// StaticAndDynamicPolymorphismManualCar Subclass
class StaticAndDynamicPolymorphismManualCar: StaticAndDynamicPolymorphismCar {
  private var currentGear: Int = 0

  override init(brand: String, model: String) {
    super.init(brand: brand, model: model)
  }

  func shiftGear(_ gear: Int) {
    currentGear = gear
    print("\(brand) \(model) : Shifted to gear \(currentGear)")
  }

  override func accelerate() {
    guard isEngineOn else {
      print("\(brand) \(model) : Cannot accelerate! Engine is off.")
      return
    }
    currentSpeed += 20
    print("\(brand) \(model) : Accelerating to \(currentSpeed) km/h")
  }

  override func accelerate(speed: Int) {
    guard isEngineOn else {
      print("\(brand) \(model) : Cannot accelerate! Engine is off.")
      return
    }
    currentSpeed += speed
    print("\(brand) \(model) : Accelerating to \(currentSpeed) km/h")
  }

  override func brake() {
    currentSpeed -= 20
    if currentSpeed < 0 { currentSpeed = 0 }
    print("\(brand) \(model) : Braking! Speed is now \(currentSpeed) km/h")
  }
}

// StaticAndDynamicPolymorphismElectricCar Subclass
class StaticAndDynamicPolymorphismElectricCar: StaticAndDynamicPolymorphismCar {
  private var batteryLevel: Int = 100

  override init(brand: String, model: String) {
    super.init(brand: brand, model: model)
  }

  func chargeBattery() {
    batteryLevel = 100
    print("\(brand) \(model) : Battery fully charged!")
  }

  override func accelerate() {
    guard isEngineOn else {
      print("\(brand) \(model) : Cannot accelerate! Engine is off.")
      return
    }
    guard batteryLevel > 0 else {
      print("\(brand) \(model) : Battery dead!")
      return
    }
    batteryLevel -= 10
    currentSpeed += 15
    print("\(brand) \(model) : Accelerating to \(currentSpeed) km/h. Battery at \(batteryLevel)%.")
  }

  override func accelerate(speed: Int) {
    guard isEngineOn else {
      print("\(brand) \(model) : Cannot accelerate! Engine is off.")
      return
    }
    batteryLevel -= (10 + speed)
    currentSpeed += speed
    print("\(brand) \(model) : Accelerating to \(currentSpeed) km/h. Battery at \(batteryLevel)%.")
  }

  override func brake() {
    currentSpeed -= 15
    if currentSpeed < 0 { currentSpeed = 0 }
    print(
      "\(brand) \(model) : Regenerative braking! Speed is now \(currentSpeed) km/h. Battery at \(batteryLevel)%."
    )
  }
}

// --- Main Execution ---
func staticAndDynamicPolymorphismDemo() {

  let cars: [StaticAndDynamicPolymorphismCar] = [
    StaticAndDynamicPolymorphismManualCar(brand: "Ford", model: "Mustang"),
    StaticAndDynamicPolymorphismElectricCar(brand: "Tesla", model: "Model S"),
  ]

  for car in cars {
    car.startEngine()
    car.accelerate()
    car.accelerate(speed: 30)  // Testing the overloaded method
    car.brake()
    car.stopEngine()
    print("----------------------")
  }
}
