import Foundation

protocol PaymentStrategy {
  func pay(amount: Double)
}
