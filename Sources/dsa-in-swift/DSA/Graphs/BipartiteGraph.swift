//
//  BipartiteGraph.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 30/05/26.
//
/*
 *Given a connected undirected graph containing V vertices represented by a 2-d adjacency list adj[][], where each adj[i] represents the list of vertices connected to vertex i. Perform a Depth First Search (DFS) traversal starting from vertex 0, visiting vertices from left to right as per the given adjacency list, and return a list containing the DFS traversal of the graph.

Note: Do traverse in the same order as they are in the given adjacency list.
 *Input: adj[][] = [[2, 3, 1], [0], [0, 4], [0], [2]]
 * */
//MARK: BFS

private func isBipartiteUsingBFS(_ v: Int, adj: [[Int]]) -> Bool {
    var color = Array(repeating: -1, count: v)
    var q: [Int] = []
    for i in 0..<v {
        if color[i] == -1 {
            q.append(i)
            color[i] = 0
            while !q.isEmpty {
                let node = q.removeFirst()
                for neighbour in adj[node] {
                    //Color is not assigned
                    if(color[neighbour] == -1) {
                        color[neighbour] = color[node] + 1 % 2
                        q.append(neighbour)
                    } else {
                        //Color is already assigned
                        if color[neighbour] == color[node] {
                            return false
                        }
                    }
                }
            }
        }
    }
    return true
}
//MARK: DFS
private func isBipartiteGraphUsingDFS(_ v: Int, adj: [[Int]]) -> Bool {
    var color = Array(repeating: -1, count: v)
    for i in 0..<v {
        if color[i] == -1 {
            color[i] = 0
            return isBipartiteDFS(i, adj: adj, color: &color)
        }
    }
    return true
}
private func isBipartiteDFS(_ node: Int, adj: [[Int]], color: inout [Int]) -> Bool {
    for neighbour in adj[node] {
        if(color[neighbour] == -1) {
            color[neighbour] = (color[node] + 1) % 2
            if !isBipartiteDFS(neighbour, adj: adj, color: &color) {
                return false
            }
        } else {
            if color[node] == color[neighbour] {
                return false
            }
        }
    }
    return true
}
func bipartiteGraphDemo() {
    let v = 4
    let adj = [
        [1, 3], // Neighbors of 0
        [0, 2], // Neighbors of 1
        [1, 3], // Neighbors of 2
        [0, 2]  // Neighbors of 3
    ]
    let adj2 = [
        [1, 2, 3], // Node 0 connects to 1, 2, and 3
        [0, 2],    // Node 1 connects to 0 and 2
        [0, 1, 3], // Node 2 connects to 0, 1, and 3
        [0, 2]     // Node 3 connects to 0 and 2
    ]
    print("Is Graph 1 Bipartite using BFS? \(isBipartiteUsingBFS(v, adj: adj))")
    print("Is Graph 1 Bipartite Using DFS? \(isBipartiteGraphUsingDFS(v, adj: adj))")
}
