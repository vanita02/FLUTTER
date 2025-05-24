import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colordiff_2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LayOut'),),
      body: Row(
        children: [
          Expanded(child: Column(
            children: [
              Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)))),
              Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)))),
              Expanded(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)))),
              // Expanded(child: Container(color: Colors.blue,)),
              // Expanded(child: Container(color: Colors.yellow,))
            ],
          )
          ),
          Expanded(child: Column(
            children: [
              Expanded(flex: 2,child: Container(color: Colors.green,)),
              Expanded(flex: 2,child: Container(color: Colors.pink,)),
              Expanded(child: Container(color: Colors.brown,))
            ],
          )
          ),
          Expanded(child: Column(
            children: [
              Expanded(child: Container(color: Colors.grey,)),
              Expanded(flex: 2,child: Container(color: Colors.orange,)),
              Expanded(flex: 2,child: Container(color: Colors.purple,))
            ],
          )
          )
        ],
      ),
    );
  }

}