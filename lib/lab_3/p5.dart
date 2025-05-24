import 'dart:io';

void main(){
  stdout.write('enter a string : ');
  String str = stdin.readLineSync()!;
  int length = str.length;
  String ans = "";
  for(int i=length-1; i>=0; i--){
    ans = ans+str[i];
  }
  print(ans);
}