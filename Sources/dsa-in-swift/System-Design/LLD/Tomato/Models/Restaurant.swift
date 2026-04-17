import Foundation

class Restaurant {
  let name: String
  private var menu: [MenuItem] = []

  init(name: String) {
    self.name = name
  }

  func addMenuItem(_ item: MenuItem) {
    menu.append(item)
  }

  func getMenu() -> [MenuItem] {
    return menu
  }
}
