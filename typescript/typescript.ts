// deno

const count = Number.parseInt(Deno.args[0]) || 10;

const consonants = "bcdfghjklmnpqrstvwxz".split("");
const vowels = "aeiouy".split("");

const getRandom = <T>(arr: Array<T>) => arr[Math.floor(Math.random() * arr.length)];

function generateNickname(){
    const nick = [];
    const len = Math.floor(Math.random() * 6) + 3;
    for(let i = 0; i < len; i++){
        if(Math.random() < 0.5) nick.push(getRandom(vowels));
        if(Math.random() < 0.5) nick.push(getRandom(consonants));
    }
    if(Math.random() < 0.5) nick.push(Math.floor(Math.random() * 999));
    return nick.join("");
}

console.log(Array.from({length: count}, () => generateNickname()).join("\n"));
