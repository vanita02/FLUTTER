
import 'dart:io';

void main(){
  List<Map<String,Object>> phonebook = [
    {
      "name":'vanita',
      "number": 1234567890
    },
    {
      "name":'khushi',
      "number": 1234567890
    },
    {
      "name":'nisha',
      "number": 1234567890
    },
    {
      "name":'disha',
      "number": 1234567890
    }
  ];
  print(phonebook);
  int n = int.parse(stdin.readLineSync()!);
  print(phonebook[n]);
}