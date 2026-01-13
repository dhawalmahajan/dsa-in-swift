import Foundation

// Product class representing any item in eCommerce.
class Product {
  var name: String
  var price: Double

  init(name: String, price: Double) {
    self.name = name
    self.price = price
  }
}

// 1. ShoppingCart: Responsible for Cart related business logic.
class ShoppingCart {
  private var products: [Product] = []

  func addProduct(_ product: Product) {
    products.append(product)
  }

  func getProducts() -> [Product] {
    return products
  }

  // Calculates total price in cart.
  func calculateTotal() -> Double {
    return products.reduce(0) { $0 + $1.price }
  }
}

// 2. ShoppingCartPrinter: Responsible for printing invoices
class ShoppingCartPrinter {
  private let cart: ShoppingCart

  init(cart: ShoppingCart) {
    self.cart = cart
  }

  func printInvoice() {
    print("Shopping Cart Invoice:")
    for product in cart.getProducts() {
      print("\(product.name) - Rs \(product.price)")
    }
    print("Total: Rs \(cart.calculateTotal())")
  }
}

// Abstraction: Protocol (Swift's equivalent to C++ abstract base classes)
protocol Persistence {
  func save(cart: ShoppingCart)
}

class SQLPersistence: Persistence {
  func save(cart: ShoppingCart) {
    print("Saving shopping cart to SQL DB...")
  }
}

class MongoPersistence: Persistence {
  func save(cart: ShoppingCart) {
    print("Saving shopping cart to MongoDB...")
  }
}

class FilePersistence: Persistence {
  func save(cart: ShoppingCart) {
    print("Saving shopping cart to a file...")
  }
}

// --- Main Execution ---
func openCloseDemo() {
  // Creating a shopping cart and adding products
  let cart = ShoppingCart()
  cart.addProduct(Product(name: "Laptop", price: 50000))
  cart.addProduct(Product(name: "Mouse", price: 2000))

  let printer = ShoppingCartPrinter(cart: cart)
  printer.printInvoice()

  // Polymorphism using the Persistence protocol
  let persistenceSystems: [Persistence] = [
    SQLPersistence(),
    MongoPersistence(),
    FilePersistence(),
  ]

  for system in persistenceSystems {
    system.save(cart: cart)
  }
}
