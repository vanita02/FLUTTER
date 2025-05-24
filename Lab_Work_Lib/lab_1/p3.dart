import 'dart:io';

void main(){
  stdout.write("enter f : ");
  double f = double.parse(stdin.readLineSync()!);
  print((f-32)*(5/9));
}