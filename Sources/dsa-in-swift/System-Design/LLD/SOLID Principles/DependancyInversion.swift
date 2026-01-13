import Foundation

// Abstraction (Interface)
protocol Database {
  func save(data: String)
}

// MySQL implementation (Low-level module)
class MySQLDatabase: Database {
  func save(data: String) {
    print("Executing SQL Query: INSERT INTO users VALUES('\(data)');")
  }
}

// MongoDB implementation (Low-level module)
class MongoDBDatabase: Database {
  func save(data: String) {
    print("Executing MongoDB Function: db.users.insert({name: '\(data)'})")
  }
}

// High-level module (Loose coupling via Dependency Injection)
class UserService {
  // In Swift, we use protocols as types.
  // This allows any class conforming to Database to be injected.
  private let db: Database

  init(database: Database) {
    self.db = database
  }

  func storeUser(user: String) {
    db.save(data: user)
  }
}
func dependencyInversionDemo() {
  // --- Main Execution ---

  let mysql = MySQLDatabase()
  let mongodb = MongoDBDatabase()

  // Injecting MySQL
  let service1 = UserService(database: mysql)
  service1.storeUser(user: "Aditya")

  // Injecting MongoDB
  let service2 = UserService(database: mongodb)
  service2.storeUser(user: "Rohit")
}
