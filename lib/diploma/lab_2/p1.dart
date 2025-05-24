import 'dart:io';

void main() {
  stdout.write("Enter number of elements : ");
  int n = int.parse(stdin.readLineSync()!);

  List<int> numbers = [];
  int evenCount = 0;
  int oddCount = 0;

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number ${i + 1}: ");
    int num = int.parse(stdin.readLineSync()!);
    numbers.add(num);

    if (num % 2 == 0) {
      evenCount++;
    } else {
      oddCount++;
    }
  }

  print("\narray is : $numbers");
  print("Total Even numbers: $evenCount");
  print("Total Odd numbers: $oddCount");
}
