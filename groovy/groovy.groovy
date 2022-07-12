vowels = ['a', 'e', 'i', 'o', 'u', 'y']
consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z']

count = args == [] ? 10 : args[0].toInteger()

String[] generate_nicknames(nick_count) {
    def nicks = []
    (1..nick_count).each {
      def nick = ""
      (1..(Math.round(Math.random() * 3).toInteger() + 3)).each {
        Math.round(Math.random()).toInteger() == 1 ? nick += consonants[Math.round(Math.random() * 19).toInteger()] : nick
        Math.round(Math.random()).toInteger() == 1 ? nick += vowels[Math.round(Math.random() * 5).toInteger()] : nick
      }
      Math.round(Math.random()).toInteger() == 1 ? nick += Math.round(Math.random() * 999).toInteger() : nick
      nicks << nick
    }
    return nicks
}

println generate_nicknames(count)
