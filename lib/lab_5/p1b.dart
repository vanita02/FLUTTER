import 'dart:io';

void main(){
  stdout.write('enter array size : ');
  int n = int.parse(stdin.readLineSync()!);
  stdout.write('enter target : ');
  int target = int.parse(stdin.readLineSync()!);

  List<int> arr = [];
  for(int i=0; i<n; i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  for(int i=0; i<n-1; i++){
    // for(int j=0; j<n; j++){
      if(arr[i]+arr[i+1]==target){
        print('index are : [$i,${i+1}]');
      }
    // }
  }
}