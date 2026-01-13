import Foundation

// Product class representing any item in eCommerce.
class SRPProduct {
  var name: String
  var price: Double

  init(name: String, price: Double) {
    self.name = name
    self.price = price
  }
}

// 1. ShoppingCart: Responsible for Cart related business logic.
class SRPShoppingCart {
  private var products: [SRPProduct] = []  // Standard Swift Array (replaces vector)

  func addProduct(_ p: SRPProduct) {
    products.append(p)
  }

  func getProducts() -> [SRPProduct] {
    return products
  }

  // Calculates total price in cart using reduce (functional approach)
  func calculateTotal() -> Double {
    return products.reduce(0.0) { $0 + $1.price }
  }
}

// 2. ShoppingCartPrinter: Responsible for printing invoices
class SRPShoppingCartPrinter {
  private let cart: SRPShoppingCart

  init(cart: SRPShoppingCart) {
    self.cart = cart
  }

  func printInvoice() {
    print("Shopping Cart Invoice:")
    for p in cart.getProducts() {
      print("\(p.name) - Rs \(p.price)")
    }
    print("Total: Rs \(cart.calculateTotal())")
  }
}

// 3. ShoppingCartStorage: Responsible for saving cart to DB
class SRPShoppingCartStorage {
  private let cart: SRPShoppingCart

  init(cart: SRPShoppingCart) {
    self.cart = cart
  }

  func saveToDatabase() {
    print("Saving shopping cart to database...")
  }
}

// --- Main Execution ---
func SRPDemo() {
  let cart = SRPShoppingCart()

  // In Swift, we don't use 'new'. Memory is managed automatically.
  cart.addProduct(SRPProduct(name: "Laptop", price: 50000))
  cart.addProduct(SRPProduct(name: "Mouse", price: 2000))
  let printer = SRPShoppingCartPrinter(cart: cart)
  printer.printInvoice()

  let db = SRPShoppingCartStorage(cart: cart)
  db.saveToDatabase()
}
