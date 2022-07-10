import 'dart:math';

const vowels = ['a', 'e', 'i', 'o', 'u', 'y'];
const consonants = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z'];

List<String> generateNicknames(int count) {
  List<String> nicks = [];
  for (var i = 0; i < count; i++) {
    String nick = "";
    for (var k = 0; k < Random().nextInt(6) + 3; k++) {
      if (Random().nextBool() == true) {nick += consonants[Random().nextInt(19)];}
      if (Random().nextBool() == true) {nick += vowels[Random().nextInt(5)];}
    }
    if (Random().nextBool() == true) {nick += Random().nextInt(999).toString();}
    nicks.add(nick);
  }
  return nicks;
}

void main(List<String> args) {
  print(generateNicknames(args.isNotEmpty ? int.parse(args[0]) : 10));
}
