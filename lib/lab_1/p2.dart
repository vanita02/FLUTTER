import 'dart:io';
void main(){
  stdout.write("enter a : ");
  int a = int.parse(stdin.readLineSync()!);
  stdout.write("enter b : ");
  int b = int.parse(stdin.readLineSync()!);
  stdout.write(a+b);
}