//
//  TopologicalSort.swift.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 14/05/26.
//

//MARK: DFS
private func topologicalSortUsingDFS(v: Int, adj: [[Int]]) -> [Int] {
    var visited: [Bool] = Array(repeating: false, count: v)
    var stack: [Int] = []
    for i in 0..<v {
        if !visited[i] {
            dfs(i, adj, &visited,&stack)
        }
        
    }
    var ans: [Int] = []
    while !stack.isEmpty {
        ans.append(stack.removeLast())
    }
    return ans
}

private func dfs(_ node: Int,_ adj: [[Int]],_ visited: inout [Bool],_ stack:inout [Int]) {
    visited[node] = true
    for neighbour in adj[node] {
        if !visited[neighbour] {
            dfs(neighbour, adj, &visited, &stack)
        }
    }
    stack.append(node)
}
func topologicalSortDemoDFS() {
    let v = 6
    let adj = [
        [],     // 0
        [],     // 1
        [3],    // 2
        [1],    // 3
        [0,1],  // 4
        [0,2]   // 5
    ]
    let result = topologicalSortUsingDFS(v: v, adj: adj)
    let result2 = topologicalSortUsingKahnAlgorithm(v: v, adj: adj)
    print(result2)
}
//MARK: Kahn's Algorithm
private func topologicalSortUsingKahnAlgorithm(v: Int, adj: [[Int]]) -> [Int] {
    var ans: [Int] = []
    var indegree = Array(repeating: 0, count: v)
    for i in 0..<v {
        for neighbour in adj[i] {
            indegree[neighbour] += 1
        }
    }
    var queue: [Int] = []
    for i in 0..<v {
        if (indegree[i] == 0) {
            queue.append(i)
        }
    }
    while !queue.isEmpty {
        let node = queue.removeFirst()
        ans.append(node)
        for neighbour in adj[node] {
            indegree[neighbour] -= 1
            if indegree[neighbour] == 0 {
                queue.append(neighbour)
            }
        }
    }
    return ans
}
