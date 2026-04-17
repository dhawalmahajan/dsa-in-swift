import Foundation

class UpiPaymentStrategy: PaymentStrategy {
  func pay(amount: Double) {
    print("Paid \(amount) using UPI.")
  }
}
