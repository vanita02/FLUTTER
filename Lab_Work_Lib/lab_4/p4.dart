import 'dart:io';

void main(){
  stdout.write('enter n number : ');
  int n = int.parse(stdin.readLineSync()!);
  int ans=check(n);
  print(ans);
}

int check(int n){
  int count = 0;
  for(int i=1; i<=n; i++){
    if(n%2==0){
      count++;
    }
  }
 if(count>2){

   return 0;

 } else{

   return 1;
 }
}