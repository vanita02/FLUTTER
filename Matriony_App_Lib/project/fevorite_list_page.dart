import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_project/project/project_db.dart';
import 'package:matrimony_project/project/user_details_page.dart';
import 'add_edit_user.dart';
import 'crud.dart';

class FevoriteListPage extends StatefulWidget {
  CrudList _user = new CrudList();

  FevoriteListPage({super.key});

  @override
  State<FevoriteListPage> createState() => _FevoriteListPageState();
}

class _FevoriteListPageState extends State<FevoriteListPage> {
  List<Map<String, dynamic>> favoriteUsers = [];

  void fetchFavorites() async {
    try {
      List<Map<String, dynamic>> allUsers = await widget._user.getUserList();
      List<Map<String, dynamic>> favorites =
      allUsers.where((user) => user[ProjectDb.IS_FAVOURITE] == 1).toList();
      setState(() {
        favoriteUsers = favorites;
      });
    } catch (e) {
      print("Error in fetchFavorites: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      fetchFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      body: Stack(
        children: [
          Column(
            children: [
              CurvedAppBar(), // Curved AppBar widget
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: favoriteUsers.isEmpty
                        ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 350.0),
                        child: Text('No favorites found',
                            style: TextStyle(
                                color: Colors.white, fontSize: 15)),
                      ),
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: favoriteUsers.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.brown[100],
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  // child: Icon(Icons.person, color: Colors.brown[500]),
                                  child: Center(child: Text(favoriteUsers[index]['Name'][0],style: TextStyle(fontSize: 20,color: Colors.brown[500]),)),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${favoriteUsers[index]['Name']} | ${favoriteUsers[index]['Age']} yrs',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.brown[600],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.phone, color: Colors.brown[600], size: 16),
                                          SizedBox(width: 4),
                                          Text('${favoriteUsers[index]['PhoneNo']}',
                                              style: TextStyle(color: Colors.brown[600])),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                //fevorite
                                IconButton(
                                  icon: Icon(
                                    favoriteUsers[index][ProjectDb.IS_FAVOURITE] == 1
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.brown[600],
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.brown[800],
                                          title: Center(
                                            child: Text(
                                              'Remove',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          content: Text(
                                            'Are you sure you want to Remove?',
                                            style: TextStyle(color: Colors.white70),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                widget._user.deleteUser(favoriteUsers[index][ProjectDb.USER_ID]);
                                                Navigator.pop(context);
                                                fetchFavorites();
                                              },
                                              child: Text('Yes', style: TextStyle(color: Colors.redAccent)),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('No', style: TextStyle(color: Colors.redAccent)),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserDetailsPage(details: favoriteUsers[index],),
                                          ));
                                    },
                                    icon: Icon(
                                      Icons.info_outline,
                                      color: Colors.brown[600],
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[400],
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditUserList(),
              ));
          widget._user.fetchFavorites();
        },
        child: Icon(
          Icons.add,
          color: Color(0xFFFFF3E0),
        ),
      ),
    );
  }
}


class CurvedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            height: 180,
            width: double.infinity,
            color: Colors.brown[50],
          ),
        ),
        Positioned(
          top: 50,
          left: 10, // Adjusted position for back button
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.brown[800]),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'Favorite Users',
              style: TextStyle(
                color: Colors.brown[400],
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
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
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
