using Random

const vowels = ['a', 'e', 'i', 'o', 'u', 'y']
const consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z']

function generate_nicks(count)
  nicks = []
  for i in 1:count
    nick = ""
    for k in 1:rand(3:6)
      if rand(0:1) == 1 nick = string(nick, consonants[rand(1:20)]) end
      if rand(0:1) == 1 nick = string(nick, vowels[rand(1:6)]) end
    end
    if rand(0:1) == 1 nick = string(nick, rand(0:999)) end 
    push!(nicks, nick)
  end
  return nicks
end

if ARGS == [] 
  println(generate_nicks(10))
else
  println(generate_nicks(parse(Int32, ARGS[1]))) 
end
