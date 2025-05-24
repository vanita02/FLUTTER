import 'dart:io';

void main() {
  print('enter a number  : ');
  String s = stdin.readLineSync()!;
  String largestOddNumber = "";

  for (int i = s.length - 1; i >= 0; i--) {
    if (s[i] == '1' || s[i] == '3' || s[i] == '5' || s[i] == '7' || s[i] == '9') {
      largestOddNumber = s.substring(0, i + 1);
      break;
    }
  }

  if (largestOddNumber.isNotEmpty) {
    print('largest odd number is :  $largestOddNumber');
  } else {
    print(" ");
  }
}