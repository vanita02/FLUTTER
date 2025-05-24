import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBardemo extends StatelessWidget {
  TabBardemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab-Bar'),
          bottom: TabBar(tabs: [
            Tab(
              text: 'Tab1',
              child: Column(children: [],),
            ),
            Tab(
              text: 'Tab2',
            ),
            Tab(
              text: 'Tab3',
            )
          ]),
        ),
        body: TabBarView(children: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Demo-1',style: TextStyle(color: Colors.green),),
                      content: Text('demo-1',style: TextStyle(color: Colors.pink),),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(CupertinoIcons.back))
                      ],
                      backgroundColor: Colors.black,
                    );
                  },
                );
              },
              child: Text('Tab_Demo-1',style: TextStyle(color: Colors.blue),)),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Demo-2',style: TextStyle(color: Colors.green),),
                      content: Text('demo-2',style: TextStyle(color: Colors.pink),),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(CupertinoIcons.back))
                      ],
                      backgroundColor: Colors.black,
                    );
                  },
                );
              },
              child: Text('Tab_Demo-2',style: TextStyle(color: Colors.blue),)),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Demo-3',style: TextStyle(color: Colors.green),),
                      content: Text('demo-3',style: TextStyle(color: Colors.pink),),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(CupertinoIcons.back))
                      ],
                      backgroundColor: Colors.black,
                    );
                  },
                );
              },
              child: Text('Tab_Demo-3',style: TextStyle(color: Colors.blue),))
        ]),
      ),
    );
  }
}
