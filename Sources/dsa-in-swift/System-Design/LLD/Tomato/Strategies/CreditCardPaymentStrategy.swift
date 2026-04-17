import Foundation

class CreditCardPaymentStrategy: PaymentStrategy {
  func pay(amount: Double) {
    print("Paid \(amount) using Credit Card.")
  }
}
