//
//  NotificationSystem.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 27/05/26.
//

import Foundation

/*============================
      Notification & Decorators
=============================*/

protocol INotification {
    func getContent() -> String
}

// Concrete Notification: simple text notification.
class SimpleNotification: INotification {

    private var text: String

    init(_ msg: String) {
        self.text = msg
    }

    func getContent() -> String {
        return text
    }
}

// Abstract Decorator: wraps a Notification object.
class INotificationDecorator: INotification {

    internal var notification: INotification

    init(_ notification: INotification) {
        self.notification = notification
    }

    func getContent() -> String {
        return notification.getContent()
    }
}

// Decorator to add timestamp
class TimestampDecorator: INotificationDecorator {

    override func getContent() -> String {
        return "[2025-04-13 14:22:00] " + notification.getContent()
    }
}

// Decorator to append signature
class SignatureDecorator: INotificationDecorator {

    private var signature: String

    init(_ notification: INotification, _ signature: String) {
        self.signature = signature
        super.init(notification)
    }

    override func getContent() -> String {
        return notification.getContent() + "\n-- \(signature)\n\n"
    }
}

/*============================
  Observer Pattern Components
=============================*/

protocol IObserver: AnyObject {
    func update()
}

protocol IObservable {
    func addObserver(_ observer: IObserver)
    func removeObserver(_ observer: IObserver)
    func notifyObservers()
}

// Concrete Observable
class NotificationObservable: IObservable {

    private var observers: [IObserver] = []
    private var currentNotification: INotification?

    func addObserver(_ observer: IObserver) {
        observers.append(observer)
    }

    func removeObserver(_ observer: IObserver) {
        observers.removeAll { $0 === observer }
    }

    func notifyObservers() {
        for observer in observers {
            observer.update()
        }
    }

    func setNotification(_ notification: INotification) {
        currentNotification = notification
        notifyObservers()
    }

    func getNotification() -> INotification? {
        return currentNotification
    }

    func getNotificationContent() -> String {
        return currentNotification?.getContent() ?? ""
    }
}

/*============================
       NotificationSystemService
=============================*/

// Singleton Class
class NotificationSystemService {

    @MainActor static let shared = NotificationSystemService()

    private var observable = NotificationObservable()
    private var notifications: [INotification] = []

    private init() {}

    func getObservable() -> NotificationObservable {
        return observable
    }

    // Creates a new Notification and notifies observers.
    func sendNotification(_ notification: INotification) {
        notifications.append(notification)
        observable.setNotification(notification)
    }
}

/*============================
       ConcreteObservers
=============================*/
@MainActor
class Logger: @MainActor IObserver {

    private var notificationObservable: NotificationObservable

    init() {
        self.notificationObservable =
            NotificationSystemService.shared.getObservable()

        notificationObservable.addObserver(self)
    }

    init(_ observable: NotificationObservable) {
        self.notificationObservable = observable
        notificationObservable.addObserver(self)
    }

    func update() {
        print("Logging New Notification :")
        print(notificationObservable.getNotificationContent())
    }
}

/*============================
  Strategy Pattern Components
=============================*/

// Abstract class for Notification Strategies.
protocol INotificationStrategy {
    func sendNotification(_ content: String)
}

class EmailStrategy: INotificationStrategy {

    private var emailId: String

    init(_ emailId: String) {
        self.emailId = emailId
    }

    func sendNotification(_ content: String) {
        print("Sending Email Notification to: \(emailId)")
        print(content)
    }
}

class SMSStrategy: INotificationStrategy {

    private var mobileNumber: String

    init(_ mobileNumber: String) {
        self.mobileNumber = mobileNumber
    }

    func sendNotification(_ content: String) {
        print("Sending SMS Notification to: \(mobileNumber)")
        print(content)
    }
}

class PopUpStrategy: INotificationStrategy {

    func sendNotification(_ content: String) {
        print("Sending Popup Notification:")
        print(content)
    }
}
@MainActor
class NotificationEngine: @MainActor IObserver {

    private var notificationObservable: NotificationObservable
    private var notificationStrategies: [INotificationStrategy] = []

    init() {
        self.notificationObservable =
            NotificationSystemService.shared.getObservable()

        notificationObservable.addObserver(self)
    }

    init(_ observable: NotificationObservable) {
        self.notificationObservable = observable
    }

    func addNotificationStrategy(
        _ strategy: INotificationStrategy
    ) {
        notificationStrategies.append(strategy)
    }

    func update() {

        let notificationContent =
            notificationObservable.getNotificationContent()

        for strategy in notificationStrategies {
            strategy.sendNotification(notificationContent)
        }
    }
}

/*============================
                Main
=============================*/

@MainActor func notificationServiceDemo() {

    // Create NotificationSystemService
    let NotificationSystemService = NotificationSystemService.shared

    // Create Logger Observer
    let logger = Logger()

    // Create NotificationEngine Observer
    let notificationEngine = NotificationEngine()

    notificationEngine.addNotificationStrategy(
        EmailStrategy("random.person@gmail.com")
    )

    notificationEngine.addNotificationStrategy(
        SMSStrategy("+91 9876543210")
    )

    notificationEngine.addNotificationStrategy(
        PopUpStrategy()
    )

    // Create notification with decorators
    var notification: INotification =
        SimpleNotification("Your order has been shipped!")

    notification = TimestampDecorator(notification)

    notification = SignatureDecorator(
        notification,
        "Customer Care"
    )

    // Send Notification
    NotificationSystemService.sendNotification(notification)

    // Prevent unused variable warnings
    _ = logger
}


