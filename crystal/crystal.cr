VOWELS = ['a', 'e', 'i', 'o', 'u', 'y']
CONSONANTS = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z']

count = 10
count = ARGV[0].to_i unless ARGV.empty?

def generate_nicknames(nick_count)
    nicks = [] of String
    (1..nick_count).each do
        nick = ""
        (1..rand(3..6)).each do
            nick += CONSONANTS[rand(0..19)] if rand(0..1) == 1
            nick += VOWELS[rand(0..5)] if rand(0..1) == 1
        end
        nick += rand(0..999).to_s if rand(0..1) == 1
        nicks << nick
    end
    return nicks
end

puts generate_nicknames(count)
