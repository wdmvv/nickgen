import random

vowels = "aeiouy"
consonants = "bcdfghjklmnpqrstvwxz"

def nickgen():
    random.seed()
    
    nick = ""
    
    for i in range(random.randrange(4) + 2):
        
        if random.randrange(2) == 1:    
            for j in range(random.randrange(3) + 1):
                nick += vowels[random.randrange(5)]
        else:
            for j in range(random.randrange(3) + 1):
                nick += consonants[random.randrange(20)]
                
    for i in range(random.randrange(4)):
        nick += str(random.randrange(10))
        
    return nick


if __name__ == '__main__':
    for i in range(10):
        print(nickgen()) 