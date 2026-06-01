//
//  TopologicalSort.swift.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 14/05/26.
//
/*
 *Given a Directed Acyclic Graph (DAG) of V (0 to V-1) vertices and E edges represented as a 2D list of edges[][], where each entry edges[i] = [u, v] denotes a directed edge u -> v. Return the topological sort for the given graph.

Topological sorting for Directed Acyclic Graph (DAG) is a linear ordering of vertices such that for every directed edge u -> v, vertex u comes before v in the ordering.
Note: As there are multiple Topological orders possible, you may return any of them. If your returned Topological sort is correct then the output will be true else false.

Input: V = 4, E = 3, edges[][] = [[3, 0], [1, 0], [2, 0]]
Output: true
Explanation: The output true denotes that the order is valid. Few valid Topological orders for the given graph are:
[3, 2, 1, 0]
[1, 2, 3, 0]
[2, 3, 1, 0]

Input: V = 6, E = 6, edges[][] = [[1, 3], [2, 3], [4, 1], [4, 0], [5, 0], [5, 2]]
Output: true
Explanation: The output true denotes that the order is valid. Few valid Topological orders for the graph are:
[4, 5, 0, 1, 2, 3]
[5, 2, 4, 0, 1, 3]
Constraints:
2  ≤  V  ≤  5 x 10^3
1  ≤  E = edges.size()  ≤  min[10^5, (V * (V - 1)) / 2]
0 ≤ edges[i][0], edges[i][1] < V
 *
 *
 * */
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
