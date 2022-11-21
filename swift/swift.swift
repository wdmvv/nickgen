func generateNicknames(count: Int) -> [String] {
  let vowels = ["a", "e", "i", "o", "u", "y"]
  let consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
  var nicks: [String] = []

  for _ in 1...count {
    var nick = ""
    for _ in 1...Int.random(in: 3...6) {
      if Bool.random() == true { nick += consonants[Int.random(in: 0...19)] }
      if Bool.random() == true { nick += vowels[Int.random(in: 0...5)] }
    }
    if Bool.random() == true { nick += String(Int.random(in: 0...999)) }
    nicks.append(nick)
  }
  return nicks
}

print(generateNicknames(count: 10))
