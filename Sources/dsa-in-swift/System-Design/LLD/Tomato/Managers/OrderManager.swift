import Foundation

class OrderManager {
  func createOrder(user: User, restaurant: Restaurant, items: [MenuItem]) -> Order {
    return Order(user: user, restaurant: restaurant, items: items)
  }
}
