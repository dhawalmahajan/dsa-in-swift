import Foundation

// --- Strategy Protocol for Walk ---
protocol WalkableRobot {
  func walk()
}

// --- Concrete Strategies for Walk ---
class NormalWalk: WalkableRobot {
  func walk() {
    print("Walking normally...")
  }
}

class NoWalk: WalkableRobot {
  func walk() {
    print("Cannot walk.")
  }
}

// --- Strategy Protocol for Talk ---
protocol TalkableRobot {
  func talk()
}

// --- Concrete Strategies for Talk ---
class NormalTalk: TalkableRobot {
  func talk() {
    print("Talking normally...")
  }
}

class NoTalk: TalkableRobot {
  func talk() {
    print("Cannot talk.")
  }
}

// --- Strategy Protocol for Fly ---
protocol FlyableRobot {
  func fly()
}

// --- Concrete Strategies for Fly ---
class NormalFly: FlyableRobot {
  func fly() {
    print("Flying normally...")
  }
}

class NoFly: FlyableRobot {
  func fly() {
    print("Cannot fly.")
  }
}

// --- Robot Base Class ---
class Robot {
  private let walkBehavior: WalkableRobot
  private let talkBehavior: TalkableRobot
  private let flyBehavior: FlyableRobot

  init(walkBehavior: WalkableRobot, talkBehavior: TalkableRobot, flyBehavior: FlyableRobot) {
    self.walkBehavior = walkBehavior
    self.talkBehavior = talkBehavior
    self.flyBehavior = flyBehavior
  }

  func walk() {
    walkBehavior.walk()
  }

  func talk() {
    talkBehavior.talk()
  }

  func fly() {
    flyBehavior.fly()
  }

  func projection() {
    fatalError("Subclasses must override projection()")
  }
}

// --- Concrete Robot Types ---
class CompanionRobot: Robot {
  override func projection() {
    print("Displaying friendly companion features...")
  }
}

class WorkerRobot: Robot {
  override func projection() {
    print("Displaying worker efficiency stats...")
  }
}

func strategyDesignPatternDemo() {
  // --- Main Execution ---
  let robot1: Robot = CompanionRobot(
    walkBehavior: NormalWalk(),
    talkBehavior: NormalTalk(),
    flyBehavior: NoFly()
  )
  robot1.walk()
  robot1.talk()
  robot1.fly()
  robot1.projection()

  print("--------------------")

  let robot2: Robot = WorkerRobot(
    walkBehavior: NoWalk(),
    talkBehavior: NoTalk(),
    flyBehavior: NormalFly()
  )
  robot2.walk()
  robot2.talk()
  robot2.fly()
  robot2.projection()

}
