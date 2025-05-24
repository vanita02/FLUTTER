import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_project/project/project_api.dart';
import 'package:matrimony_project/project/project_db.dart';
import 'package:matrimony_project/project/user_details_page.dart';
import 'package:sqflite/sqflite.dart';
import 'add_edit_user.dart';
import 'crud.dart';

class ViewUserList extends StatefulWidget {
  static List<Map<String, dynamic>> favoriteList = [];
  static bool isFavorited = true;
  CrudList _user = CrudList();
  ProjectApi _api = ProjectApi();

  ViewUserList({super.key});

  @override
  State<ViewUserList> createState() => _ViewUserListState();
}

class _ViewUserListState extends State<ViewUserList> {
  CrudList _user = CrudList(); // Handles database operations
  ProjectApi _api = ProjectApi(); // Handles API operations

  List<Map<String, dynamic>> combinedUserList = []; // Merged list
  List<Map<String, dynamic>> filteredUserList = []; // Filtered list for search

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  /// Fetch Data from Database and API
  void fetchData() async {
    try {
      print("🔄 Fetching data...");
      print("🌐 Fetching API Data from: ${_api.base_url}");
      // Fetch users from the local database
      List<Map<String, dynamic>> dbUsers = await _user.getUserList();
      print("🟢 DB Users: $dbUsers");

      // Fetch users from API
      List<dynamic> apiUsers = [];
      try {
        apiUsers = await _api.getAll();
        print("🟡 Raw API Response: $apiUsers");
      } catch (e) {
        print("⚠️ API Fetch Error: $e");
      }

      // Handle case when both sources are empty
      if (dbUsers.isEmpty && (apiUsers == null || apiUsers.isEmpty)) {
        print("❌ No users found from both sources.");
      }

      // Ensure API response is a valid list
      if (apiUsers is! List) {
        print("⚠️ API Response is not a List! Check API format.");
        apiUsers = [];
      }

      // Format API users correctly
      List<Map<String, dynamic>> formattedApiUsers = apiUsers
          .whereType<Map<String, dynamic>>() // Ensure each item is a Map
          .map((user) {
        print("📌 Formatting API User: $user");

        return {
          "UserID": user["id"] ?? 0, // Default to 0 if null
          "Name": user["Name"] ?? "Unknown",
          "Email": user["Email"] ?? "No Email",
          "PhoneNo": user["PhoneNo"] ?? "No Phone",
          "City": user["City"] ?? "Unknown",
          "Gender": user["Gender"] ?? "Unknown",
          "Hobbies": user["Hobbies"] is List ? user["Hobbies"].join(", ") : user["Hobbies"] ?? "N/A",
          "Age": user["Age"]?.toString() ?? "Unknown",
          "Dob": user["dob"] ?? "Unknown",
          "IsFavourite": user["IsFavorite"] ?? 0,
        };
      }).toList();

      print("🟢 Formatted API Users: $formattedApiUsers");

      // Remove duplicates by ensuring unique UserIDs
      Set<int> existingUserIds = dbUsers.map((user) => user["UserID"] as int).toSet();
      List<Map<String, dynamic>> mergedUsers = [
        ...dbUsers,
        ...formattedApiUsers.where((user) => !existingUserIds.contains(user["UserID"])),
      ];

      // Update UI only if widget is still mounted
      if (mounted) {
        setState(() {
          combinedUserList = mergedUsers;
          filteredUserList = List.from(combinedUserList);
        });
      }

      print("🚀 UI Updated with Combined Data: $filteredUserList");
    } catch (e) {
      print("❌ Error fetching data: $e");
    }
  }



  // Future<void> fetchData() async {
  //   try {
  //     print("📡 Fetching data from API...");
  //     List<dynamic> apiUsers = [];
  //
  //     try {
  //       apiUsers = await _api.getAll();
  //       print("🌍 API Response: ${apiUsers.length} users received.");
  //     } catch (e) {
  //       print("⚠️ API Fetch Error: $e");
  //       return;
  //     }
  //
  //     if (apiUsers.isEmpty) {
  //       print("❌ No users found in API.");
  //       return;
  //     }
  //
  //     await widget._user.insertUsersIntoDatabase(filteredUserList);
  //     List<Map<String, dynamic>> dbUsers = await _user.getUserList();
  //
  //     for (var user in dbUsers) {
  //       print(
  //           "🔍 Retrieved User: ${user[ProjectDb.USER_ID]}, Password: ${user[ProjectDb.PASSWORD]}");
  //     }
  //
  //     setState(() {
  //       filteredUserList = List.from(dbUsers);
  //     });
  //
  //     print("✅ Final User List Updated Successfully.");
  //   } catch (e) {
  //     print("❌ Error fetching data: $e");
  //   }
  // }

  void filterUsers(String query) {
    setState(() {
      filteredUserList = query.isEmpty
          ? List.from(combinedUserList)
          : combinedUserList
              .where((user) =>
                  user['Name'].toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Building UI - User List Length: ${filteredUserList.length}");
    return Scaffold(
      backgroundColor: Colors.brown[300],
      body:
          // filteredUserList.isEmpty
          //     ? Center(
          //         child: Text(
          //           'No User Found',
          //           style: TextStyle(color: Colors.white, fontSize: 16),
          //         ),
          //       )
          //     :
          Stack(
        children: [
          ClipPath(
            clipper: WavyClipper(),
            child: Container(
              height: 150,
              color: Colors.brown[50],
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.brown[50],
                elevation: 0,
                automaticallyImplyLeading: true,
                title: Text(
                  'User List',
                  style: TextStyle(
                    color: Colors.brown[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                centerTitle: true,
              ),
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  style: TextStyle(color: Colors.brown[400]),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.brown[100],
                    labelText: 'Search User',
                    labelStyle: TextStyle(color: Colors.brown[600]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon:
                        Icon(CupertinoIcons.search, color: Colors.brown[600]),
                  ),
                  onChanged: (value) {
                    filterUsers(value);
                  },
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: filteredUserList.isEmpty
                    ? Center(
                        child: Text(
                          'No User Found',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        itemCount: filteredUserList.length,
                        itemBuilder: (context, index) {
                          var user = filteredUserList[index];
                          return Card(
                            color: Colors.brown[100],
                            // Darker card
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    radius: 30,
                                    child: Icon(Icons.person,
                                        color: Colors.brown[500], size: 30),
                                    // child: Text(user['Name'][0],style: TextStyle(fontSize: 30,color: Colors.brown[500]),),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Text(
                                                '${user['Name']} | ${user['Age']} yrs',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.brown[600],
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(Icons.phone,
                                                color: Colors.brown[600],
                                                size: 18),
                                            SizedBox(width: 5),
                                            Text(
                                              user['PhoneNo'] ?? 'N/A',
                                              style: TextStyle(
                                                  color: Colors.brown[600]),
                                            ),
                                          ],
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Icon(Icons.email,
                                                  color: Colors.brown[600],
                                                  size: 18),
                                              SizedBox(width: 5),
                                              Text(
                                                user['Email'] ?? 'N/A',
                                                style: TextStyle(
                                                    color: Colors.brown[600]),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Icon(Icons.location_city,
                                                  color: Colors.brown[600],
                                                  size: 18),
                                              SizedBox(width: 5),
                                              Text(
                                                user['City'] ?? 'N/A',
                                                style: TextStyle(
                                                    color: Colors.brown[600]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          filteredUserList.isNotEmpty &&
                                                  filteredUserList[index][
                                                          ProjectDb
                                                              .IS_FAVOURITE] ==
                                                      1
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Color(0xFFFFF3E0),
                                        ),
                                        onPressed: () async {
                                          int userId = int.tryParse(filteredUserList[index][ProjectDb.USER_ID].toString()) ?? 0;
                                          int currentStatus = int.tryParse(filteredUserList[index][ProjectDb.IS_FAVOURITE].toString()) ?? 0;

                                          // **Create a deep copy of user list**
                                          List<Map<String, dynamic>> updatedList = filteredUserList
                                              .map((user) => Map<String, dynamic>.from(user))
                                              .toList();

                                          // **Toggle favorite status**
                                          updatedList[index][ProjectDb.IS_FAVOURITE] = currentStatus == 1 ? 0 : 1;

                                          // **Update state to reflect UI change**
                                          setState(() {
                                            filteredUserList = updatedList; // Keep all users, just update the favorite status
                                          });

                                          // **Update in database**
                                          await widget._user.toggleFavorite(userId, currentStatus);

                                          print("❤️ Updated Favorite Status for User ID: $userId");
                                        },

                                      ),
                                      IconButton(
                                        icon: Icon(Icons.info_outline,
                                            color: Colors.brown[600]),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UserDetailsPage(
                                                      details: user),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          icon: Icon(Icons.edit,
                                              color: Colors.brown[600]),
                                          onPressed: () async {
                                            print("Editing User===========================: $user");
                                            var updatedUser =
                                                await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddEditUserList(
                                                        userDetail: user),
                                              ),
                                            );

                                            if (updatedUser != null) {
                                              setState(() {
                                                // Update the user list
                                                int index = filteredUserList
                                                    .indexWhere((element) =>
                                                        element[ProjectDb
                                                            .USER_ID] ==
                                                        updatedUser[
                                                            ProjectDb.USER_ID]);
                                                if (index != -1) {
                                                  filteredUserList[index] =
                                                      updatedUser;
                                                }
                                              });
                                            }
                                          }),
                                      IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.brown[600]),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor:
                                                    Colors.brown[800],
                                                title: Text(
                                                  'Delete User',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                content: Text(
                                                  'Are you sure you want to delete this user?',
                                                  style: TextStyle(
                                                      color: Colors.white70),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () async {
                                                      await widget._user
                                                          .deleteUser(user[
                                                              ProjectDb
                                                                  .USER_ID]);
                                                      await widget._api
                                                          .deleteData(user[
                                                              ProjectDb
                                                                  .USER_ID]);

                                                      setState(() {
                                                        filteredUserList
                                                            .removeWhere((u) =>
                                                                u[ProjectDb
                                                                    .USER_ID] ==
                                                                user[ProjectDb
                                                                    .USER_ID]); // Remove user from list
                                                      });

                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Yes',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .redAccent)),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('No',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .redAccent)),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[400],
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEditUserList()),
          );
          fetchData();
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height - 40, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
