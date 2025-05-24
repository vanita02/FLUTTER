import 'dart:io';

void main(){
  stdout.write("enter a : ");
  int a = int.parse(stdin.readLineSync()!);
  stdout.write("enter b : ");
  int b = int.parse(stdin.readLineSync()!);
  stdout.write("enter c : ");
  int c = int.parse(stdin.readLineSync()!);
  stdout.write("enter d : ");
  int d = int.parse(stdin.readLineSync()!);
  stdout.write("enter e : ");
  int e = int.parse(stdin.readLineSync()!);

  print(((a+b+c+d+e)/25)*100);
}
