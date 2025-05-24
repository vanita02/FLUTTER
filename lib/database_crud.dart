import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseCrud extends StatefulWidget {
   DatabaseCrud({super.key});

   @override
  State<DatabaseCrud> createState() => _DatabaseCrudState();
}

class _DatabaseCrudState extends State<DatabaseCrud> {

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  List<Map<String,dynamic>> data = [] ;
  late Database database;
  Future<void> initDatabase() async{
    database = await openDatabase(
        join( await getDatabasesPath(),'myDatabase.databaseDemo'),
        onCreate: (db, version) {
          return db.execute('CREATE TABLE DEMO(id INTEGER PRMARY KEY AUTO INCREMENT,title TEXT,name TEXT)');
        },
        version: 1
    );
  }

  Future<void> fetchData() async{
    List<Map<String,dynamic>> tempData = await database.query('DEMO');
    setState(() {
      data = tempData;
    });
  }

  Future<void> addData(String title,String name) async{
    if(title.isNotEmpty && name.isNotEmpty){
      await database.insert('DEMO',
      {'title' : title,'name' : name}
      );
    }
    fetchData();
  }

  Future<void> updateData(String id,String title,String name) async{
    if(title.isNotEmpty && name.isNotEmpty){
      await database.update('DEMO',{'title':title,'name':name},where: 'id=?',whereArgs: [id] );
    }
    fetchData();
  }

  Future<void> deleteData(String id) async{
    await database.delete('DEMO',where: 'id=?',whereArgs: [id]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        addData(titlecontroller.text,namecontroller.text);
      },),
      appBar: AppBar(title: Text('Database Demo'),),
      body: Column(
        children: [
          TextField(
            controller: titlecontroller,
          ),
          TextField(
            controller: namecontroller,
          ),
          ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
            return Column(
              children: [
                Text(data[index]['title']),
                Text(data[index]['name']),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        updateData(data[index]['id'], data[index]['title'], data[index]['name']);
                      },
                      child: Icon(Icons.edit),
                    ),
                    InkWell(
                      onTap: () {
                        deleteData(data[index]['id']);
                      },
                      child: Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            );
          },)
        ],
      )
    );
  }
}
