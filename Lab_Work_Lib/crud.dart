
// import 'package:crud/string_const.dart';
import 'package:flt/project/const_file.dart';

class Crud{
  List<Map<String,dynamic>> userList = [];

  //ADD USER
  void addUserInList(name,age,email){
    Map<String,dynamic> map={};
    map[NAME] = name;
    map[AGE] = age;
    map[EMAIL] = email;
    map[PHONE] = email;
    userList.add(map);
  }
  //GET USER
  List<Map<String,dynamic>> getUserList(){
    return userList;
  }

  //REMOVE USER
  void removeUserList(id){
    userList.removeAt(id);
  }

  //UPDATE USER
  void updateUserList(name,age,email,id){
    Map<String,dynamic> map={};
    map[name] = name;
    map[age] = age;
    map[email] = email;
    userList[id]=map;
  }
}