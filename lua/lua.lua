local vowels = {'a', 'e', 'i', 'o', 'u', 'y'}
local consonants = {'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z'}

local count = 10
if arg ~= nil then count = arg[1] end

function generate_nicknames(count)
    nicks = {}
    for i = 1, count, 1 do
        nick = ""
        for k = 1, math.random(3, 6), 1 do
            if math.random(0, 1) == 1 then
                nick = nick .. consonants[math.random(1,20)]
            end
            if math.random(0, 1) == 1 then
                nick = nick .. vowels[math.random(1, 6)]
            end
        end
        if math.random(0, 1) == 1 then
            nick = nick .. math.random(0, 999)
        end
        table.insert(nicks, nick)
    end
    return nicks
end

math.randomseed(os.time())
print(table.concat(generate_nicknames(count), ', '))
