import 'dart:io';
void main(){
  stdout.write('enter a number : ');
  int n = int.parse(stdin.readLineSync()!);
  if(n<0){
    print('number is negative');
  } else{
    print('number is positive');
  }
}
