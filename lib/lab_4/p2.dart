import 'dart:io';

void main(){
  stdout.write('enter a : ');
  int a = int.parse(stdin.readLineSync()!);
  stdout.write('enter b : ');

  int b = int.parse(stdin.readLineSync()!);

  max_number(a,b);
}

void max_number(int a,int b){

  if(a>b){
    print('gretest number is : $a');
  } else{
    print('gretest number is : $b');

  }

}