import 'dart:io';

class Candidate{
  late int id;
  late String name;
  late int age;
  late double height;
  late double weight;


  void getCadidateDetails(){
    id = int.parse(stdin.readLineSync()!);
    name = stdin.readLineSync()!;
    age = int.parse(stdin.readLineSync()!);
    height = double.parse(stdin.readLineSync()!);
    weight = double.parse(stdin.readLineSync()!);
  }

  void displayCandidateDetails(){
    print('id is : $id');
    print('name is : $name');
    print('age is : $age');
    print('height is : $height');
    print('weight is : $weight');
  }

}

void main(){
  Candidate c = new Candidate();
  c.getCadidateDetails();
  c.displayCandidateDetails();
}