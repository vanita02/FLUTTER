//regian GETTEXTFORMFEILD CODE
// Widget getTextFormFeild({
//   required TextEditingController nameOfcontroller,
//   String? hinttext,
//   double radious = 8.0,
//   String? Function(String?)? validator,
//   bool isPassword = false,
//   int? maxLength,
//   TextInputType? keybordtype, // Change dynamic? to TextInputType?
//   List<TextInputFormatter>? inputFormatters,
//   Widget? suffixIcon,
// }) {
//   return TextFormField(
//     controller: nameOfcontroller,
//     validator: validator,
//     obscureText: isPassword,
//     maxLength: maxLength,
//     keyboardType: keybordtype,
//     inputFormatters: inputFormatters,
//     decoration: InputDecoration(
//       hintText: hinttext,
//       labelText: hinttext,
//       suffixIcon: suffixIcon,
//       border: UnderlineInputBorder(
//         borderRadius: BorderRadius.horizontal(right: Radius.zero),
//       ),
//     ),
//   );
// }
//endregian





//regian INITSTATE
// void initState() {
//   super.initState();
//   if (widget.existingUser != null) {
//     nameController.text = widget.existingUser!['Name'];
//     emailController.text = widget.existingUser!['Email'];
//     phoneController.text = widget.existingUser!['PhoneNo'];
//     passwordController.text = widget.existingUser!['Password'];
//     confirmPasswordController.text = widget.existingUser!['Confirm'];
//     if (widget.existingUser!['BirthDate'] != null) {
//       selectedDate = DateTime.parse(widget.existingUser!['BirthDate']);
//       dobController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
//     } else {
//       selectedDate = null;
//     }
//
//     selectedGender = widget.existingUser!['Gender'];
//     selectedHobbies =
//         List<String>.from(widget.existingUser!['Hobbies']);
//     selectedCountryCode = widget.existingUser!['CountryCode'] ?? '+91';
//   }
// }
//endregian





//regian OLD CODE
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
//endregian