/*
Share a pseudo code which constructs a 3 x 3 square box grid using only the
following symbols and place the king and rook pieces inside the square of the 1st
column as in the example given.
Symbols :
│ ─ ┌ ┐ └ ┘ ┬ ┴ ├ ┤ ┼ ♖ ♚
Output :
3x3 Square boxes
┌───┬───┬───┐
│ ♚ │ │ │   |
├───┼───┼───┤
│ ♖ │ │ │.  |
├───┼───┼───┤
│ ♖ │ │ │.  |
└───┴───┴───┘
give swift code for this
*/

func printGrid(size: Int, pieces: [(row: Int, col: Int, symbol: String)]) {

  let horizontal = "───"
  let vertical = "│"

  let topLeft = "┌"
  let topMid = "┬"
  let topRight = "┐"
  let midLeft = "├"
  let midMid = "┼"
  let midRight = "┤"
  let bottomLeft = "└"
  let bottomMid = "┴"
  let bottomRight = "┘"

  // Create empty grid
  var grid = Array(
    repeating: Array(repeating: " ", count: size),
    count: size
  )

  // Place pieces
  for piece in pieces {
    if piece.row < size && piece.col < size {
      grid[piece.row][piece.col] = piece.symbol
    }
  }

  // Helper to build borders
  func buildBorder(left: String, mid: String, right: String) -> String {
    var line = left
    for i in 0..<size {
      line += horizontal
      line += (i == size - 1) ? right : mid
    }
    return line
  }

  // Print top border
  print(buildBorder(left: topLeft, mid: topMid, right: topRight))

  for i in 0..<size {
    // Print row
    var rowStr = ""
    for j in 0..<size {
      rowStr += "\(vertical) \(grid[i][j]) "
    }
    rowStr += vertical
    print(rowStr)

    // Print separator or bottom
    if i < size - 1 {
      print(buildBorder(left: midLeft, mid: midMid, right: midRight))
    }
  }

  // Print bottom border
  print(buildBorder(left: bottomLeft, mid: bottomMid, right: bottomRight))
}

func printGridDemo() {
  let pieces = [
    (row: 0, col: 0, symbol: "♚"),
    (row: 1, col: 0, symbol: "♖"),
    (row: 2, col: 0, symbol: "♖"),
  ]
  printGrid(size: 3, pieces: pieces)
}
