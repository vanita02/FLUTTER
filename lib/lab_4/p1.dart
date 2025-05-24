import 'dart:io';

void main(){
  stdout.write('enter p : ');
  double p = double.parse(stdin.readLineSync()!);
  stdout.write('enter r : ');
  double r = double.parse(stdin.readLineSync()!);
  stdout.write('enter t : ');
  double t = double.parse(stdin.readLineSync()!);

  simple_interest(10,10,10);
}

void simple_interest(double p,double r,double t){
  double ans = (p*r*t)/100;
  print(ans);
}