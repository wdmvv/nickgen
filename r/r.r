vowels <- c('a', 'e', 'i', 'o', 'u', 'y')
consonants <- c('b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z')

generate_nicknames <- function(count) {
    nicks <- c()
    for (x in 1:count) {
        nick <- ''
        for (x in 1:sample(3:6, 1)) {
            if (sample(0:1, 1) == 1) {
                nick <- paste(nick, consonants[sample(0:19, 1)], sep = '')
            }  
            if (sample(0:1, 1) == 1) {
                nick <- paste(nick, vowels[sample(0:5, 1)], sep = '')
            }
        }
        if (sample(0:1, 1) == 1) {
            nick <- paste(nick, sample(0:999, 1), sep = '')
        }
        nicks <- c(nicks, nick)
    }
    return(nicks)
}

print(generate_nicknames(10))
