import 'dart:io';

void main(){
  height_sort();
}

void height_sort(){
  stdout.write('enter a size of array : ');
  int n = int.parse(stdin.readLineSync()!);
  List<int> height = [];
  List<String> name = [];
  int temp;
  String str;
   for(int i=0; i<n; i++) {
     print('enter height : ');
     height.add(int.parse(stdin.readLineSync()!));
     print('enter name : ');
     name.add(stdin.readLineSync()!);
   }
     for(int i=0; i<n; i++){
       for(int j=i+1; j<n; j++){
         if(height[i]<height[j]){
           temp = height[i];
           height[i] = height[j];
           height[j] = temp;

           str = name[i];
           name[i] = name[j];
           name[j] = str;
         }
       }
     }
     for(int i=0; i<n; i++){
        print('height : ${height[i]} || name : ${name[i]}');
     }
}

