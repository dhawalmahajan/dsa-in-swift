/*
 * 0-1 Knapsack Problem: Imagine you are a thief and you want to steal things
 * from room full of things. You have a knapsack which can handle maximum
 * capacity of weight W, and you want to fill it up such that it's worth is
 * maximum. Being an intelligent thief, you know weights and values of each item
 * in the room. How would you fill your knapsack, such that you get the maximum
 * possible value for your knapsack of capacity W.
 *
 * The problem essentially boils down to whether item i would be part of your
 * loot or not. This has optimal substructure: case 1: Item I is in your loot:
 *  Then the maximum value of the loot is determined by remaining n-1 items
 * whose possible weight would be W-(weight of Item I)
 *
 * case 2: Item I is not in your loot:
 * Then the maximum value of the loot is determined by remaining n-1 items whose
 * possible weight would be W. (i.e excluding the ith item)
 *
 * We could get all subsets of possible items in the loot, and choose the one
 * with maximum value.
 *
 * Since this problem will have overlapping subproblems, we could use dynamic
 * programming to solve it. So that we don't recurse to calculate the same
 * subproblem which we have already calculated.
 *
 */

import Foundation

func maximumPossibleLootValue(weights: [Int], values: [Int], capacity: Int) -> Int {
  let itemsCount = values.count

  // Create DP table (itemsCount + 1) x (capacity + 1)
  var loots = Array(
    repeating: Array(repeating: 0, count: capacity + 1),
    count: itemsCount + 1
  )

  for i in 0...itemsCount {
    for w in 0...capacity {
      if i == 0 || w == 0 {
        loots[i][w] = 0
      } else if weights[i - 1] <= w {
        loots[i][w] = max(
          values[i - 1] + loots[i - 1][w - weights[i - 1]],
          loots[i - 1][w]
        )
      } else {
        loots[i][w] = loots[i - 1][w]
      }
    }
  }

  return loots[itemsCount][capacity]
}

func printVector(_ vec: [Int]) {
  for v in vec {
    print(v, terminator: " ")
  }
  print()
}

// MARK: - Main
func possibleLootValueDemo() {
  let values = [40, 10, 90]
  let weights = [20, 40, 60]
  let capacity = 100

  print("Weights of items:", terminator: " ")
  printVector(weights)

  print("Values of items:", terminator: " ")
  printVector(values)

  print("Capacity: \(capacity)")

  let result = maximumPossibleLootValue(
    weights: weights,
    values: values,
    capacity: capacity
  )

  print("Maximum possible loot value for capacity \(capacity): \(result)")

}
