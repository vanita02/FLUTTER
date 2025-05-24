import 'dart:io';

void main(){
  stdout.write('enter first number : ');
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write('enter second number : ');
  int num2 = int.parse(stdin.readLineSync()!);
  stdout.write('enter operator : ');
  String operator = stdin.readLineSync()!;
  switch(operator){
    case '+' : print(num1+num2);
    break;
    case '-' : print(num1-num2);
    break;
    case '*' : print(num1*num2);
    break;
    case '/' : print(num1/num2);
    break;
    default : print('invalid');
  }


  // IF

  if (operator == '+') {
    print("Result: ${num1 + num2}");
  }
  if (operator == '-') {
    print("Result: ${num1 - num2}");
  }
  if (operator == '*') {
    print("Result: ${num1 * num2}");
  }
  if (operator == '/') {
    if (num2 != 0) {
      print("Result: ${num1 / num2}");
    } else {
      print("Cannot divide by zero");
    }
  }


  //  IF...ELSE...IF

  if (operator == '+') {
    print("Result: ${num1 + num2}");
  } else if (operator == '-') {
    print("Result: ${num1 - num2}");
  } else if (operator == '*') {
    print("Result: ${num1 * num2}");
  } else if (operator == '/') {
    if (num2 != 0) {
      print("Result: ${num1 / num2}");
    } else {
      print("Cannot divide by zero");
    }
  } else {
    print("Invalid");
  }
}
