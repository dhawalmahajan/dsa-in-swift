import Foundation

class TimeUtils {
  static func getCurrentTime() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter.string(from: Date())
  }
}
