import 'dart:io';

void main(){
  stdout.write('enter array size : ');
  int n = int.parse(stdin.readLineSync()!);
  int sum=0;
  List<int> arr = [];
  for(int i=0; i<n; i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  for(int i=0; i<n; i++){
    if(arr[i]%3==0 || arr[i]%5==0){
      sum = sum + arr[i];
    }
  }
  print('sum is : $sum');
}