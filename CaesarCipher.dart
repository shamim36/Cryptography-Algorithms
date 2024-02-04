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
    int charAsciiValue = TextConvertion(value[i], key) + ExtraValue64;
    stdout.write(String.fromCharCode(charAsciiValue));
  }
  print('');
}

void decryption(List<String> value, int key) {
  print('Here\'s the Decrypted result : ');
  for (int i = 0; i < value.length; i++) {
    int charAsciiValue = TextConvertion(value[i], key) + ExtraValue64;
    stdout.write(String.fromCharCode(charAsciiValue));
  }
  print('');
}

int TextConvertion(String valueOfIndex, int key) {
  if (valueOfIndex.codeUnitAt(0) == 32) {
    return 32 - ExtraValue64;
  }

  int InicialIndex = valueOfIndex.codeUnitAt(0) - ExtraValue64;
  int ConversionIndex = InicialIndex + key;
  int y = 0;

  if (ConversionIndex > TotalAlphabet26) {
    int ResultIndex = ConversionIndex % TotalAlphabet26;
    if (ResultIndex == 0) {
      ResultIndex == TotalAlphabet26;
    }
    return ResultIndex;
  } else if (ConversionIndex < 1) {
    print('Shamim');
    int ModResult = (ConversionIndex.abs() % TotalAlphabet26) * TotalAlphabet26;
    int ResultIndex = TotalAlphabet26 - ModResult;
    if(ModResult == 0){
      ResultIndex = TotalAlphabet26;
    }
    return ResultIndex;

  } else {
    return ConversionIndex;
  }
}
