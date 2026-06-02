/*
Given a grid of size n*m (n is the number of rows and m is the number of columns in the grid) consisting of "W"s (Water) and "L"s (Land). Find the number of islands.

Note: An island is either surrounded by water or the boundary of a grid and is formed by connecting adjacent lands horizontally or vertically or diagonally i.e., in all 8 directions.

Examples:

Input: grid[][] = [["L", "L", "W", "W", "W"], 
                ["W", "L", "W", "W", "L"], 
                ["L", "W", "W", "L", "L"], 
                ["W", "W", "W", "W", "W"], 
                ["L", "W", "L", "L", "W"]]
Output: 4

Input: grid[][] = [["W", "L", "L", "L", "W", "W", "W"], 
                ["W", "W", "L", "L", "W", "L", "W"]]
Output: 2
*/

func numberOfIslands(grid: inout [[String]]) -> Int {

     func valid(i: Int, j: Int) -> Bool {
    return i >= 0 && i < rowSize  && j >= 0 && j < columnSize 
}
    let rowSize = grid.count
    let columnSize = grid.first?.count ?? 0
    var queue: [(rowCount: Int,colCount: Int)] = []
    var count = 0
    let rowDirection = [-1,-1,-1,1,1,1,0,0]
    let columnDirection = [-1,0,1,-1,0,1,-1,1]

    for i in 0..<rowSize {
        for j in 0..<columnSize {
            if grid[i][j] == "L" {
                count += 1
                queue.append((i,j))
                //Make L to W to avoid revisiting at same position
                grid[i][j] = "W"
                while !queue.isEmpty {
                    let q = queue.removeFirst()
                    let rowInQueue = q.rowCount
                    let columnInQueue = q.colCount

                    //check in 8 direction 
                    //Up - down - left - right - diagonal

                    for k in 0..<8 {
                        let i = rowInQueue + rowDirection[k]
                        let j = columnInQueue + columnDirection[k]
                        if (valid(i: i,j:j)
                        && grid[i][j] == "L"
                        ) {
                            grid[i][j] = "W"
                            queue.append((i, j))

                        }
                    }
                }
            }
        }
    }
    return count
}
func numberOfIslandDemo() {
   var grid = [["L", "L", "W", "W", "W"], 
                ["W", "L", "W", "W", "L"], 
                ["L", "W", "W", "L", "L"], 
                ["W", "W", "W", "W", "W"], 
                ["L", "W", "L", "L", "W"]]

var grid2 = [["W", "L", "L", "L", "W", "W", "W"], 
                ["W", "W", "L", "L", "W", "L", "W"]]

                print("Output == ", numberOfIslands(grid: &grid2))
}
