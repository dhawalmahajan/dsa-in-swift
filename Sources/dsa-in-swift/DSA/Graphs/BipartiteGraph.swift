//
//  BipartiteGraph.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 30/05/26.
//

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
