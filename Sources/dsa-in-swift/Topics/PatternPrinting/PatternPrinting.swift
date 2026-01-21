/*
   * * * * *
   * * * * *
   * * * * *
   * * * * *
   * * * * *
   */
private func printPattern1(s: String) {
  for _ in 1...5 {
    for _ in 1...5 {
      print(s, terminator: " ")
    }
    print("\n")
  }
}
/*
    1 1 1 1 1
    2 2 2 2 2
    3 3 3 3 3
    4 4 4 4 4
    5 5 5 5 5
   */
private func printPattern2() {

  for i in 1...5 {
    for _ in 1...5 {
      print(i, terminator: " ")
    }
    print("\n")
  }
}
/*
   1 2 3 4 5
   1 2 3 4 5
   1 2 3 4 5
   1 2 3 4 5
   1 2 3 4 5
 */
private func printPattern3() {
  for _ in 1...5 {
    for j in 1...5 {
      print(j, terminator: " ")
    }
    print("\n")
  }
}
/*
      5 4 3 2 1
      5 4 3 2 1
      5 4 3 2 1
      5 4 3 2 1
      5 4 3 2 1
    */
private func printPattern4() {
  for _ in 1...5 {
    for j in stride(from: 5, through: 1, by: -1) {
      print(j, terminator: " ")
    }
    print("\n")
  }
}
/*
  a a a a a
  b b b b b
  c c c c c
  d d d d d
  e e e e e
*/
func printPattern5() {
  for i in 0..<5 {
    let name = Unicode.Scalar("a").value
    if let char = Unicode.Scalar(name + UInt32(i)) {
      let n = Character(char)
      for _ in 1...5 {
        print(n, terminator: " ")
      }
      print("\n")
    }
  }

}

func patternPrintingDemo() {
  //   printPattern1(s: "*")
  //   printPattern2()
  //   printPattern3()
  //   printPattern4()
  printPattern5()
}
