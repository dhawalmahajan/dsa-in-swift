import Foundation

// Component Protocol
protocol Character {
  func getAbilities() -> String
}

// Concrete Component
class Mario: Character {
  func getAbilities() -> String {
    return "Mario"
  }
}

// Abstract Decorator
class CharacterDecorator: Character {
  let character: Character

  init(_ character: Character) {
    self.character = character
  }

  func getAbilities() -> String {
    return character.getAbilities()
  }
}

// Concrete Decorator: HeightUp
class HeightUp: CharacterDecorator {
  override func getAbilities() -> String {
    return character.getAbilities() + " with HeightUp"
  }
}

// Concrete Decorator: GunPowerUp
class GunPowerUp: CharacterDecorator {
  override func getAbilities() -> String {
    return character.getAbilities() + " with Gun"
  }
}

// Concrete Decorator: StarPowerUp
class StarPowerUp: CharacterDecorator {
  override func getAbilities() -> String {
    return character.getAbilities() + " with Star Power (Limited Time)"
  }

  deinit {
    print("Destroying StarPowerUp Decorator")
  }
}

func decoratorPatternDemo() {
  // Usage
  var mario: Character = Mario()
  print("Basic Character:", mario.getAbilities())

  mario = HeightUp(mario)
  print("After HeightUp:", mario.getAbilities())

  mario = GunPowerUp(mario)
  print("After GunPowerUp:", mario.getAbilities())

  mario = StarPowerUp(mario)
  print("After StarPowerUp:", mario.getAbilities())
}
