import Foundation

// Equivalent to C++ abstract base classes
protocol DepositOnlyAccount {
  func deposit(amount: Double)
}

// Protocol inheritance: WithdrawableAccount inherits requirements from DepositOnlyAccount
protocol WithdrawableAccount: DepositOnlyAccount {
  func withdraw(amount: Double)
}

// Concrete implementation: SavingAccount
class SavingAccount: WithdrawableAccount {
  private var balance: Double = 0

  func deposit(amount: Double) {
    balance += amount
    print("Deposited: \(amount) in Savings Account. New Balance: \(balance)")
  }

  func withdraw(amount: Double) {
    if balance >= amount {
      balance -= amount
      print("Withdrawn: \(amount) from Savings Account. New Balance: \(balance)")
    } else {
      print("Insufficient funds in Savings Account!")
    }
  }
}

// Concrete implementation: CurrentAccount
class CurrentAccount: WithdrawableAccount {
  private var balance: Double = 0

  func deposit(amount: Double) {
    balance += amount
    print("Deposited: \(amount) in Current Account. New Balance: \(balance)")
  }

  func withdraw(amount: Double) {
    if balance >= amount {
      balance -= amount
      print("Withdrawn: \(amount) from Current Account. New Balance: \(balance)")
    } else {
      print("Insufficient funds in Current Account!")
    }
  }
}

// Concrete implementation: FixedTermAccount (Only Deposit allowed)
class FixedTermAccount: DepositOnlyAccount {
  private var balance: Double = 0

  func deposit(amount: Double) {
    balance += amount
    print("Deposited: \(amount) in Fixed Term Account. New Balance: \(balance)")
  }
}

// BankClient handles both types of accounts
class BankClient {
  private var withdrawableAccounts: [WithdrawableAccount]
  private var depositOnlyAccounts: [DepositOnlyAccount]

  init(withdrawableAccounts: [WithdrawableAccount], depositOnlyAccounts: [DepositOnlyAccount]) {
    self.withdrawableAccounts = withdrawableAccounts
    self.depositOnlyAccounts = depositOnlyAccounts
  }

  func processTransactions() {
    // Iterate through withdrawable accounts
    for acc in withdrawableAccounts {
      acc.deposit(amount: 1000)
      acc.withdraw(amount: 500)
    }

    // Iterate through deposit-only accounts
    for acc in depositOnlyAccounts {
      acc.deposit(amount: 5000)
    }
  }
}

// --- Main Execution ---
func liskovSubstitutionDemo() {
  let withdrawables: [WithdrawableAccount] = [SavingAccount(), CurrentAccount()]
  let depositOnlys: [DepositOnlyAccount] = [FixedTermAccount()]

  let client = BankClient(withdrawableAccounts: withdrawables, depositOnlyAccounts: depositOnlys)
  client.processTransactions()
}
