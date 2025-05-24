import 'dart:io';

void main(){
  stdout.write('enter s1 : ');
  double s1 = double.parse(stdin.readLineSync()!);
  stdout.write('enter s2 : ');
  double s2 = double.parse(stdin.readLineSync()!);
  stdout.write('enter s3 : ');
  double s3 = double.parse(stdin.readLineSync()!);
  stdout.write('enter s4 : ');
  double s4 = double.parse(stdin.readLineSync()!);
  stdout.write('enter s5 : ');
  double s5 = double.parse(stdin.readLineSync()!);

  double per = (((s1+s2+s3+s4+s5)/500)*100);

  if(per<35){
    print('fail');
  }
  if(per>=35 && per<45){
    print('pass');
  }
  if(per>=45 && per<60){
    print('second class');
  }
  if(per>=60 && per<=70){
    print('first class');
  }
  if(per>70){
    print('distinction');
  }
}
