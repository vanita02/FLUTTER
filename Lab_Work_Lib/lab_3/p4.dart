import 'dart:io';

void main(){
  stdout.write('enter a : ');
  int a = int.parse(stdin.readLineSync()!);
  int temp;
  int num=0;
  while(a!=0){
    temp = a%10;
    a = a~/10;
    num = num*10+temp;
  }
  print(num);
}