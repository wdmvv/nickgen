val vowels = arrayOf('a', 'e', 'i', 'o', 'u', 'y');
val consonants = arrayOf('b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z')

fun generate_nicks(count: Int): List<String> {
    var nicks = listOf<String>()
    for (i in 1..count) {
        var nick = ""
        for (k in 1..(3..6).random()) {
            if ((0..1).random() == 1) nick += consonants[(0..19).random()]
            if ((0..1).random() == 1) nick += vowels[(0..5).random()]
        }
        if ((0..1).random() == 1) nick += (0..999).random()
        nicks += nick
    }
    return nicks
}

fun main(args: Array<String>) {
   if (args.isNullOrEmpty()) print(generate_nicks(args[0].toInt())) else print(generate_nicks(10))
}
