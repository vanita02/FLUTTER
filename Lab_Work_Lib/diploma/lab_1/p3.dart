import 'dart:io';
import 'dart:math';

void main(){
  stdout.write("enter weight : ");
  double weight = double.parse(stdin.readLineSync()!);
  stdout.write("enter height : ");
  double height = double.parse(stdin.readLineSync()!);
  double bmi = weight! / pow(height! / 100, 2);
  print(bmi);
}