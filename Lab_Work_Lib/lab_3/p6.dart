import 'dart:io';

void main(){
  int a=1;
  int sume=0;
  int sumo=0;

  while(a!=0){
    stdout.write('enter a : ');
    a = int.parse(stdin.readLineSync()!);
    if(a%2==0 && a>0){
      sume = sume+a;
    }
    if(a%2!=0 && a<0){
      sumo = sumo+a;
    }
  }
  print('sum of even numbers is : $sume');
  print('sum of odd numbers is : $sumo');

}