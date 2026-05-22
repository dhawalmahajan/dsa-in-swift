import Foundation

class SportsCar {
  // Private properties (Encapsulation)
  private var brand: String
  private var model: String
  private var isEngineOn: Bool
  private var currentSpeed: Int
  private var currentGear: Int
  private var tyreCompany: String

  // Initializer (Constructor)
  init(brand: String, model: String) {
    self.brand = brand
    self.model = model
    self.isEngineOn = false
    self.currentSpeed = 0
    self.currentGear = 0
    self.tyreCompany = "MRF"
  }

  // Getter for Speed
  func getSpeed() -> Int {
    return currentSpeed
  }

  // Getter and Setter for Tyre Company
  func getTyreCompany() -> String {
    return tyreCompany
  }

  func setTyreCompany(_ tyreCompany: String) {
    self.tyreCompany = tyreCompany
  }

  // Public Behaviours
  func startEngine() {
    isEngineOn = true
    print("\(brand) \(model) : Engine starts with a roar!")
  }

  func shiftGear(_ gear: Int) {
    if !isEngineOn {
      print("\(brand) \(model) : Engine is off! Cannot Shift Gear.")
      return
    }
    currentGear = gear
    print("\(brand) \(model) : Shifted to gear \(currentGear)")
  }

  func accelerate() {
    if !isEngineOn {
      print("\(brand) \(model) : Engine is off! Cannot accelerate.")
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

  func stopEngine() {
    isEngineOn = false
    currentGear = 0
    currentSpeed = 0
    print("\(brand) \(model) : Engine turned off.")
  }

  // Deinitializer (Destructor)
  deinit {
    // Swift handles memory automatically, but you can perform cleanup here
  }
}

// --- Main Method Logic ---
func encapsulationDemo() {
  // Creating the object
  let mySportsCar = SportsCar(brand: "Ford", model: "Mustang")

  mySportsCar.startEngine()
  mySportsCar.shiftGear(1)
  mySportsCar.accelerate()
  mySportsCar.shiftGear(2)
  mySportsCar.accelerate()
  mySportsCar.brake()
  mySportsCar.stopEngine()

  // Accessing through a getter
  print("Current Speed of My Sports Car is \(mySportsCar.getSpeed())")

  // Note: Attempting to access mySportsCar.currentSpeed directly
  // would cause a compiler error in Swift, just like in C++.
}
