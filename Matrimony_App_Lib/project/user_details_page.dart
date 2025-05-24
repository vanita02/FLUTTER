import 'package:flutter/material.dart';
import 'package:matrimony_project/project/project_db.dart';
import 'add_edit_user.dart';
import 'crud.dart';

class UserDetailsPage extends StatefulWidget {
  final Map<String, dynamic> details;
  UserDetailsPage({required this.details});

  @override
  State<UserDetailsPage> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetailsPage> {
  CrudList _user = CrudList();

  void fetchData() async {
    await _user.getUserList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[300],
        appBar: CurvedAppBar(),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                backgroundColor: Colors.brown[100],
                radius: 55,
                child: Icon(Icons.account_circle, size: 110, color: Colors.brown[400]),
              ),
              SizedBox(height: 20),
              Card(
                color: Colors.brown[50],
                elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    widget.details[ProjectDb.NAME],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[500],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.details.length,
                  itemBuilder: (context, index) {
                    String key = widget.details.keys.elementAt(index);
                    String value = widget.details[key].toString();
                    return Card(
                      color: Colors.brown[10],
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      child: ListTile(
                        leading: Icon(Icons.info, color: Colors.brown[700]),
                        title: Text(
                          key.replaceAll('_', ' '),
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.brown[700]),
                        ),
                        subtitle: Text(
                          value,
                          style: TextStyle(fontSize: 14, color: Colors.brown[600]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var updatedUser = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditUserList(userDetail: widget.details),
              ),
            );
            if (updatedUser != null) {
              setState(() {
                widget.details.addAll(updatedUser);
              });
            }
          },
          backgroundColor: Colors.brown[300],
          child: Icon(Icons.edit, color: Colors.white),
        ),
      ),
    );
  }
}

class CurvedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarClipper(),
      child: AppBar(
        automaticallyImplyLeading: true, // ✅ Enables back button automatically
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.brown[700],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[50],
        elevation: 4,
        shadowColor: Colors.brown[600],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
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
  bool shouldReclip(AppBarClipper oldClipper) => false;
}
