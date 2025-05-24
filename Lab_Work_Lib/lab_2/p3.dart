import 'dart:io';

void main(){
  stdout.write('enter a : ');
  int a = int.parse(stdin.readLineSync()!);
  stdout.write('enter b : ');
  int b = int.parse(stdin.readLineSync()!);
  stdout.write('enter c : ');
  int c = int.parse(stdin.readLineSync()!);

  if(a>b) {
    if (a > c) {
      print('largest number s : $a');
    } else {
      print('largest number s : $b');
    }
  } else {
    if (c > b) {
      print('largest number s : $c');
    } else {
      print('largest number s : $b');
    }
  }
    }
