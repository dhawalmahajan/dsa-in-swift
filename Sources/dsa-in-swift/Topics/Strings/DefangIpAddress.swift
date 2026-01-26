/*
Given a valid (IPv4) IP address, return a defanged version of that IP address.

A defanged IP address replaces every period "." with "[.]".



Example 1:

Input: address = "1.1.1.1"
Output: "1[.]1[.]1[.]1"
Example 2:

Input: address = "255.100.50.0"
Output: "255[.]100[.]50[.]0"


Constraints:

The given address is a valid IPv4 address.
*/
private func defangIPaddr(_ address: String) -> String {
  var ans: String = ""
  for char in address {
    if char == "." {
      ans += "[.]"
    } else {
      ans += String(char)
    }
  }
  return ans
}

private func alternateDefangIPaddr(_ address: String) -> String {
  return address.replacingOccurrences(of: ".", with: "[.]")
}
func defangIPaddrDemo() {
  print(defangIPaddr("1.1.1.1"))
}
