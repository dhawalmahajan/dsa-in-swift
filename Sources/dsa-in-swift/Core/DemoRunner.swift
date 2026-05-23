//
//  File.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 18/05/26.
//

import Foundation
struct DemoRunner {
    
    static func run(_ demo: DemoType) {
        
        switch demo {
                
                // MARK: DSA
                
            case .dsa(let dsaDemo):
                runDSADemo(dsaDemo)
                
                // MARK: System Design
                
            case .systemDesign(let systemDemo):
                runSystemDesignDemo(systemDemo)
        }
    }
}

// MARK: - DSA Runner

private extension DemoRunner {
    
    static func runDSADemo(_ demo: DSADemo) {
        
        switch demo {
                
                // MARK: Basics
            case .basics(let item):
                switch item {
                    case .patternPrinting:
                        patternPrintingDemo()
                    case .intersection:
                        print(intersection([4, 9, 5], [9, 4, 9, 8, 4]))
                    case .binarySearch:
                        print(binarySearch([1, 2, 3, 4, 5], 3))
                    case .isSubsequence:
                        print(isSubsequence("as", "basdcas"))
                    case .majorityElement:
                        print(majorElement([3, 2, 3, 2, 3]))
                    case .maxConsecutiveOnes:
                        print(findMaxConsecutiveOnes([1, 1, 1, 1, 0, 1, 1, 1]))
                    case .majorityElementNBy3:
                        print(majority([3, 2, 3, 4, 1, 2, 5, 3]))
                    case .findPairs:
                        print(findPairs([1, 3, 1, 5, 4], 1))
                    case .containsDuplicate:
                        print(containsDuplicate([1, 2, 3, 4, 5]))
                    case .containsNearbyDuplicate:
                        print(containsNearbyDuplicate([1, 0, 1, 1], 1))
                    case .removeDuplicates:
                        removeDuplicatesDemo()
                    case .fizzBuzz:
                        print(fizzBuzz(n: 15))
                }
                
                // MARK: Strings
            case .strings(let item):
                switch item {
                    case .palindrome:
                        print(isPalindromicString(str: "tenet"))
                    case .firstUniqueCharacter:
                        print(firstUniqueChar(in: "interaction"))
                    case .validPalindrome:
                        print(validPalindrome("abca"))
                    case .romanToInteger:
                        print(romanToInt("MCMXCIV"))
                    case .anagram:
                        anagramDemo()
                    case .longestPalindrome:
                        longestPalindromeDemo()
                    case .sortSentence:
                        sortSentenceDemo()
                    case .defangIPAddress:
                        defangIPaddrDemo()
                    case .isRotated:
                        isRotatedDemo()
                    case .pangram:
                        pangramDemo()
                    case .sortString:
                        sortStringDemo()
                    case .sortVowels:
                        sortVowelsDemo()
                    case .addStrings:
                        addStringsDemo()
                    case .longestSubstringWithoutRepeatingCharacters:
                        lengthOfLongestSubstringDemo()
                    case .countAndSay:
                        countAndSayDemo()
                }
                
                // MARK: Linked List
            case .linkedList(let item):
                switch item {
                    case .singlyLinkedList:
                        print(singlyLinkedListDemo())
                    case .singlyCircularLinkedList:
                        print(singlyCircularLinkedListDemo())
                    case .doublyLinkedList:
                        print(doublyLinkedListDemo())
                    case .doublyCircularLinkedList:
                        print(doublyCircularLinkedListDemo())
                    case .mergeLinkedLists:
                        print(mergeLinkedLists())
                    case .detectLoopInLinkedList:
                        detectLoopInLinkedList()
                    case .detectCycleLoopAndLength:
                        detectCycleLoopAndLength()
                    case .detectStartOfCycleLoop:
                        detectStartofCycleLoopAndLength()
                }
                
                // MARK: Stack
            case .stack(let item):
                switch item {
                    case .linkedListStack:
                        printLinkedListStack()
                    case .minStack:
                        minStackDemo()
                    case .validParenthesis:
                        validParanthesisDemo()
                    case .validLongParenthesis:
                        validLongParanthesisDemo()
                }
                
                // MARK: Arrays
            case .arrays(let item):
                switch item {
                    case .finalPrices:
                        finalPricesDemo()
                    case .decodeXORArray:
                        decodeXORArrayDemo()
                    case .sumOfUnique:
                        sumOfUniqueDemo()
                    case .rotateArray:
                        rotateArrayDemo()
                    case .secondLargest:
                        secondLargestDemo()
                }
                
                // MARK: Sorting
            case .sorting(let item):
                switch item {
                    case .bubbleSort:
                        bubbleSortExample()
                    case .insertionSort:
                        insertionSortExample()
                    case .bucketSort:
                        bucketSortDemo()
                    case .heapSort:
                        heapSortDemo()
                    case .quickSort:
                        quickSortDemo()
                    case .mergeSort:
                        mergeSortDemo()
                }
                
                // MARK: Dynamic Programming
            case .dynamicProgramming(let item):
                switch item {
                    case .possibleLootValue:
                        possibleLootValueDemo()
                    case .editDistance:
                        editDistanceDemo()
                    case .fibonacci:
                        fibbonacciDemo()
                    case .climbStairs:
                        climbStairsDemo()
                }
                
                // MARK: Math
            case .math(let item):
                switch item {
                    case .decimalToBinary:
                        print(decimalToBinary(5))
                    case .factorial:
                        factorialDemo()
                    case .binaryGap:
                        binaryGapDemo()
                }
                
                // MARK: Trees
            case .trees(let item):
                switch item {
                    case .heap:
                        heapDemo()
                    case .avlTree:
                        avlTreeExample()
                    case .trie:
                        trieDemo()
                }
                
                // MARK: Graphs
            case .graphs(let item):
                switch item {
                    case .adjacencyMatrix:
                        adjacencyMatrixDemo()
                    case .adjacencyList:
                        adjacencyListDemo()
                    case .dfs:
                        dfsDemo()
                    case .detectCycleUsingBFS:
                        detectCycleUsingBFS()
                    case .detectCycleUsingDFS:
                        detectCycleDemoUsingDFS()
                    case .topologicalSortDFS:
                        topologicalSortDemoDFS()
                    case .cycleDetectionExamples:
                        runCycleDetectionExamples()
                    case .cycleDetectionInDirectedGraph:
                        detectCycleInDirectedGraphDemo()
                }
                
                // MARK: Misc
            case .misc(let item):
                switch item {
                    case .printGrid:
                        printGridDemo()
                }
        }
        
    }
}

// MARK: - System Design Runner

private extension DemoRunner {
    
    static func runSystemDesignDemo(
        _ demo: SystemDesignDemo
    ) {
        switch demo {
        case .solid(let item):
            switch item {
                case .liskovSubstitution:
                    liskovSubstitutionDemo()
                case .openClose:
                    openCloseDemo()
                case .singleResponsibility:
                    SRPDemo()
                case .dependencyInversion:
                    dependencyInversionDemo()
                case .interfaceSegregation:
                    interfaceSegregationDemo()
            }
        case .oops(let item):
            switch item {
                case .staticAndDynamicPolymorphism:
                    staticAndDynamicPolymorphismDemo()
                case .staticPolymorphism:
                    staticPolymorphismDemo()
                case .inheritance:
                    inheritanceDemo()
                case .abstraction:
                    abstractionDemo()
                case .encapsulation:
                    encapsulationDemo()
                @unknown default:
                    print("Unhandled OOPS demo case: \(item)")
            }
            
        case .pattern(let item):
            switch item {
                case .strategyPattern:
                    strategyDesignPatternDemo()
                case .abstractFactory:
                    abstractFactoryDemo()
                case .singleton:
                    simpleSingletonDemo()
                case .decoratorPattern:
                    decoratorPatternDemo()
            }
        case .realExample(let item):
            switch item {
                case .documentEditor:
                    documentEditorExample()
                case .tomatoApp:
                    tomatoAppDemo()
            }
            
        }
    }
}
