import 'dart:io';

void main(){
  stdout.write('enter length of l1 : ');
  int n1 = int.parse(stdin.readLineSync()!);
  stdout.write('enter length of l2 : ');
  int n2 = int.parse(stdin.readLineSync()!);

  List<int> l1=[];

  print('enter elements of l1 : ');
  for(int i=0; i<n1; i++){
    l1.add(int.parse(stdin.readLineSync()!));
  }
  List<int> l2=[];
  print('enter elements of l2 : ');
  for(int i=0; i<n2; i++){
    l2.add(int.parse(stdin.readLineSync()!));
  }

  for(int i=0; i<l1.length; i++){
    for(int j=0; j<l2.length; j++){
      if(l1[i]==l2[j]){
        print('same element is : ${l1[i]}');
      }
    }
  }
}