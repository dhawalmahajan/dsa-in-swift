import Foundation

class ScheduledOrderFactory: OrderFactory {
  func createOrder(user: User, restaurant: Restaurant, items: [MenuItem]) -> Order {
    print("Scheduled order created.")
    return Order(user: user, restaurant: restaurant, items: items)
  }
}
