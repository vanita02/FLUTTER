import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewListView extends StatefulWidget {
  const GridViewListView({super.key});

  @override
  State<GridViewListView> createState() => _GridViewListViewState();
}

class _GridViewListViewState extends State<GridViewListView> {
  List<String> list = ['A', 'B', 'C', 'D'];
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(isGrid ? ('Grid View Demo') : ('List View Demo')),
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  isGrid = false;
                });
              },
              child: Icon(CupertinoIcons.list_bullet),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isGrid = true;
                });
              },
              child: Icon(Icons.grid_view_outlined),
            ),
          ],
        ),
        body: isGrid
            ? GridView.builder(
                itemCount: list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.pink,
                      height: 100,
                      width: 100,
                    ),
                  );
                },
              )
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.pink,
                      height: 100,
                      width: 100,
                    ),
                  );
                },
              ));
  }
}
