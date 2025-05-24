import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices{
  var base_url = "https://67b58a9c07ba6e59083d41db.mockapi.io/Todo";

  Future<List<dynamic>> getAll() async{
    var res = await http.get(Uri.parse(base_url));

    List<dynamic> data = jsonDecode(res.body);
    return data;
  }

  Future<void> addData(Map<String,dynamic> map) async{
    await http.post(Uri.parse(base_url),body: map);
  }

  Future<void> editData(String id,Map<String,dynamic> updateData) async{
    await http.put(Uri.parse('$base_url/$id'),body: updateData);
  }

  Future<void> deleteData(String id) async{
    await http.delete(Uri.parse('$base_url/$id'));
  }
}