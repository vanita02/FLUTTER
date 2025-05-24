import 'dart:io';

void main() {
  List<int> arr = [];
  for (int i = 0; i < 5; i++) {
    arr.add(int.parse(stdin.readLineSync()!));
  }
  arr.sort();
  print('sorted list is : $arr');
}