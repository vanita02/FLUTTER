import 'dart:ui';

import 'package:matrimony_project/project/project_db.dart';
import 'package:sqflite/sqflite.dart';

class CrudList {
  List<Map<String, dynamic>> userList = [];
  List<Map<String, dynamic>> filteredUserList = [];

  Future<void> addUserInUserTable(
      {required Name,
      required Email,
      required PhoneNo,
      required Password,
      required ConfirmPassword,
      required City,
      required Gender,
      required Hobbies,
      required Age,
      required dob}) async {
    Database db = await ProjectDb().initDatabase();

    Map<String, dynamic> map = {};
    map[ProjectDb.NAME] = Name;
    map[ProjectDb.EMAIL] = Email;
    map[ProjectDb.PHONE_NO] = PhoneNo;
    map[ProjectDb.PASSWORD] = Password;
    map[ProjectDb.CONFIRM_PASSWORD] = ConfirmPassword;
    map[ProjectDb.CITY] = City;
    map[ProjectDb.GENDER] = Gender;
    map[ProjectDb.HOBBIES] =
        (Hobbies is List<String>) ? Hobbies.join(',') : Hobbies;
    map[ProjectDb.AGE] = Age.toString();
    map[ProjectDb.DOB] = (dob is DateTime) ? dob.toIso8601String() : dob;
    map[ProjectDb.IS_FAVOURITE] = 0;

    print("🔹 Trying to insert: $map");

    try {
      int number = await db.insert(ProjectDb.USER, map);
      if (number > 0) {
        print("✅ User added successfully: $map");
        await getUserList();
      } else {
        print("❌ Insert failed");
      }
    } catch (e) {
      print("🔥 Insert Error: $e");
    }
  }


  // Future<void> insertUsersIntoDatabase(List<Map<String, dynamic>> apiUsers) async {
  //   try {
  //     final Database db = await ProjectDb().initDatabase();
  //
  //     if (apiUsers.isEmpty) {
  //       print("⚠️ No users to insert.");
  //       return;
  //     }
  //
  //     print("📥 Preparing to insert ${apiUsers.length} users into database...");
  //
  //     Batch batch = db.batch(); // Use batch for efficient inserts
  //
  //     for (var user in apiUsers) {
  //       int userId = int.tryParse(user["id"].toString()) ?? 0;
  //       int age = int.tryParse(user["Age"].toString()) ?? 0;
  //       int isFavourite = int.tryParse(user["IsFavorite"].toString()) ?? 0;
  //
  //       if (userId == 0) {
  //         print("⚠️ Skipping invalid user: ${user["id"]}");
  //         continue;
  //       }
  //
  //       // Check if user exists
  //       List<Map<String, dynamic>> existingUsers = await db.query(
  //         ProjectDb.USER,
  //         where: "${ProjectDb.USER_ID} = ?",
  //         whereArgs: [userId],
  //       );
  //
  //       if (existingUsers.isEmpty) {
  //         print("🆕 Adding User ID: $userId to batch insert.");
  //
  //         batch.insert(
  //           ProjectDb.USER,
  //           {
  //             ProjectDb.USER_ID: userId,
  //             ProjectDb.NAME: user["Name"] ?? "Unknown",
  //             ProjectDb.EMAIL: user["Email"] ?? "No Email",
  //             ProjectDb.PHONE_NO: user["PhoneNo"] ?? "No Phone",
  //             ProjectDb.PASSWORD: user["Password"] ?? "Unknown",
  //             ProjectDb.CONFIRM_PASSWORD: user["ConfirmPassword"] ?? "Unknown",
  //             ProjectDb.CITY: user["City"] ?? "Unknown",
  //             ProjectDb.GENDER: user["Gender"] ?? "Unknown",
  //             ProjectDb.HOBBIES: user["Hobbies"] is List
  //                 ? user["Hobbies"].join(", ")
  //                 : user["Hobbies"] ?? "N/A",
  //             ProjectDb.AGE: age,
  //             ProjectDb.DOB: user["dob"] ?? "Unknown",
  //             ProjectDb.IS_FAVOURITE: isFavourite,
  //             // Ensure password fields are not null
  //
  //           },
  //           conflictAlgorithm: ConflictAlgorithm.replace,
  //         );
  //       } else {
  //         print("ℹ️ User ID: $userId already exists. Skipping.");
  //       }
  //     }
  //
  //     print("API Response: $apiUsers===========================================");
  //
  //
  //     // Execute batch insert
  //     await batch.commit(noResult: true);
  //     print("✅ Users successfully inserted into database.");
  //
  //   } catch (e) {
  //     print("❌ Error inserting users: $e");
  //   }
  // }

  Future<List<Map<String, dynamic>>> getUserList() async {
    Database db = await ProjectDb().initDatabase();
    userList.clear();
    userList.addAll(await db.rawQuery('SELECT * FROM ${ProjectDb.USER}'));
    filteredUserList.addAll(userList);
    return filteredUserList;
  }

  // Future<List<Map<String, dynamic>>> getUserList() async {
  //   Database db = await ProjectDb().initDatabase();
  //   userList.clear();
  //   filteredUserList.clear();
  //
  //   List<Map<String, dynamic>> users =
  //       await db.rawQuery('SELECT * FROM ${ProjectDb.USER}');
  //   print("📂 Users fetched from DB: $users");
  //
  //   userList.addAll(users);
  //   filteredUserList.addAll(userList);
  //
  //   return filteredUserList;
  // }

  Future<void> updateUser(
      {required int id,
      required String Name,
      required String Email,
      required String PhoneNo,
      required String Password,
      required String ConfirmPassword,
      required dynamic City,
      required dynamic Gender,
      required List<String> Hobbies,
      required int Age,
      required String dob}) async {
    Database db = await ProjectDb().initDatabase();
    Map<String, dynamic> map = {};
    map[ProjectDb.NAME] = Name;
    map[ProjectDb.EMAIL] = Email;
    map[ProjectDb.PHONE_NO] = PhoneNo;
    map[ProjectDb.PASSWORD] = Password;
    map[ProjectDb.CONFIRM_PASSWORD] = ConfirmPassword;
    map[ProjectDb.CITY] = City;
    map[ProjectDb.GENDER] = Gender;
    map[ProjectDb.HOBBIES] =
        (Hobbies is List<String>) ? Hobbies.join(',') : Hobbies;
    map[ProjectDb.AGE] = Age.toString();
    map[ProjectDb.DOB] = (dob is DateTime) ? dob.toString() : dob;
    map[ProjectDb.IS_FAVOURITE] = 0;

    print("🚀 Updating user with ID: $id");
    print("🔹 Updated Data: $map");

    // await db.update(ProjectDb.USER, map,
    //     where: '${ProjectDb.USER_ID} = ?', whereArgs: [id]);
    int result = await db.update(
      ProjectDb.USER,
      map,
      where: '${ProjectDb.USER_ID} = ?',
      whereArgs: [id],
    );

    if (result > 0) {
      print("✅ User updated successfully");
    } else {
      print("⚠️ ERROR: Failed to update user.");
    }
  }

  Future<void> deleteUser(id) async {
    Database db = await ProjectDb().initDatabase();
    int userID = await db.delete(
      ProjectDb.USER,
      where: '${ProjectDb.USER_ID} = ?',
      whereArgs: [id],
    );
    if (userID > 0) userList.removeAt(id);
  }

  // void searchDeatil({required searchData}) {
  //   filteredUserList.clear();
  //   for (var element in userList) {
  //     if (element[ProjectDb.NAME]
  //         .toString()
  //         .toLowerCase()
  //          .contains(searchData.toString().toLowerCase())
  //         // ||
  //         // element[ProjectDb.EMAIL]
  //         //     .toString()
  //         //     .toLowerCase()
  //         //     .contains(searchData.toString().toLowerCase()) ||
  //         // element[ProjectDb.PHONE_NO]
  //         //     .toString()
  //         //     .toLowerCase()
  //         //     .contains(searchData.toString().toLowerCase()) ||
  //         // element[ProjectDb.AGE]
  //         //     .toString()
  //         //     .toLowerCase()
  //         //     .contains(searchData.toString().toLowerCase()) ||
  //         // element[ProjectDb.DOB ]
  //         //     .toString()
  //         //     .toLowerCase()
  //         //     .contains(searchData.toString().toLowerCase())
  //          ) {
  //       filteredUserList.add(element);
  //     }
  //   }
  //   if (searchData.toString().isEmpty) {
  //     filteredUserList.clear();
  //     filteredUserList.addAll(userList);
  //   }
  // }
  void searchDeatil({required searchData}) {
    filteredUserList.clear();

    for (var element in userList) {
      if (element[ProjectDb.NAME]
              ?.toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase()) ??
          false) {
        filteredUserList.add(element);
      }
      // Uncomment and adjust these checks if needed
      else if (element[ProjectDb.EMAIL]
              ?.toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase()) ??
          false) {
        filteredUserList.add(element);
      } else if (element[ProjectDb.CITY]
              ?.toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase()) ??
          false) {
        filteredUserList.add(element);
      } else if (element[ProjectDb.PHONE_NO]
              ?.toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase()) ??
          false) {
        filteredUserList.add(element);
      } else if (element[ProjectDb.AGE]
              ?.toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase()) ??
          false) {
        filteredUserList.add(element);
      } else if (element[ProjectDb.DOB]
              ?.toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase()) ??
          false) {
        filteredUserList.add(element);
      }
    }

    // If searchData is empty, reset the filtered list to the full user list
    if (searchData.toString().isEmpty) {
      filteredUserList.clear();
      filteredUserList.addAll(userList);
    }
  }

  Future<void> toggleFavorite(int userId, int currentStatus) async {
    final Database db = await ProjectDb().initDatabase();
    int newStatus = currentStatus == 1 ? 0 : 1;

    int result = await db.update(
      ProjectDb.USER,
      {ProjectDb.IS_FAVOURITE: newStatus},
      where: '${ProjectDb.USER_ID} = ?',
      whereArgs: [userId],
    );

    if (result > 0) {
      for (var user in userList) {
        if (user[ProjectDb.USER_ID] == userId) {
          user[ProjectDb.IS_FAVOURITE] = newStatus;
          break;
        }
      }
      print("⭐ User ID $userId favorite status updated to $newStatus");
    } else {
      print("⚠️ Error updating favorite status for User ID $userId.");
    }
  }

  // Function to get all favorite users
  Future<List<Map<String, dynamic>>> getFavoriteUsers() async {
    List<Map<String, dynamic>> allUsers = await getUserList(); // Get all users
    List<Map<String, dynamic>> favUsers =
        allUsers.where((user) => user[ProjectDb.IS_FAVOURITE] == 1).toList();

    print("🔍 Filtered Favorite Users: $favUsers"); // Debugging Output
    return favUsers;
  }

  Future<void> fetchFavorites() async {
    final Database db = await ProjectDb().initDatabase();

    try {
      // Fetch users that are marked as favorites
      List<Map<String, dynamic>> favUsers = await db.query(
        ProjectDb.USER,
        where: '${ProjectDb.IS_FAVOURITE} = ?',
        whereArgs: [1], // Fetch only users marked as favorite
      );

      // Check for empty result
      if (favUsers.isEmpty) {
        print("❌ No favorite users found.");
      }

      // Ensure userList and filteredUserList are updated with fresh data
      userList = List<Map<String, dynamic>>.from(favUsers);
      filteredUserList = List<Map<String, dynamic>>.from(userList);

      print("⭐ Favorite Users List Updated: $userList");
    } catch (e) {
      print("🔥 Error while fetching favorite users: $e");
    }
  }

  Future<void> removeFavorite(
      Map<String, dynamic> user, VoidCallback onUpdate) async {
    final Database db = await ProjectDb().initDatabase();

    try {
      int result = await db.update(
        ProjectDb.USER,
        {ProjectDb.IS_FAVOURITE: 0},
        where: '${ProjectDb.USER_ID} = ?',
        whereArgs: [user[ProjectDb.USER_ID]],
      );

      if (result > 0) {
        print("✅ User removed from favorites.");

        // Update local lists
        userList.removeWhere(
            (item) => item[ProjectDb.USER_ID] == user[ProjectDb.USER_ID]);
        filteredUserList.removeWhere(
            (item) => item[ProjectDb.USER_ID] == user[ProjectDb.USER_ID]);

        // Call the UI update function
        onUpdate();
      } else {
        print("⚠️ No records updated, check if the user exists.");
      }
    } catch (e) {
      print("🔥 Error while removing favorite: $e");
    }
  }
}
