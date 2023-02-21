sub generate_nicks {
    @vowels = ('a', 'e', 'i', 'o', 'u', 'y');
    @consonants = ('b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z');
    @nicks = ();
    
    foreach (1..$_[0]) {
        $nick = "";
        foreach (1..int(rand(4) + 3)) {
            if (int(rand(2)) == 1) { $nick = $nick.$consonants[int(rand(20))] }
            if (int(rand(2)) == 1) { $nick = $nick.$vowels[int(rand(6))] }
        }
        
        if (int(rand(2)) == 1) { $nick = $nick.int(rand(1000)) }
        push(@nicks, $nick);
    }
    return(@nicks);
}

print(join(", ", generate_nicks(10)))
