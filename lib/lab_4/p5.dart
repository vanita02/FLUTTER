import 'dart:io';

void main(){

  odd_even();
}

void odd_even(){
  stdout.write('enter array size : ');
  int n = int.parse(stdin.readLineSync()!);
  int counte = 0;
  int counto = 0;
  List<int> arr = [];
  for(int i=0; i<n; i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  for(int i=0; i<n; i++){
    if(arr[i]%2==0){
      counte = counte+arr[i];
    }
    if(arr[i]%2!=0){
      counto = counto+arr[i];
    }
  }
  print('even count is : $counte');
  print('odd count is : $counto');

}