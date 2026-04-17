import Foundation

protocol OrderFactory {
  func createOrder(user: User, restaurant: Restaurant, items: [MenuItem]) -> Order
}
