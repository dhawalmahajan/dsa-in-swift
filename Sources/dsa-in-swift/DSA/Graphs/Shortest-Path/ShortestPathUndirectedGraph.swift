//
//  ShortestPathUndirectedGraph.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 29/08/26.
//

/*
 Given an undirected graph with V vertices numbered from 0 to V-1 and E edges, where edges[i] = [u, v] denotes an undirected edge between vertex u and vertex v, given two vertices src and dest, find the length of the shortest path from src to dest. If there is no path between src and dest, return -1.
 
 Note: All edges have a unit weight of 1.
 
 Examples :
 Input: V = 9, edges[][] = [[0, 1], [0, 3], [1, 2], [3, 4], [4, 5], [2, 6], [5, 6], [6, 7], [6, 8], [7, 8]], src = 0, dest = 8
 Output: 4
 Explanation: One of the shortest paths from vertex 0 to vertex 8 is 0 -> 1 -> 2 -> 6 -> 8, which contains 4 edges.
 
 Input: V = 4, edges[][]= [[0, 3], [1, 3]], src = 3, dest = 2
 Output: -1
 Explanation: There is no path between vertices 3 and 2.
 
 Constraints:
 
 1 ≤ V ≤ 10^4
 0 ≤ E ≤ V × (V - 1) / 2
 0 ≤ edges[i][0], edges[i][1] < V
 */

private func shortestPath(v: Int, edges: inout [[Int]], src: Int, dest: Int) -> Int {
    return usingBFS(v: v, edges: &edges, src: src, dest: dest)
}

func usingBFS(v: Int, edges: inout [[Int]], src: Int, dest: Int) -> Int {
    var adj: [[Int]] = Array(repeating: [], count: v)
    for edge in edges {
        adj[edge[0]].append(edge[1])
        adj[edge[1]].append(edge[0])
    }
    print(adj)
    var visited: [Bool] = Array(repeating: false, count: v)
    var queue: [(Int, Int)] = []  // (node, distance)
    queue.append((src, 0))
    visited[src] = true
    
    while !queue.isEmpty {
        let (node, distance) = queue.removeFirst()
        if node == dest {
            return distance
        }
        for neighbor in adj[node] {
            if !visited[neighbor] {
                visited[neighbor] = true
                queue.append((neighbor, distance + 1))
            }
        }
    }
    return -1  // No path found
}

func shortestPathUndirectedGraphDemo() {
    var edge = [
        [0, 1], [0, 3], [1, 2], [3, 4], [4, 5], [2, 6], [5, 6], [6, 7], [6, 8], [7, 8],
    ]
    let source1 = 0
    let dest1 = 8
    var edge2 = [[0, 3], [1, 3]]
    let source2 = 3
    let dest2 = 2
    print(shortestPath(v: 9, edges: &edge, src: source1, dest: dest1))
}
