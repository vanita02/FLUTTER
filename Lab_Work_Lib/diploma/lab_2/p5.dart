import 'dart:io';

void main() {
  stdout.write("Enter number of elements : ");
  int n = int.parse(stdin.readLineSync()!);

  List<int> numbers = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number ${i + 1}: ");
    int num = int.parse(stdin.readLineSync()!);
    numbers.add(num);
  }

  print("Original List: $numbers");

  numbers.sort();

  print("Sorted List: $numbers");
}
