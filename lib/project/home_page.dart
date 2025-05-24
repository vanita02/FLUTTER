import 'package:flutter/material.dart';
import 'about_us_page.dart';
import 'add_edit_user.dart';
import 'crud.dart';
import 'fevorite_list_page.dart';
import 'package:matrimony_project/project/user_list_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  List<Map<String, dynamic>> ListToPrint;

  HomePage({super.key, required this.ListToPrint});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Function to show confirmation dialog
  Future<void> _showLogoutDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.brown[200],
          title: Center(child: Text("Logout ")),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog
              child: Text("Cancel", style: TextStyle(color: Colors.brown[700])),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                _logout(); // Call logout function
              },
              child: Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Function to handle Logout
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear stored user data

    // Navigate to Login Page and remove previous routes
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

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
      backgroundColor: Colors.brown[400],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.brown[50],
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Center(
                child: Text(
                  'Home Page',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.logout, color: Colors.brown[600]),
                  onPressed: _showLogoutDialog,
                  tooltip: 'Logout',
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.brown[400]!, Colors.brown[300]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
              top: 130,
              left: 25,
              child: _buildBox(
                  0,
                  Colors.brown[100]!,
                  Colors.brown[800]!,
                  BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0)))),
          Positioned(
              top: 190,
              right: 25,
              child: _buildBox(
                  1,
                  Colors.brown[200]!,
                  Colors.brown[600]!,
                  BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0)))),
          Positioned(
              top: 310,
              left: 25,
              child: _buildBox(
                  2,
                  Colors.brown[200]!,
                  Colors.brown[500]!,
                  BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0)))),
          Positioned(
              top: 370,
              right: 25,
              child: _buildBox(
                  3,
                  Colors.brown[100]!,
                  Colors.brown[800]!,
                  BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0)))),
        ],
      ),
    );
  }

  Widget _buildBox(
      int index, Color bgColor, Color accentColor, BorderRadius borderRadius) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddEditUserList()));
        } else if (index == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ViewUserList()));
        } else if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FevoriteListPage()));
        } else if (index == 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutUsPage()));
        }
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 6),
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons[index],
              size: 50,
              color: accentColor,
            ),
            SizedBox(height: 10),
            Text(
              iconName[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.brown[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
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
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

