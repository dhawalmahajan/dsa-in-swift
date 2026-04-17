import Foundation

class RestaurantManager {
  private var restaurants: [Restaurant] = []

  func addRestaurant(name: String) -> Restaurant {
    let restaurant = Restaurant(name: name)
    restaurants.append(restaurant)
    return restaurant
  }

  func getRestaurants() -> [Restaurant] {
    return restaurants
  }
}
