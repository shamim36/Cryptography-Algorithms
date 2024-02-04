import 'dart:io';

int ExtraValue64 = 64;
int TotalAlphabet26 = 26;

void main() {
  print("Enter The Value: ");
  String input = stdin.readLineSync()!;

  input = input.toUpperCase();
  List<String> value = input.split('');

  print("Enter The Key : ");
  int key = int.parse(stdin.readLineSync()!);

  print('Choose Your Option (1. Encryption: P->C  2. Decryption: C->P)');
  int choice = int.parse(stdin.readLineSync()!);

  if (choice == 1) {
    encryption(value, key);
  } else if (choice == 2) {
    decryption(value, key);
  } else {
    print('Invalid Choice');
  }
}

void encryption(List<String> value, int key) {    
  print('Here\'s the Encrypted result : ');

  for (int i = 0; i < value.length; i++) {  
    int charAsciiValue = textConvert(value[i], key) + ExtraValue64;
    stdout.write(String.fromCharCode(charAsciiValue));
  }
  print('');
}

void decryption(List<String> value, int key) { 
  print('Here\'s the Decrypted result : ');
  for (int i = 0; i < value.length; i++) {
    int charAsciiValue = textConvert(value[i], -key) + ExtraValue64;
    stdout.write(String.fromCharCode(charAsciiValue));
  }
  print('');
}

int textConvert(String valueOfIndex, int key) {
  if (valueOfIndex.codeUnitAt(0) == 32) {
    return 32 - ExtraValue64;
  } 
                                                                            
  int initialIndex = valueOfIndex.codeUnitAt(0) - ExtraValue64;
  int conversionIndex = (initialIndex + key - 1) % TotalAlphabet26 + 1;

  return conversionIndex;
}