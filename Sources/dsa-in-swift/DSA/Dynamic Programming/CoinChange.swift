//
//  CoinChange.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 27/08/26.
//
/**
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 Example 1:

     Input: coins = [1, 2, 5], amount = 11
     Output: 3
     
     Explanation: 11 = 5 + 5 + 1
 
 Example 2:

     Input: coins = [2], amount = 3
     Output: -1
     
 Note:
 You may assume that you have an infinite number of each kind of coin.
*/

public func coinChangeDemo() {
    print(coinChange([1, 2, 5], 11))
}
private func coinChange(_ coins:[Int],_ amount: Int) -> Int {
    guard amount > 0 else {
        return 0
    }
    var dp = Array(repeating: amount + 1, count: amount + 1)
    dp[0] = 0

    for currentAmount in 0 ... amount {
        for coin in coins.filter({ $0 <= currentAmount }) {
            dp[currentAmount] = min(dp[currentAmount], 1 + dp[currentAmount - coin])
        }
    }
    return dp[amount] > amount ? -1 : dp[amount]
}
