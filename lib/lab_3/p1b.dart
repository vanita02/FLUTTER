import 'dart:io';

void main(){
  stdout.write('enter array size : ');
  int n = int.parse(stdin.readLineSync()!);
  List<int> arr = [];
  print('enter array elements : ');
  for(int i=0; i<n; i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  for(int i=0; i<n; i++){
    int count = 0;
    for(int j=0; j<n; j++){
      if(arr[i] == arr[j]){
        count++;
      }
    }
    if(count==1){
      print('unique element is : ${arr[i]}');
    }
  }
}