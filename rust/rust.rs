use std::time::{SystemTime, UNIX_EPOCH};

fn make_rand() -> impl FnMut() -> u32 {
    let mut random = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .subsec_nanos();
    move || {
        random ^= random << 13;
        random ^= random >> 17;
        random ^= random << 5;
        random
    }
}

fn generate_name() -> String {
    let mut rnd = make_rand();
    let consonants: Vec<char> = "bcdfghjklmnpqrstvwxz".chars().collect();
    let vowels: Vec<char> = "aeiouy".chars().collect();
    let mut nick = String::new();
    
    for _ in 0..(rnd() % 6 + 3) {
        if rnd() % 2 == 0 { nick.push(consonants[rnd() as usize % consonants.len()]) }
        if rnd() % 2 == 0 { nick.push(vowels[rnd() as usize % vowels.len()]) }
    }
    
    if rnd() % 2 == 0 {
        nick.push_str(&(rnd() % 1000).to_string())
    }
    
    return nick;
}

fn main() {    
    let count: usize = match std::env::args().skip(1).next() {
        Some(arg) => arg.parse().expect("invalid number of nicknames"),
        None => 10,
    };
    
    for _ in 0..count {
        println!("{}", generate_name());
    }
}
