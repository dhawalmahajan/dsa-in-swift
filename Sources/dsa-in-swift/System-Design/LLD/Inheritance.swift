import Foundation

class InheritanceCar {
  // 'internal' is the default, similar to 'protected' in this context
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

  func accelerate() {
    if !isEngineOn {
      print("\(brand) \(model) : Cannot accelerate! Engine is off.")
      return
    }
    currentSpeed += 20
    print("\(brand) \(model) : Accelerating to \(currentSpeed) km/h")
  }

  func brake() {
    currentSpeed -= 20
    if currentSpeed < 0 { currentSpeed = 0 }
    print("\(brand) \(model) : Braking! Speed is now \(currentSpeed) km/h")
  }
}

// Inherits from InheritanceCar
class InheritanceManualCar: InheritanceCar {
  private var currentGear: Int  // Specific to Manual Car

  override init(brand: String, model: String) {
    self.currentGear = 0
    // In Swift, you must initialize subclass properties before calling super.init
    super.init(brand: brand, model: model)
  }

  // Specialized method for Manual Car
  func shiftGear(_ gear: Int) {
    currentGear = gear
    print("\(brand) \(model) : Shifted to gear \(currentGear)")
  }
}

// Inherits from InheritanceCar
class InheritanceElectricCar: InheritanceCar {
  private var batteryLevel: Int  // Specific to Electric Car

  override init(brand: String, model: String) {
    self.batteryLevel = 100
    super.init(brand: brand, model: model)
  }

  // Specialized method for Electric Car
  func chargeBattery() {
    batteryLevel = 100
    print("\(brand) \(model) : Battery fully charged!")
  }
}

// --- Main Execution ---
func inheritanceDemo() {

  let myManualCar = InheritanceManualCar(brand: "Suzuki", model: "WagonR")
  myManualCar.startEngine()
  myManualCar.shiftGear(1)
  myManualCar.accelerate()
  myManualCar.brake()
  myManualCar.stopEngine()

  print("----------------------")

  let myElectricCar = InheritanceElectricCar(brand: "Tesla", model: "Model S")
  myElectricCar.chargeBattery()
  myElectricCar.startEngine()
  myElectricCar.accelerate()
  myElectricCar.brake()
  myElectricCar.stopEngine()
}
