import 'dart:io';

void main() {
  stdout.write("Enter number of elements : ");
  int n = int.parse(stdin.readLineSync()!);

  List<double> numbers = [];
  double sum = 0;

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number ${i + 1}: ");
    double num = double.parse(stdin.readLineSync()!);
    numbers.add(num);
    sum += num;
  }

  print("List of doubles: $numbers");
  print("Total = ${sum.toStringAsFixed(2)}");
}
