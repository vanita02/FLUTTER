import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colordiff extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LayOut'),
      ),
      body: Row(
        children: [
          Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.blue,)),
                  Expanded(child: Container(color: Colors.red,)),
                  Expanded(child: Container(color: Colors.yellow,))
                ],
              )
          ),
          Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.black,)),
                  Expanded(child: Container(color: Colors.orange,)),
                  Expanded(child: Container(color: Colors.green,))
                ],
              )
          ),
          Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.grey,)),
                  Expanded(child: Container(color: Colors.pink,)),
                  Expanded(child: Container(color: Colors.brown,))
                ],
              )
          )
        ],
      ),
    );
  }
}