// import 'package:flt/project/add_edit_user.dart';
// import 'package:flt/project/crud.dart';
// import 'package:flt/project/home_page.dart';
// import 'package:flt/project/login_page.dart';
// import 'package:flt/project/const_file.dart';
// import 'package:flt/project/user_details_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ViewUserList extends StatefulWidget {
//   final List<Map<String, dynamic>>? data;
//   static List<Map<String,dynamic>> favoriteList = [];
//   static bool isFavorited = true;
//   ViewUserList({super.key, required this.data});
//
//   @override
//   State<ViewUserList> createState() => _ViewUserListState();
// }
//
// class _ViewUserListState extends State<ViewUserList> {
//   bool isGrid = false;
//   bool isHeartFilled = true;
//   List<bool> isFavoritedList = [];
//
//
//   //EDIT
//    void editUser(int index) async {
//     final Map<String, dynamic>? updatedUser = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AddEditUserList(
//           existingUser: CrudList.userList![index],
//           isEdit: true,
//           editIndex: index,
//         ),
//       ),
//     );
//     if (updatedUser != null) {
//       setState(() {
//         widget.data![index] = updatedUser;
//       });
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // automaticallyImplyLeading: false,
//         backgroundColor: Color(0xFFFFF8E1),
//         title: Text('UserList',
//             style: TextStyle(
//                 color: Colors.brown,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20)),
//         actions: [
//           // InkWell(
//           //     onTap: () {
//           //       setState(() {
//           //         isGrid = true;
//           //       });
//           //     },
//           //     child: Icon(Icons.grid_3x3, color: Colors.brown)),
//           InkWell(
//               onTap: () {
//                 setState(() {
//                   isGrid = false;
//                 });
//               },
//               child: Icon(Icons.list, color: Colors.brown))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: widget.data!.isEmpty
//             ? Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 400.0),
//                   child: Center(
//                       child: Text(
//                     'No User Found',
//                     style:
//                         TextStyle(color: Colors.brown.shade300, fontSize: 15),
//                   )),
//                 ),
//               )
//             :  Container(
//                     height: 850,
//                     color: Color(0xFFFFF8E1),
//                     child: ListView.builder(
//                       itemCount: widget.data?.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           elevation: 10,
//                           color: Colors.brown,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                             'Name : ${widget.data![index]['Name']}',
//                                             style: TextStyle(
//                                                 color: Color(0xFFFFF8E1))),
//                                         Text(
//                                             'Age : ${widget.data![index]['Age']}',
//                                             style: TextStyle(
//                                                 color: Color(0xFFFFF8E1))),
//                                         Text(
//                                             'Email : ${widget.data![index]['Email']}',
//                                             style: TextStyle(
//                                                 color: Color(0xFFFFF8E1))),
//                                         Text(
//                                             'PhoneNo : ${widget.data![index]['PhoneNo']}',
//                                             style: TextStyle(
//                                                 color: Color(0xFFFFF8E1))),
//                                         ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               backgroundColor: Color(0xFFFFF8E1).withOpacity(0.3),
//                                               foregroundColor: Colors.brown,
//                                             ),
//                                             onPressed: () {
//                                           Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsPage(),));
//                                         }, child: Text('Know more')),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.end,
//                                       children: [
//                                         InkWell(
//                                             onTap: () {
//                                               showDialog(
//                                                 context: context,
//                                                 builder: (context) {
//                                                   return CupertinoAlertDialog(
//                                                     title: Text('DELETE'),
//                                                     content: Text(
//                                                         'Are you sure want to delete?'),
//                                                     actions: [
//                                                       TextButton(
//                                                         onPressed: () {
//                                                           widget.data
//                                                               ?.removeAt(index);
//                                                           Navigator.pop(
//                                                               context);
//                                                           setState(() {});
//                                                         },
//                                                         child: Text(
//                                                           'yes',
//                                                           style: TextStyle(
//                                                               color:
//                                                                   Colors.red),
//                                                         ),
//                                                       ),
//                                                       TextButton(
//                                                         onPressed: () {
//                                                           Navigator.pop(
//                                                               context);
//                                                           setState(() {});
//                                                         },
//                                                         child: Text(
//                                                           'No',
//                                                           style: TextStyle(
//                                                               color:
//                                                                   Colors.red),
//                                                         ),
//                                                       )
//                                                     ],
//                                                   );
//                                                 },
//                                               );
//                                             },
//                                             child: Icon(Icons.delete,
//                                                 color: Color(0xFFFFF8E1))),
//                                         SizedBox(width: 10),
//                                         // InkWell(
//                                         //   // icon: Icon(
//                                         //   //   isFavorited ? Icons.favorite : Icons.favorite_border,
//                                         //   //   color: isFavorited ? Color(0xFFFFF8E1) : Colors.grey,
//                                         //   // ),
//                                         //   onTap: () {
//                                         //     setState(() {
//                                         //       if(ViewUserList.fevorite!.contains(index)){
//                                         //         ViewUserList.fevorite?.removeAt(CrudList.userList[index] as int);
//                                         //       } else{
//                                         //         ViewUserList.fevorite?.add(CrudList.userList[index]);
//                                         //       }
//                                         //       ViewUserList.isFavorited =
//                                         //           !ViewUserList.isFavorited; // Toggle state
//                                         //     });
//                                         //   },
//                                         //   child: Icon(
//                                         //     ViewUserList.isFavorited
//                                         //         ? Icons.favorite
//                                         //         : Icons.favorite_border,
//                                         //     color: ViewUserList.isFavorited
//                                         //         ? Color(0xFFFFF8E1)
//                                         //         : Color(0xFFFFF8E1),
//                                         //   ),
//                                         // ),
//                                         InkWell(
//                                           onTap: () {
//                                             setState(() {
//                                               var user = CrudList.userList[index]; // Get user from global list
//
//                                               if (ViewUserList.favoriteList.contains(user)) {
//                                                 ViewUserList.favoriteList.removeWhere((element) => element["id"] == user["id"]); // Remove from favorites
//                                               } else {
//                                                 ViewUserList.favoriteList.add(user); // Add to favorites
//                                               }
//                                             });
//                                           },
//                                           child: Icon(
//                                             ViewUserList.favoriteList.contains(CrudList.userList[index]) // Check if in favorites
//                                                 ? Icons.favorite
//                                                 : Icons.favorite_border,
//                                             color: ViewUserList.favoriteList.contains(CrudList.userList[index])
//                                                 ? Color(0xFFFFF8E1) // Favorited color
//                                                 : Color(0xFFFFF8E1), // Default color
//                                           ),
//                                         ),
//
//
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddEditUserList(),));
//                                             // CrudList().userList![index];
//                                             editUser(index);
//                                           },
//                                           child: Icon(
//                                             Icons.edit,
//                                             color: Color(0xFFFFF8E1),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//
//         // Container(
//         //             height: 1000,
//         //             color: Color(0xFFFFF8E1),
//         //             child: GridView.builder(
//         //               padding: EdgeInsets.all(10.0),
//         //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         //                 crossAxisCount: 2,
//         //               ),
//         //               itemCount: widget.data?.length,
//         //               itemBuilder: (context, index) {
//         //                 return Card(
//         //                   elevation: 10,
//         //                   color: Colors.brown,
//         //                   child: Padding(
//         //                     padding: const EdgeInsets.all(8.0),
//         //                     child: Column(
//         //                       children: [
//         //                         Container(
//         //                           child: Container(
//         //                             child: Column(
//         //                               children: [
//         //                                 Center(
//         //                                   child: Text(
//         //                                     'Name : ${widget.data![index]['Name']}',
//         //                                     style: TextStyle(
//         //                                         color: Color(0xFFFFF8E1)),
//         //                                   ),
//         //                                 ),
//         //                                 Center(
//         //                                   child: Text(
//         //                                     'Age : ${widget.data![index]['Age']}',
//         //                                     style: TextStyle(
//         //                                         color: Color(0xFFFFF8E1)),
//         //                                   ),
//         //                                 ),
//         //                                 Center(
//         //                                   child: Text(
//         //                                     'Email : ${widget.data![index]['Email']}',
//         //                                     style: TextStyle(
//         //                                         color: Color(0xFFFFF8E1)),
//         //                                   ),
//         //                                 ),
//         //                                 Center(
//         //                                   child: Text(
//         //                                     'PhoneNo : ${widget.data![index]['PhoneNo']}',
//         //                                     style: TextStyle(
//         //                                         color: Color(0xFFFFF8E1)),
//         //                                   ),
//         //                                 ),
//         //                               ],
//         //                             ),
//         //                           ),
//         //                         ),
//         //                         Container(
//         //                           child: Container(
//         //                             child: Row(
//         //                               mainAxisAlignment:
//         //                                   MainAxisAlignment.center,
//         //                               children: [
//         //                                 InkWell(
//         //                                     onTap: () {
//         //                                       showDialog(
//         //                                         context: context,
//         //                                         builder: (context) {
//         //                                           return CupertinoAlertDialog(
//         //                                             title: Text('DELETE'),
//         //                                             content: Text(
//         //                                                 'Are you sure want to delete?'),
//         //                                             actions: [
//         //                                               TextButton(
//         //                                                 onPressed: () {
//         //                                                   widget.data
//         //                                                       ?.removeAt(index);
//         //                                                   Navigator.pop(
//         //                                                       context);
//         //                                                   setState(() {});
//         //                                                 },
//         //                                                 child: Text(
//         //                                                   'yes',
//         //                                                   style: TextStyle(
//         //                                                       color:
//         //                                                           Colors.red),
//         //                                                 ),
//         //                                               ),
//         //                                               TextButton(
//         //                                                 onPressed: () {
//         //                                                   Navigator.pop(
//         //                                                       context);
//         //                                                   setState(() {});
//         //                                                 },
//         //                                                 child: Text(
//         //                                                   'No',
//         //                                                   style: TextStyle(
//         //                                                       color:
//         //                                                           Colors.red),
//         //                                                 ),
//         //                                               )
//         //                                             ],
//         //                                           );
//         //                                         },
//         //                                       );
//         //                                     },
//         //                                     child: Icon(Icons.delete,
//         //                                         color: Color(0xFFFFF8E1))),
//         //                                 SizedBox(width: 10),
//         //                                 InkWell(
//         //                                   onTap: () {
//         //                                     setState(() {
//         //                                       var user = CrudList.userList[index]; // Get user from global list
//         //
//         //                                       if (ViewUserList.favoriteList.contains(user)) {
//         //                                         ViewUserList.favoriteList.removeWhere((element) => element["id"] == user["id"]); // Remove from favorites
//         //                                       } else {
//         //                                         ViewUserList.favoriteList.add(user); // Add to favorites
//         //                                       }
//         //                                     });
//         //                                   },
//         //                                   child: Icon(
//         //                                     ViewUserList.favoriteList.contains(CrudList.userList[index]) // Check if in favorites
//         //                                         ? Icons.favorite
//         //                                         : Icons.favorite_border,
//         //                                     color: ViewUserList.favoriteList.contains(CrudList.userList[index])
//         //                                         ? Color(0xFFFFF8E1)// Favorited color
//         //                                         : Color(0xFFFFF8E1), // Default color
//         //                                   ),
//         //                                 ),
//         //
//         //
//         //                                 SizedBox(
//         //                                   width: 10,
//         //                                 ),
//         //                                 InkWell(
//         //                                     onTap: () {
//         //                                       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddEditUserList(),));
//         //                                       editUser(index);
//         //                                     },
//         //                                     child: Icon(Icons.edit,
//         //                                         color: Color(0xFFFFF8E1))
//         //                                 ),
//         //                               ],
//         //                             ),
//         //                           ),
//         //                         ),
//         //                         SizedBox(height: 5,),
//         //                         Center(
//         //                           child: ElevatedButton(
//         //                               style: ElevatedButton.styleFrom(
//         //                                 backgroundColor: Color(0xFFFFF8E1).withOpacity(0.3),
//         //                                 foregroundColor: Colors.brown,
//         //                               ),
//         //                               onPressed: () {
//         //                                 Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsPage(),));
//         //                               }, child: Text('Know more')),
//         //                         ),
//         //                       ],
//         //                     ),
//         //                   ),
//         //                 );
//         //               },
//         //             ),
//         //           ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.brown,
//         onPressed: () {
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => AddEditUserList(),
//               ));
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:flt/project/add_edit_user.dart';
import 'package:flt/project/crud.dart';
import 'package:flt/project/user_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const_file.dart';

class ViewUserList extends StatefulWidget {
  final List<Map<String, dynamic>>? data;
  static List<Map<String, dynamic>> favoriteList = [];
  static bool isFavorited = true;

  ViewUserList({super.key, required this.data});

  @override
  State<ViewUserList> createState() => _ViewUserListState();
}

class _ViewUserListState extends State<ViewUserList> {

  void editUser(int index) async {
    final Map<String, dynamic>? updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditUserList(
          existingUser: CrudList.userList![index],
          isEdit: true,
          editIndex: index,
        ),
      ),
    );
    if (updatedUser != null) {
      setState(() {
        widget.data![index] = updatedUser;
      });
    }
  }

  bool isserach = false;
  List<Map<String, dynamic>>? searchdata = [];
  List<Map<String, dynamic>>? filteredList = [];


  void initState(){
    super.initState();
    filteredList = widget.data!;
  }
  void searchUser(String searchQuery) {
    setState(() {
      if (searchQuery.isEmpty) {
        isserach = false;
        filteredList = widget.data!;
      } else {
        filteredList = widget.data!.where((element) {
          return (element['Name']?.toString().toLowerCase() ?? '')
                  .contains(searchQuery.toLowerCase()) ||
              (element['City']?.toString().toLowerCase() ?? '')
                  .contains(searchQuery.toLowerCase()) ||
              (element['Age']?.toString().toLowerCase() ?? '')
                  .contains(searchQuery.toLowerCase()) ||
              (element['Email']?.toString().toLowerCase() ?? '')
                  .contains(searchQuery.toLowerCase()) ||
              (element['PhoneNo']?.toString().toLowerCase() ?? '')
                  .contains(searchQuery.toLowerCase());
        }).toList();
        isserach = true;
      }
      print(filteredList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEED9B9),
        title: Text('User List',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Search User',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              onChanged: (value) => searchUser(value),
            ),
            widget.data!.isEmpty || filteredList!.isEmpty
                ? Padding(
                  padding: const EdgeInsets.only(top: 350.0),
                  child: Center(
                      child: Text('No User Found',
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                    ),
                )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredList?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.brown,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFFFFF3E0),
                                child: Icon(Icons.person, color: Colors.brown),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('${filteredList![index]['Name']}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFFFFF3E0))),
                                        Text(
                                          ' | ',
                                          style: TextStyle(
                                              color: Color(0xFFFFF3E0)),
                                        ),
                                        Text(
                                            '${filteredList![index]['Age']} years',
                                            style: TextStyle(
                                                color: Color(0xFFFFF3E0))),
                                      ],
                                    ),

                                    // Row(
                                    //   children: [
                                    //     Icon(Icons.location_on,
                                    //         color: Colors.orange, size: 16),
                                    //     SizedBox(width: 4),
                                    //     Text('${widget.data![index]['Location']}'),
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        Icon(Icons.phone,
                                            color: Color(0xFFFFF3E0), size: 16),
                                        SizedBox(width: 4),
                                        Text(
                                          '${widget.data![index]['PhoneNo']}',
                                          style: TextStyle(
                                              color: Color(0xFFFFF3E0)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.email,
                                            color: Color(0xFFFFF3E0), size: 16),
                                        SizedBox(width: 4),
                                        Text(
                                          '${filteredList![index]['Email']}',
                                          style: TextStyle(
                                              color: Color(0xFFFFF3E0)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          ViewUserList.favoriteList.contains(
                                                  CrudList.userList[index])
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Color(0xFFFFF3E0),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            var user = CrudList.userList[index];
                                            if (ViewUserList.favoriteList
                                                .contains(user)) {
                                              ViewUserList.favoriteList
                                                  .removeWhere((element) =>
                                                      element["id"] ==
                                                      user["id"]);
                                            } else {
                                              ViewUserList.favoriteList
                                                  .add(user);
                                            }
                                          });
                                        },
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserDetailsPage(),
                                                ));
                                          },
                                          icon: Icon(
                                            Icons.info_outline,
                                            color: Color(0xFFFFF3E0),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Color(0xFFFFF3E0)),
                                        onPressed: () {
                                          editUser(index);
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Color(0xFFFFF3E0)),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return CupertinoAlertDialog(
                                                title: Text('DELETE'),
                                                content: Text(
                                                    'Are you sure want to delete?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      widget.data
                                                          ?.removeAt(index);
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    },
                                                    child: Text('Yes',
                                                        style: TextStyle(
                                                            color: Colors.red)),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('No',
                                                        style: TextStyle(
                                                            color: Colors.red)),
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
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditUserList(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
