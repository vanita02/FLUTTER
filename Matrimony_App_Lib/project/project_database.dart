// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class MyDatabase {
//   //region DB CONSTANTS
//   static const String USER_TABLE = 'User_Table';
//
//   static const String USER_ID = 'UserID';
//   static const String NAME = 'Name';
//   static const String EMAIL = 'Email';
//   static const String PHONE_NO = 'PhoneNo';
//   static const String PASSWORD = 'Password';
//   static const String CONFIRM_PASSWORD = 'ConfirmPassword';
//   static const String CITY = 'City';
//   static const String DOB = 'Dob';
//   static const String AGE = 'Age';
//   static const String GENDER = 'Gender';
//   static const String IS_FAVOURITE = 'IsFavourite';
//   static const String HOBBIES = 'Hobbies';
//   int DB_VERSION = 3;
//
//   //endregion
//
//   //region INIT DATABASE
//   Future<Database> initDatabase() async {
//     Database db = await openDatabase(
//       join(await getDatabasesPath(), 'Project.db'),
//       onCreate: (db, version) {
//         db.execute(
//           'CREATE TABLE $USER_TABLE($USER_ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
//               '$NAME TEXT NOT NULL, '
//               '$EMAIL TEXT,'
//               '$PHONE_NO INTEGER,'
//               '$PASSWORD TEXT,'
//               '$CONFIRM_PASSWORD TEXT,'
//               '$CITY TEXT,'
//               '$DOB TEXT,'
//               '$AGE TEXT,'
//               '$GENDER TEXT,'
//               '$IS_FAVOURITE INTEGER NOT NULL, '
//               '$HOBBIES TEXT)'
//         );
//       },
//       onUpgrade: (db, oldVersion, newVersion) {
//         if (newVersion > oldVersion) {
//           db.execute('ALTER TABLE $USER_TABLE ADD $IS_FAVOURITE INTEGER');
//         }
//       },
//       version: DB_VERSION,
//     );
//     return db;
//   }
// //endregion
// }
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:matrimony_project/project/crud.dart';
// // import 'package:sqflite/sqflite.dart';
// // import 'package:path/path.dart';
// //
// // class MyDatabase {
// //   late Database database;
// //
// //   Future<void> initDatabase() async {
// //     database = await openDatabase(
// //       join(await getDatabasesPath(), 'matrimony.db'), // Fixed file extension
// //       onCreate: (db, version) {
// //         return db.execute(
// //           'CREATE TABLE USER_TABLE(id INTEGER PRIMARY KEY AUTOINCREMENT,Name TEXT,Email TEXT,PhoneNo TEXT,Password TEXT,ConfirmPasswod TEXT,City TEXT,Dob TEXT,Age TEXT,Hobbies TEXT,Gender TEXT,IsFevourite TEXT)',
// //         );
// //
// //       },
// //       version: 1,
// //     );
// //     await fetchData();// Fetch data after database initializes
// //   }
// //
// //   Future<List<Map<String, dynamic>>> fetchData() async {
// //     final db = await database;
// //     return await db.query('USER_TABLE');
// //   }
// //
// //   Future<void> addData(
// //       String Name,
// //       String Email,
// //       String PhoneNo,
// //       String Password,
// //       String ConfirmPassword,
// //       String City,
// //       String Hobbies,
// //       String Dob,
// //       String Age,
// //       String Gender,
// //       String IsFevourite) async {
// //     if (Name.isNotEmpty &&
// //         Email.isNotEmpty &&
// //         Password.isNotEmpty &&
// //         ConfirmPassword.isNotEmpty &&
// //         City.isNotEmpty &&
// //         Hobbies.isNotEmpty &&
// //         Gender.isNotEmpty) {
// //       await database.insert(
// //         'USER_TABLE',
// //         {
// //           'Name': Name,
// //           'Email': Email,
// //           'PhoneNo': PhoneNo,
// //           'Password': Password,
// //           'ConfirmPassword': ConfirmPassword,
// //           'City': City,
// //           'Hobbies': Hobbies,
// //           'Dob': Dob,
// //           'Age': Age,
// //           'Gender': Gender,
// //           'IsFevourite': IsFevourite
// //         },
// //       );
// //       await fetchData(); // Refresh list
// //       // titleController.clear();
// //       // nameController.clear();
// //     }
// //   }
// //
// //   Future<void> updateData(
// //       int id,
// //       String Name,
// //       String Email,
// //       int PhoneNo,
// //       String Password,
// //       String ConfirmPassword,
// //       String City,
// //       String Hobbies,
// //       DateTime Dob,
// //       int Age,
// //       String Gender,
// //       bool IsFevourite) async {
// //     if (Name.isNotEmpty &&
// //         Email.isNotEmpty &&
// //         Password.isNotEmpty &&
// //         ConfirmPassword.isNotEmpty &&
// //         City.isNotEmpty &&
// //         Hobbies.isNotEmpty &&
// //         Gender.isNotEmpty) {
// //       await database.update(
// //         'USER_TABLE',
// //         {
// //           'Name': Name,
// //           'Email': Email,
// //           'PhoneNo': PhoneNo,
// //           'Password': Password,
// //           'ConfirmPassword': ConfirmPassword,
// //           'City': City,
// //           'Hobbies': Hobbies,
// //           'Dob': Dob,
// //           'Age': Age,
// //           'Gender': Gender,
// //           'IsFevourite': IsFevourite
// //         },
// //         where: 'id = ?',
// //         whereArgs: [id],
// //       );
// //       await fetchData();
// //     }
// //   }
// //
// //   Future<void> deleteData(int id) async {
// //     await database.delete(
// //       'USER_TABLE',
// //       where: 'id = ?',
// //       whereArgs: [id],
// //     );
// //     await fetchData(); // Refresh list
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return AppBar();
// //   }
// // }
// // //   {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Database Demo'),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           children: [
// // //             TextField(
// // //               controller: titleController,
// // //               decoration: const InputDecoration(labelText: "Title"),
// // //             ),
// // //             TextField(
// // //               controller: nameController,
// // //               decoration: const InputDecoration(labelText: "Name"),
// // //             ),
// // //             ElevatedButton(
// // //                 onPressed: () {
// // //                   !isEdit
// // //                       ? {addData(titleController.text, nameController.text)}
// // //                       : {
// // //                           updateData(editindex, titleController.text,
// // //                               nameController.text)
// // //                         };
// // //                   setState(() {
// // //                     if (isEdit == true) {
// // //                       isEdit = false;
// // //                     }
// // //                     titleController.clear();
// // //                     nameController.clear();
// // //                   });
// // //                 },
// // //                 child: Text(!isEdit ? 'Save' : 'Edit')),
// // //             SizedBox(height: 10),
// // //             Expanded(
// // //               child: ListView.builder(
// // //                 itemCount: data.length,
// // //                 itemBuilder: (context, index) {
// // //                   return Card(
// // //                     margin: const EdgeInsets.symmetric(vertical: 8),
// // //                     child: ListTile(
// // //                       title: Text(data[index]['title']),
// // //                       subtitle: Text(data[index]['name']),
// // //                       trailing: Row(
// // //                         mainAxisSize: MainAxisSize.min,
// // //                         children: [
// // //                           IconButton(
// // //                             icon: const Icon(Icons.edit),
// // //                             onPressed: () {
// // //                               setState(() {
// // //                                 editindex = data[index]['id'];
// // //                                 isEdit = true;
// // //                               });
// // //                               titleController.text = data[index]['title'];
// // //                               nameController.text = data[index]['name'];
// // //                               updateData(data[index]['id'],
// // //                                   data[index]['title'], data[index]['name']);
// // //                             },
// // //                           ),
// // //                           IconButton(
// // //                             icon: const Icon(Icons.delete, color: Colors.red),
// // //                             onPressed: () {
// // //                               deleteData(data[index]['id']);
// // //                             },
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
