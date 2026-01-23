import Foundation

//TODO: Watch video again to understand better
// Product 1 --> Burger
protocol Burger {
  func prepare()
}

class BasicBurger: Burger {
  func prepare() {
    print("Preparing Basic Burger with bun, patty, and ketchup!")
  }
}

class StandardBurger: Burger {
  func prepare() {
    print("Preparing Standard Burger with bun, patty, cheese, and lettuce!")
  }
}

class PremiumBurger: Burger {
  func prepare() {
    print(
      "Preparing Premium Burger with gourmet bun, premium patty, cheese, lettuce, and secret sauce!"
    )
  }
}

class BasicWheatBurger: Burger {
  func prepare() {
    print("Preparing Basic Wheat Burger with bun, patty, and ketchup!")
  }
}

class StandardWheatBurger: Burger {
  func prepare() {
    print("Preparing Standard Wheat Burger with bun, patty, cheese, and lettuce!")
  }
}

class PremiumWheatBurger: Burger {
  func prepare() {
    print(
      "Preparing Premium Wheat Burger with gourmet bun, premium patty, cheese, lettuce, and secret sauce!"
    )
  }
}

// Product 2 --> GarlicBread
protocol GarlicBread {
  func prepare()
}

class BasicGarlicBread: GarlicBread {
  func prepare() {
    print("Preparing Basic Garlic Bread with butter and garlic!")
  }
}

class CheeseGarlicBread: GarlicBread {
  func prepare() {
    print("Preparing Cheese Garlic Bread with extra cheese and butter!")
  }
}

class BasicWheatGarlicBread: GarlicBread {
  func prepare() {
    print("Preparing Basic Wheat Garlic Bread with butter and garlic!")
  }
}

class CheeseWheatGarlicBread: GarlicBread {
  func prepare() {
    print("Preparing Cheese Wheat Garlic Bread with extra cheese and butter!")
  }
}

// Factory Protocol
protocol MealFactory {
  func createBurger(type: String) -> Burger?
  func createGarlicBread(type: String) -> GarlicBread?
}

// Concrete Factory 1
class SinghBurger: MealFactory {
  func createBurger(type: String) -> Burger? {
    switch type {
    case "basic":
      return BasicBurger()
    case "standard":
      return StandardBurger()
    case "premium":
      return PremiumBurger()
    default:
      print("Invalid burger type!")
      return nil
    }
  }

  func createGarlicBread(type: String) -> GarlicBread? {
    switch type {
    case "basic":
      return BasicGarlicBread()
    case "cheese":
      return CheeseGarlicBread()
    default:
      print("Invalid Garlic bread type!")
      return nil
    }
  }
}

// Concrete Factory 2
class KingBurger: MealFactory {
  func createBurger(type: String) -> Burger? {
    switch type {
    case "basic":
      return BasicWheatBurger()
    case "standard":
      return StandardWheatBurger()
    case "premium":
      return PremiumWheatBurger()
    default:
      print("Invalid burger type!")
      return nil
    }
  }

  func createGarlicBread(type: String) -> GarlicBread? {
    switch type {
    case "basic":
      return BasicWheatGarlicBread()
    case "cheese":
      return CheeseWheatGarlicBread()
    default:
      print("Invalid Garlic bread type!")
      return nil
    }
  }
}
func abstractFactoryDemo() {
  // Main Execution
  let burgerType = "basic"
  let garlicBreadType = "cheese"

  let mealFactory: MealFactory = KingBurger()

  if let burger = mealFactory.createBurger(type: burgerType),
    let garlicBread = mealFactory.createGarlicBread(type: garlicBreadType)
  {
    burger.prepare()
    garlicBread.prepare()
  }
}
