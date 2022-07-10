import scala.util.Random

object Nickgen extends App {
    val count: Int = 10
    generate_nicknames(count)

    def generate_nicknames(count: Int): Array[String] = {
        val vowels: Array[Char] = Array('a', 'e', 'i', 'o', 'u', 'y')
        val consonants: Array[Char] = Array('b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z')
        var result: Array[String] = Array()

        for(i <- 0 to count) {
            var nick: String = ""

            for(k <- 3 to Random.nextInt(6) + 3) {
                if(Random.nextBoolean() == true) {
                    nick += consonants(Random.nextInt(19))
                }
                if(Random.nextBoolean() == true){
                    nick += vowels(Random.nextInt(5))
                }
            }

            if(Random.nextBoolean() == true) {
                nick += Random.nextInt(999)
            }

            println(nick)
            result :+ nick
        }
    }
}
