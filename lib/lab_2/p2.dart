import 'dart:io';

void main(){
  stdout.write('enter first number');
  int a = int.parse(stdin.readLineSync()!);
  stdout.write('enter second number');
  int b = int.parse(stdin.readLineSync()!);
  stdout.write('enter operator');
  String operator = stdin.readLineSync()!;
  switch(operator){
    case '+' : print(a+b);
    break;
    case '-' : print(a-b);
    break;
    case '*' : print(a*b);
    break;
    case '/' : print(a/b);
    break;
    default : print('invalid');
  }
}
