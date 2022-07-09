package main

import (
	"fmt"
	"math/rand"
	"time"
)

func nickgen() string {
	rand.Seed(time.Now().UnixNano())

	vowels := [...]rune{'a', 'e', 'i', 'o', 'u', 'y'}
	consonants := [...]rune{'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z'}
	nick := ""

	for i := 0; i < (rand.Intn(5) + 2); i++ {
		if rand.Intn(2) == 0 {
			for j := 0; j < rand.Intn(3)+1; j++ {

				nick += string(vowels[rand.Intn(5)])

			}
		} else {
			for j := 0; j < rand.Intn(3)+1; j++ {

				nick += string(consonants[rand.Intn(20)])

			}
		}
	}
	for i := 0; i < rand.Intn(4); i++ {

		nick += fmt.Sprint(rand.Intn(10))

	}
	return nick
}

func main() {
	rand.Seed(time.Now().UnixNano())
	for i := 0; i < 10; i++ {
		fmt.Println(nickgen())
	}
}
