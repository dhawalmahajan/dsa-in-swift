import Foundation

// MARK: - Subscriber Protocol (Observer)
protocol Subscriber: AnyObject {
  func update()
}

// MARK: - Channel Protocol (Observable / Subject)
protocol ChannelProtocol: AnyObject {
  func subscribe(_ subscriber: Subscriber)
  func unsubscribe(_ subscriber: Subscriber)
  func notifySubscribers()
}

// MARK: - Concrete Subject (Channel)
class Channel: ChannelProtocol {

  private var subscribers: [Subscriber] = []
  private let name: String
  private var latestVideo: String = ""

  init(name: String) {
    self.name = name
  }

  // Add subscriber (avoid duplicates)
  func subscribe(_ subscriber: Subscriber) {
    if !subscribers.contains(where: { $0 === subscriber }) {
      subscribers.append(subscriber)
    }
  }

  // Remove subscriber
  func unsubscribe(_ subscriber: Subscriber) {
    subscribers.removeAll { $0 === subscriber }
  }

  // Notify all subscribers
  func notifySubscribers() {
    subscribers.forEach { $0.update() }
  }

  // Upload video
  func uploadVideo(_ title: String) {
    latestVideo = title
    print("\n[\(name) uploaded \"\(title)\"]")
    notifySubscribers()
  }

  // Provide data to subscribers
  func getVideoData() -> String {
    return "\nCheckout our new Video : \(latestVideo)\n"
  }
}

// MARK: - Concrete Observer
class UserSubscriber: Subscriber {

  private let name: String
  private weak var channel: Channel?

  init(name: String, channel: Channel) {
    self.name = name
    self.channel = channel
  }

  func update() {
    guard let channel = channel else { return }
    print("Hey \(name),\(channel.getVideoData())")
  }
}

func observerPatternDemo() {
  // Main Execution
  let channel = Channel(name: "CoderArmy")

  let sub1 = UserSubscriber(name: "Varun", channel: channel)
  let sub2 = UserSubscriber(name: "Tarun", channel: channel)

  // Subscribe
  channel.subscribe(sub1)
  channel.subscribe(sub2)

  // Upload video → both notified
  channel.uploadVideo("Observer Pattern Tutorial")

  // Unsubscribe one
  channel.unsubscribe(sub1)

  // Upload again → only Tarun notified
  channel.uploadVideo("Decorator Pattern Tutorial")
}
