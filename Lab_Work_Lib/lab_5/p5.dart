
import 'dart:io';

void main(){
  print('enter id');
  String id = stdin.readLineSync()!;
  print('enter name');
  String name = stdin.readLineSync()!;

  List<Map<String,Object>> list = [
    {
    "1": Model(name:"vanita",
         age : 18,
         salary : 100000)
    },
    {
      "2": Model(name:"khushi",
          age : 18,
          salary : 100000)
    },
    {
      "3": Model(name:"nisha",
          age : 18,
          salary : 100000)
    },
    {
      "4": Model(name:"disha",
          age : 18,
          salary : 100000)
    },
  ];
  for(int i=0; i<list.length; i++){

    if(list[i].containsKey(id)){
      Model m =list[i][id] as Model;
      if(m.name==name){
        print('data is : ${m.name} : age is : ${m.age}: salary is : ${m.salary}');
      }


    }
  }

}

class Model{
  String? name;
  int? age;
  int? salary;

  Model({name,age,salary}){
    this.name = name;
    this.age = age;
    this.salary=salary;
  }

}