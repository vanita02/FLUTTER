import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'layout_1.dart';
import 'layout_2.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List<String> listDemo = ['Vanita', 'Disha', 'Khushi', 'Dharvi', 'Jagruti'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List_View_Demo'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(CupertinoIcons.home),
              title: Text('Home'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Layout1()));
              },
              leading: Icon(Icons.accessibility_new_sharp),
              title: Text('About'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Layout2()));
              },
              leading: Icon(Icons.ac_unit),
              title: Text('Contact us'),
            )
          ],
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listDemo.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  listDemo[index],
                  style: TextStyle(color: Colors.blue, fontSize: 30),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
