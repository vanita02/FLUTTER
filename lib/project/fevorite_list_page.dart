import 'package:flt/project/crud.dart';
import 'package:flt/project/user_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_edit_user.dart';

class FevoriteListPage extends StatefulWidget {
   FevoriteListPage({super.key});

  @override
  State<FevoriteListPage> createState() => _FevoriteListPageState();
}

class _FevoriteListPageState extends State<FevoriteListPage> {



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
        ViewUserList.favoriteList![index] = updatedUser;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF8E1),
        title: Text('Favourite',
            style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ViewUserList.favoriteList!.isEmpty ?
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 400.0),
                child: Center(
                    child: Text(
                      'No User Found',
                      style:
                      TextStyle(color: Colors.brown.shade300, fontSize: 15),
                    )),
              ),
            )
            : Container(
              height: 850,
              color: Color(0xFFFFF8E1),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ViewUserList.favoriteList?.length,
                itemBuilder: (context, index) {
                  var user = ViewUserList.favoriteList[index];
                  return Card(
                    elevation: 10,
                    color: Colors.brown,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Name : ${ViewUserList.favoriteList![index]['Name']}',
                                      style: TextStyle(
                                          color: Color(0xFFFFF8E1))),
                                  Text(
                                      'Age : ${ViewUserList.favoriteList![index]['Age']}',
                                      style: TextStyle(
                                          color: Color(0xFFFFF8E1))),
                                  Text(
                                      'Email : ${ViewUserList.favoriteList![index]['Email']}',
                                      style: TextStyle(
                                          color: Color(0xFFFFF8E1))),
                                  Text(
                                      'PhoneNo : ${ViewUserList.favoriteList![index]['PhoneNo']}',
                                      style: TextStyle(
                                          color: Color(0xFFFFF8E1))),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap: () {
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
                                                    setState(() {
                                                      ViewUserList.favoriteList.removeAt(index);
                                                    });
                                                    Navigator.pop(
                                                        context);
                                                  },
                                                  child: Text(
                                                    'yes',
                                                    style: TextStyle(
                                                        color:
                                                        Colors.red),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context);
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color:
                                                        Colors.red),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Icon(Icons.delete,
                                          color: Color(0xFFFFF8E1))),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        var user = ViewUserList.favoriteList[index];

                                        if (ViewUserList.favoriteList.any((element) => element[index] == user[index])) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return CupertinoAlertDialog(
                                                  title: Text('REMOVE'),
                                                  content: Text(
                                                      'Are you sure want to remove?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          ViewUserList.favoriteList.removeWhere((element) => element[index] == user[index]);
                                                        });
                                                        Navigator.pop(
                                                            context);
                                                      },
                                                      child: Text(
                                                        'yes',
                                                        style: TextStyle(
                                                            color:
                                                            Colors.red),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context);
                                                        setState(() {});
                                                      },
                                                      child: Text(
                                                        'No',
                                                        style: TextStyle(
                                                            color:
                                                            Colors.red),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            );

                                        } else {
                                          ViewUserList.favoriteList.add(user);
                                        }
                                      });
                                    },
                                    child: Icon(
                                      ViewUserList.isFavorited
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: ViewUserList.isFavorited
                                          ? Color(0xFFFFF8E1)
                                          : Color(0xFFFFF8E1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddEditUserList(),));
                                      // CrudList().userList![index];
                                      editUser(index);
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Color(0xFFFFF8E1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
