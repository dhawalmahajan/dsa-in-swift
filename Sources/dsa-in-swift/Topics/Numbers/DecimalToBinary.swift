func decimalToBinary(_ decimal: Int) -> Int {
  var rem: Int
  var ans: Int = 0
  var mul = 1
  var num = decimal
  while num > 0 {
    rem = num & 1
    num /= 2
    ans += rem * mul
    mul *= 10
  }
  return ans
}
