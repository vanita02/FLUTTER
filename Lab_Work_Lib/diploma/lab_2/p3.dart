import 'dart:io';

void main() {
  stdout.write("Enter number of elements : ");
  int n = int.parse(stdin.readLineSync()!);

  List<String> strings = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter string ${i + 1}: ");
    String str = stdin.readLineSync()!;
    strings.add(str); // Add to list
  }

  print("\nList of strings: $strings");
}
