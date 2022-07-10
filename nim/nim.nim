import std/os, std/random, options, strutils

const vowels = ['a', 'e', 'i', 'o', 'u', 'y']
const consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z']

proc generate_nicknames(nick_count: Option[int]): seq[string] = 
    var nicks: seq[string]
    var count: int
    
    if nick_count.isNone(): count = 10
    else: count = nick_count.get()
    
    for i in countup(1, count):
        var nick: string = ""
        for k in countup(1, rand(3..6)):
            if rand(0..1) == 1: nick &= consonants[rand(0..19)]
            if rand(0..1) == 1: nick &= vowels[rand(0..5)]
        if rand(0..1) == 1: nick &= $rand(0..999)
        nicks.add(nick)
    
    return nicks

randomize()

if paramCount() > 0: echo generate_nicknames(some parseInt(paramStr(1))) 
else: echo generate_nicknames(none int)
