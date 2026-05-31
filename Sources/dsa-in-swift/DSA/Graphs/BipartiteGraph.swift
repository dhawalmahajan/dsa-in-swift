//
//  BipartiteGraph.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 30/05/26.
//

private func isBipartite(_ v: Int, adj: [[Int]]) -> Bool {
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
func bipartiteGraphDemo() {
    let v = 4
    let adj = [
        [1, 3], // Neighbors of 0
        [0, 2], // Neighbors of 1
        [1, 3], // Neighbors of 2
        [0, 2]  // Neighbors of 3
    ]
    print("Is Graph 1 Bipartite? \(isBipartite(v, adj: adj))")
}
