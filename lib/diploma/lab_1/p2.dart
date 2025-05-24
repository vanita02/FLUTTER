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
  int ans = a+b+c+d+e;
  print('Totle : $ans');
  print('Percentage : ${(ans/250)*100}');
}
