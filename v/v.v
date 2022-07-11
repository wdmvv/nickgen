import rand

fn nickgen() string {
	
	vowels := ['a', 'e', 'i', 'o', 'u', 'y']
	consonants := ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z']
	mut nick := ""
	
	for i in 0..(rand.int31() % 5 + 2){
		if rand.int31() % 2 == 0{			
			for j in 0..(rand.int31() % 3 + 1){
				nick += string(vowels[rand.int31() % 5])
				
			}
		}else{
			for j in 0..(rand.int31() % 3 + 1){
				nick += string(consonants[rand.int31() % 20])
				
			}
		}				
	}
	
	for j in 0..rand.int31() % 4{
		nick += (rand.int31() % 10).str()
	}
	return nick
}

fn main(){
	for i in 0..10{
	    println(nickgen())
	}
}
