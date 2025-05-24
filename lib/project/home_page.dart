

import 'package:flt/project/crud.dart';
import 'package:flt/project/fevorite_list_page.dart';
import 'package:flt/project/login_page.dart';
import 'package:flt/project/const_file.dart';
import 'package:flt/project/user_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'about_us_page.dart';
import 'add_edit_user.dart';

class HomePage extends StatefulWidget {
  List<Map<String, dynamic>> ListToPrint;

  HomePage({super.key, required this.ListToPrint});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> iconName = ['Add User', 'User List', 'Favourite', 'About Us'];
  var icons = [
    Icons.my_library_add_rounded,
    Icons.list_alt_rounded,
    Icons.favorite,
    Icons.account_circle_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Home Page',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF6D4C41),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFFF3E0),
        elevation: 4,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/matrimonial_bg.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color(0xFFFFF8E1).withOpacity(0.6),
                    BlendMode.softLight,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xFFFFF3E0).withOpacity(0.3),
            child: Column(
              children: [
                SizedBox(height: 30),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: icons.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 10.0,
                          shadowColor: Colors.black54,
                          child: InkWell(
                            onTap: ()  {
                              if (index == 0) {
                                // final map =  Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => AddEditUserList(),
                                //   ),
                                // );
                                // if(map != null){
                                //   setState(() {
                                //     CrudList.userList.add(map);
                                //   });
                                // }
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditUserList(),));
                              }
                              if (index == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewUserList(
                                      data: CrudList.userList,
                                    ),
                                  ),
                                );
                              }
                              if (index == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FevoriteListPage()
                                  ),
                                );
                              }
                              if (index == 3) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AboutUsPage()
                                  ),
                                );
                              }
                            },
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF8E1),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    icons[index],
                                    size: 50,
                                    color: Color(0xFF6D4C41),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    iconName[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF3E0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, -2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Welcome to the Home Page",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6D4C41),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}