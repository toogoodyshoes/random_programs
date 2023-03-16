import 'dart:io';

void main() {
  final List<String> lookupTable = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  stdout.writeln('Enter your ROT-13 string\n');

  final String? input = stdin.readLineSync();

  String decodedString = '';

  if (input != null) {
    for (int i = 0; i < input.length; i++) {
      if (input[i].contains(RegExp(r'[A-Z]'))) {
        final index = lookupTable.indexOf(input[i].toLowerCase());

        if (!index.isNegative) {
          int newIndex = index + 13;
          if (newIndex > 25) {
            newIndex = newIndex - 26;
          }

          final character = lookupTable[newIndex];
          decodedString += character.toUpperCase();
          continue;
        }
      } else {
        final index = lookupTable.indexOf(input[i]);

        if (!index.isNegative) {
          int newIndex = index + 13;
          if (newIndex > 25) {
            newIndex = newIndex - 26;
          }

          decodedString += lookupTable[newIndex];
          continue;
        }
      }

      decodedString += input[i];
    }

    stdout.write('Decoded string: $decodedString');
  }
}
