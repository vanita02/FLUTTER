
import 'dart:io';

void main(){
  stdout.write('enter list size : ');
  int n = int.parse(stdin.readLineSync()!);
  List<int> arr = [];
  List<int> arr2=[];

  for(int i=0; i<=n; i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  for(int i=0; i<=n; i++) {
    if (arr[i] != arr[i + 1]) {
      arr2.add(arr[i]);
    }

  }
  print(arr2);
  // }
  // print('array is : ');
  // for(int i=0; i<=n-1; i++){
  //   print(arr2[i]);
  // }
}