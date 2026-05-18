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

        // MARK: Arrays

        case .binarySearch:
            print(binarySearch([1,2,3,4,5], 3))

        case .majorityElement:
            print(majorElement([3,2,3]))

        case .rotateArray:
            rotateArrayDemo()

        // MARK: Strings

        case .palindrome:
            print(isPalindromicString(str: "tenet"))

        case .anagram:
            anagramDemo()

        // MARK: Linked List

        case .mergeLinkedList:
            print(mergeLinkedLists())

        case .detectCycle:
            detectCycleLoopAndLength()

        // MARK: Graphs

        case .dfs:
            dfsDemo()

        case .bfs:
            detectCycleUsingBFS()

        case .topologicalSortDFS:
            topologicalSortDemoDFS()

        // MARK: Trees

        case .avlTree:
            avlTreeExample()

        // MARK: Sorting

        case .heapSort:
            heapSortDemo()

        case .quickSort:
            quickSortDemo()

        case .mergeSort:
            mergeSortDemo()
        }
    }
}

// MARK: - System Design Runner

private extension DemoRunner {

    static func runSystemDesignDemo(
        _ demo: SystemDesignDemo
    ) {

        switch demo {

        // MARK: SOLID

        case .srp:
            SRPDemo()

        case .ocp:
            openCloseDemo()

        case .lsp:
            liskovSubstitutionDemo()

        case .isp:
            interfaceSegregationDemo()

        case .dip:
            dependencyInversionDemo()

        // MARK: Design Patterns

        case .strategyPattern:
            strategyDesignPatternDemo()

        case .decoratorPattern:
            decoratorPatternDemo()

        case .abstractFactory:
            abstractFactoryDemo()

        case .singleton:
            simpleSingletonDemo()

        // MARK: Real Examples

        case .tomatoApp:
            tomatoAppDemo()

        case .documentEditor:
            documentEditorExample()
        }
    }
}
