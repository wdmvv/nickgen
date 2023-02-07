import "random" for Random

var generate_nicks = Fn.new { |n|
  var rand = Random.new()
  var vowels = ["a", "e", "i", "o", "u", "y"]
  var consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
  var nicks = []
  
  for (i in 1..n) {
    var nick = ""
    for (k in 1..rand.int(3, 6)) {
      if (rand.int(0, 2) == 1) nick = nick + consonants[rand.int(0, 19)]
      if (rand.int(0, 2) == 1) nick = nick + vowels[rand.int(0, 5)]
    }
    
    if (rand.int(0, 2) == 1) nick = nick + rand.int(0, 999).toString
    nicks.add(nick)
  }
  return nicks
}

System.print(generate_nicks.call(10))
