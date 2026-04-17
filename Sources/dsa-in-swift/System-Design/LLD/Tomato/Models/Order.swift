import Foundation

class Order {
  let user: User
  let restaurant: Restaurant
  let items: [MenuItem]
  let total: Double

  init(user: User, restaurant: Restaurant, items: [MenuItem]) {
    self.user = user
    self.restaurant = restaurant
    self.items = items
    self.total = items.reduce(0) { $0 + $1.price }
  }
}
