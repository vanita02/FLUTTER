import 'dart:io';

void main(){
  stdout.write('enter a : ');
  try {
    int a = int.parse(stdin.readLineSync()!);
    fibonaci(a: a);
  } catch(e){
    print('number not found!!');
  }
}

void fibonaci({int a=0}) {
  int first = 0;
  int second = 1;
  int sum = 0;
    for (int i = 0; i < a; i++) {
      sum = first + second;
      first = second;
      second = sum;
    }
    print(sum);
}