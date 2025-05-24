import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:matrimony_project/project/project_db.dart';
import 'package:matrimony_project/project/user_list_view.dart';
import 'package:sqflite/sqflite.dart';

class ProjectApi {
  var base_url = "https://67c846b00acf98d07085c742.mockapi.io/matrimony";

  // Future<List<Map<String,dynamic>>> getAll() async{
  //   var res = await http.get(Uri.parse(base_url));
  //   List<Map<String,dynamic>> apiData = jsonDecode(res.body);
  //   return apiData;
  // }


  Future<List<dynamic>> getAll() async {
    try {
      final Uri uri = Uri.parse(base_url); // ✅ Ensure this is correctly parsed
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print("❌ API Error: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("⚠️ API Fetch Exception: $e");
      return [];
    }
  }

  Future<void> addData(Map<String, dynamic> map) async {
    await http.post(Uri.parse(base_url), body: map);
  }

  Future<void> editData(String id, Map<String, dynamic> updateData) async {
    await http.put(Uri.parse('$base_url/$id'), body: updateData);
  }

  Future<void> deleteData(String id) async {
    await http.delete(Uri.parse('$base_url/$id'));
  }
}
