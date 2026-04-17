import Foundation

class NotificationService {
  func sendNotification(to user: User, message: String) {
    print("Notification sent to \(user.name): \(message)")
  }
}
