//
//  File.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 18/05/26.
//

import Foundation

enum DSADemo {
    // Top-level topics with associated nested enums for strong typing
    case basics(Basics)
    case strings(Strings)
    case linkedList(LinkedList)
    case stack(Stack)
    case arrays(Arrays)
    case sorting(Sorting)
    case dynamicProgramming(DynamicProgramming)
    case math(Math)
    case trees(Trees)
    case graphs(Graphs)
    case misc(Misc)

    // MARK: - Topic Enums

    enum Basics {
        case patternPrinting
        case intersection
        case binarySearch
        case isSubsequence
        case majorityElement
        case maxConsecutiveOnes
        case majorityElementNBy3
        case findPairs
        case containsDuplicate
        case containsNearbyDuplicate
        case removeDuplicates
        case fizzBuzz
    }

    enum Strings {
        case palindrome
        case firstUniqueCharacter
        case validPalindrome
        case romanToInteger
        case anagram
        case longestPalindrome
        case sortSentence
        case defangIPAddress
        case isRotated
        case pangram
        case sortString
        case sortVowels
        case addStrings
        case longestSubstringWithoutRepeatingCharacters
        case countAndSay
    }

    enum LinkedList {
        case singlyLinkedList
        case singlyCircularLinkedList
        case doublyLinkedList
        case doublyCircularLinkedList
        case mergeLinkedLists
        case detectLoopInLinkedList
        case detectCycleLoopAndLength
        case detectStartOfCycleLoop
    }

    enum Stack {
        case linkedListStack
        case minStack
        case validParenthesis
        case validLongParenthesis
    }

    enum Arrays {
        case finalPrices
        case decodeXORArray
        case sumOfUnique
        case rotateArray
        case secondLargest
    }

    enum Sorting {
        case bubbleSort
        case insertionSort
        case bucketSort
        case heapSort
        case quickSort
        case mergeSort
    }

    enum DynamicProgramming {
        case possibleLootValue
        case editDistance
        case fibonacci
        case climbStairs
    }

    enum Math {
        case decimalToBinary
        case factorial
        case binaryGap
    }

    enum Trees {
        case heap
        case avlTree
        case trie
    }

    enum Graphs {
        case adjacencyMatrix
        case adjacencyList
        case dfs
        case detectCycleUsingBFS
        case detectCycleUsingDFS
        case topologicalSortDFS
        case cycleDetectionExamples
        case cycleDetectionInDirectedGraph
    }

    enum Misc {
        case printGrid
    }
}
