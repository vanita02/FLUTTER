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
  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isEdit = false;
  int index = 0;
  int editindex = 0;
  List<Map<String, dynamic>> data = [];
  late Database database;

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  Future<void> initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'myDatabase.db'), // Fixed file extension
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE DEMO(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, name TEXT)',
        );
      },
      version: 1,
    );
    await fetchData(); // Fetch data after database initializes
  }

  Future<void> fetchData() async {
    final List<Map<String, dynamic>> tempData = await database.query('DEMO');
    setState(() {
      data = tempData;
    });
  }

  Future<void> addData(String title, String name) async {
    if (title.isNotEmpty && name.isNotEmpty) {
      await database.insert(
        'DEMO',
        {'title': title, 'name': name},
      );
      await fetchData(); // Refresh list
      titleController.clear();
      nameController.clear();
    }
  }

  Future<void> updateData(int id, String title, String name) async {
    if (title.isNotEmpty && name.isNotEmpty) {
      await database.update(
        'DEMO',
        {'title': title, 'name': name},
        where: 'id = ?',
        whereArgs: [id],
      );
      await fetchData();
    }
  }

  Future<void> deleteData(int id) async {
    await database.delete(
      'DEMO',
      where: 'id = ?',
      whereArgs: [id],
    );
    await fetchData(); // Refresh list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            ElevatedButton(
                onPressed: () {
                  !isEdit
                      ? {addData(titleController.text, nameController.text)
                  }
                      : {
                          updateData(editindex, titleController.text,
                              nameController.text)
                        };
                  setState(() {
                    if(isEdit == true){
                      isEdit = false;
                    }
                    titleController.clear();
                    nameController.clear();
                  });
                },
                child: Text(!isEdit ? 'Save' : 'Edit')),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(data[index]['title']),
                      subtitle: Text(data[index]['name']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              setState(() {
                                editindex = data[index]['id'];
                                isEdit = true;
                              });
                              titleController.text = data[index]['title'];
                              nameController.text = data[index]['name'];
                              updateData(data[index]['id'],
                                  data[index]['title'], data[index]['name']);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              deleteData(data[index]['id']);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
