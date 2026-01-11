import Foundation

/*
Abstract class -->
1. Act as an interface for the outside world to operate the car.
2. This abstract class tells 'WHAT' all it can do rather then 'HOW' it does that.
3. Since this is an abstract class we cannot directly create Objects of this class.
4. We need to Inherit it first and then that child class will have the responsibility to
provide implementation details of all the abstract (virtual) methods in the class.

5. In our real world example of Car, imagine you sitting in the car and able to operate
the car (startEngine, accelerate, brake, turn) just by pressing or moving some
pedals/buttons/ steer the wheel etc. You dont need to know how these things work, and
also they are hidden under the hood.
6. This Class 'Car' denotes that (pedals/buttons/steering wheel etc).
*/
// Base class
class AbstractionCar {
  func startEngine() {}
  func shiftGear(_ gear: Int) {}
  func accelerate() {}
  func brake() {}
  func stopEngine() {}
}

class RaceCar: AbstractionCar {
  var brand: String
  var model: String
  var isEngineOn: Bool
  var currentSpeed: Int
  var currentGear: Int

  // Constructor (Initializer)
  init(brand: String, model: String) {
    self.brand = brand
    self.model = model
    self.isEngineOn = false
    self.currentSpeed = 0
    self.currentGear = 0
  }

  override func startEngine() {
    isEngineOn = true
    print("\(brand) \(model) : Engine starts with a roar!")
  }

  override func shiftGear(_ gear: Int) {
    if !isEngineOn {
      print("\(brand) \(model) : Engine is off! Cannot Shift Gear.")
      return
    }
    currentGear = gear
    print("\(brand) \(model) : Shifted to gear \(currentGear)")
  }

  override func accelerate() {
    if !isEngineOn {
      print("\(brand) \(model) : Engine is off! Cannot accelerate.")
      return
    }
    currentSpeed += 20
    print("\(brand) \(model) : Accelerating to \(currentSpeed) km/h")
  }

  override func brake() {
    currentSpeed -= 20
    if currentSpeed < 0 { currentSpeed = 0 }
    print("\(brand) \(model) : Braking! Speed is now \(currentSpeed) km/h")
  }

  override func stopEngine() {
    isEngineOn = false
    currentGear = 0
    currentSpeed = 0
    print("\(brand) \(model) : Engine turned off.")
  }
}

func abstractionDemo() {
  print("=== Abstraction Demo ===")
  let myCar: AbstractionCar = RaceCar(brand: "Ford", model: "Mustang")

  myCar.startEngine()
  myCar.shiftGear(1)
  myCar.accelerate()
  myCar.shiftGear(2)
  myCar.accelerate()
  myCar.brake()
  myCar.stopEngine()

}
// Main Logic
