import 'dart:io';

void main(){
  stdout.write('enter a : ');
  int a = int.parse(stdin.readLineSync()!);
  int count=0;
  for(int i=0; i<=a; i++){
    if(a%2==0){
      count = count+1;
    }
  }
  if(count>2){
    print('a is not prime number');
  } else{
    print('a is prime number');
  }
}