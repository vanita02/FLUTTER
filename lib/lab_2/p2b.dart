import 'dart:io';

void main(){
  stdout.write('enter hour : ');
  int h = int.parse(stdin.readLineSync()!);
  stdout.write('enter minutes : ');
  int m = int.parse(stdin.readLineSync()!);

   double anglem = 360 * m / 60;
  double angleh = (360 * (h % 12) / 12 ) + ( 360 * (m / 60) * (1 / 12) );

  double angle =  (angleh - anglem) % 360;
  print(angle);
}