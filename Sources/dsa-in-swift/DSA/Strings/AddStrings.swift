/*
Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

Example 1:

Input: num1 = "11", num2 = "123"
Output: "134"
Example 2:

Input: num1 = "456", num2 = "77"
Output: "533"
Example 3:

Input: num1 = "0", num2 = "0"
Output: "0"


Constraints:

1 <= num1.length, num2.length <= 104
num1 and num2 consist of only digits.
num1 and num2 don't have any leading zeros except for the zero itself.
*/

// Runtime - 5ms
func addStrings(_ num1: String, _ num2: String) -> String {
  var ans: String = ""
  var carry: Int = 0
  var sum: Int = 0
  var i = num1.count - 1
  var j = num2.count - 1
  let arr1 = Array(num1)
  let arr2 = Array(num2)
  while i >= 0 || j >= 0 || carry > 0 {
    let n1 = i >= 0 ? getNumberFromAsciiValue(arr1[i]) : 0
    let n2 = j >= 0 ? getNumberFromAsciiValue(arr2[j]) : 0
    sum = n1 + n2 + carry
    if sum > 9 {
      carry = sum / 10
      sum = sum % 10
    } else {
      carry = 0
    }
    ans = "\(sum)" + ans
    i -= 1
    j -= 1
  }
  return ans
}
private func addStringsOptimized(_ num1: String, _ num2: String) -> String {
  var inum1 = num1.map { $0.wholeNumberValue ?? 0 }
  var inum2 = num2.map { $0.wholeNumberValue ?? 0 }

  var result = [String]()
  let last1 = inum1.count - 1
  let last2 = inum2.count - 1
  var carry = 0
  while !inum1.isEmpty || !inum2.isEmpty {
    var sum = carry

    if let last1 = inum1.last {
      sum += last1
      inum1.removeLast()
    }

    if let last2 = inum2.last {
      sum += last2
      inum2.removeLast()
    }

    result.append(String(sum % 10))
    carry = sum / 10
  }

  if carry != 0 {
    result.append(String(carry))
  }

  return result.reversed().joined()  // .map{String($0)}.joined()
}
private func getNumberFromAsciiValue(_ char: Character) -> Int {
  if let n = char.asciiValue, let digit = Character("0").asciiValue {
    let v = n - digit
    return Int(v)
  }
  return 0
}

func addStringsDemo() {
  let num1 = "456"
  let num2 = "77"
  // print(addStringsOptimized(num1, num2))
  print(addStrings(num1, num2))
}
