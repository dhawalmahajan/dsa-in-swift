import Foundation

class TomatoApp {
  private let restaurantManager = RestaurantManager()
  private let orderManager = OrderManager()

  func start() {
    print("Welcome to the Tomato Food Ordering System!")
    // Example usage
    let restaurant = restaurantManager.addRestaurant(name: "Tomato Bistro")
    let user = User(name: "John Doe")
    let menuItem = MenuItem(name: "Pizza", price: 12.99)
    restaurant.addMenuItem(menuItem)
    let order = orderManager.createOrder(user: user, restaurant: restaurant, items: [menuItem])
    print("Order created: \(order)")
  }
}

public func tomatoAppDemo() {
  let app = TomatoApp()
  app.start()
}
