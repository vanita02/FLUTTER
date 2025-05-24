import 'dart:io';

void main(){
  stdout.write('enter a : ');
  int a = int.parse(stdin.readLineSync()!);
  int ans=1;
  for(int i=a; i>0; i--){
    ans = ans*i;
  }
  print(ans);
}