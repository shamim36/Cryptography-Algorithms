import 'dart:io';

int TotalNumberOfAlphabet26 = 26;
int AsciiValueOfSpace = 32;
int AsciiValueOf_A = 65;
int AsciiValueOf_Z = 90;
int ExtraAsciiValue64 = 64;

void main() {
  print("Enter The Value: ");
  String input = stdin.readLineSync()!;

  input = input.toUpperCase();
  List<String> listString = input.split('');

  print("Enter The Key : ");
  String ShiftKey = stdin.readLineSync()!;

  ShiftKey = ShiftKey.toUpperCase();
  List<String> shiftKeyString = ShiftKey.split('');

  print('Choose Your Option (1. Encryption  2. Decryption)');
  int choice = int.parse(stdin.readLineSync()!);

  if (choice == 1) {
    Encryption(listString, shiftKeyString);
  } else if (choice == 2) {
    Decryption(listString, shiftKeyString);
  } else {
    print('Invalid Choice');
  }
}

void Encryption(List<String> listString, List<String> shiftKeyString) {
  if (shiftKeyString.length < listString.length) {
    int loopSize = listString.length - shiftKeyString.length;
    for (int i = 0; i < loopSize; i++) {
      shiftKeyString.add(shiftKeyString[i]);
    }
  }
  print('Encrypted Text is : ');
  for (int i = 0; i < listString.length; i++) {
    int charAsciiValue =
        EncryptionProcess(listString[i], shiftKeyString[i]) + ExtraAsciiValue64;
    String char = String.fromCharCode(charAsciiValue);

    stdout.write(String.fromCharCode(charAsciiValue));
  }
  print('');
}

void Decryption(List<String> listString, List<String> shiftKeyString) {
  if (shiftKeyString.length < listString.length) {
    int loopSize = listString.length - shiftKeyString.length;
    for (int i = 0; i < loopSize; i++) {
      shiftKeyString.add(shiftKeyString[i]);
    }
  }
  print('Decrypted Text is : ');
  for (int i = 0; i < listString.length; i++) {
    int charAsciiValue = DecryptionProcess(listString[i], shiftKeyString[i]) + ExtraAsciiValue64;
    String char = String.fromCharCode(charAsciiValue);

    stdout.write(String.fromCharCode(charAsciiValue));
  }
  print('');
}

int EncryptionProcess(String listString, String shiftKeyString) {

  if (listString.codeUnitAt(0) == AsciiValueOfSpace) {
    return AsciiValueOfSpace - ExtraAsciiValue64;
  }

  int Pi = listString.codeUnitAt(0) - ExtraAsciiValue64;
  int Ki = shiftKeyString.codeUnitAt(0) - ExtraAsciiValue64;
  int Ci = Pi + Ki;

  if (Ci >= 1 && Ci <= TotalNumberOfAlphabet26) {
    return Ci;
  } else if (Ci > TotalNumberOfAlphabet26) {
    return Ci - TotalNumberOfAlphabet26;
  } else {
    return 62 - ExtraAsciiValue64;
  }
}

int DecryptionProcess(String listString, String shiftKeyString) {
  if (listString.codeUnitAt(0) == AsciiValueOfSpace) {
    return AsciiValueOfSpace - ExtraAsciiValue64;
  }

  int Ci = listString.codeUnitAt(0) - ExtraAsciiValue64;
  int Ki = shiftKeyString.codeUnitAt(0) - ExtraAsciiValue64;

  int Pi = Ci - Ki;

  if (Pi >= 1 && Pi <= TotalNumberOfAlphabet26) {
    return Pi;
  } else if (Pi < 1) {
    return Pi + TotalNumberOfAlphabet26;
  } else {
    return 60 - ExtraAsciiValue64;
  }
}
