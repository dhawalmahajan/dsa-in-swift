func solve() {
  _ = Input.readInt()
  let arr = Input.readArray()
  let target = Input.readInt()

  print(binarySearch(arr, target))
  // print(containsNearbyDuplicate(arr, target))

}
func solveAndPrintValues() {

  // print(intersection([4, 9, 5], [9, 4, 9, 8, 4]))
  // print(binarySearch([1, 2, 3, 4, 5], 3))
  // print(isSubsequence("as", "basdcas"))
  // print(majorElement([3, 2, 3, 2, 3]))
  // print(findMaxConsecutiveOnes([1, 1, 1, 1, 0, 1, 1, 1]))
  // print(majority([3, 2, 3, 4, 1, 2, 5, 3]))
  // print(findPairs([1, 3, 1, 5, 4], 1))
  // print(containsDuplicate([1, 2, 3, 4, 5]))
  // print(containsNearbyDuplicate([1, 0, 1, 1], 1))
  // var nums = [1, 2, 2, 3, 3, 5, 5, 6]
  // print(removeDuplicates(&nums))
  // print(fizzBuzz(n: 15))
  // print(isPalindromicString(str: "tenet"))
  // print(firstUniqueChar(in: "interaction"))
  // print(validPalindrome("abca"))
  // print(romanToInt("MCMXCIV"))
  // print(linkList())
  // print(mergeLinkedLists())
  // detectLoopInLinkedList()
  detectCycleLoopAndLength()

}
