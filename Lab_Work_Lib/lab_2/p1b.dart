import 'dart:io';

void main(){
  stdout.write('enter a string : ');
  String str = stdin.readLineSync()!;
  int length = str.length;
  int count=0;
  for(int i=length-1; i>=0; i--){
    count++;
    if(str[i-1] == " "){
      break;
    }
  }
  print(count);
}