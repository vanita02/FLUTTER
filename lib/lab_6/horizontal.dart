import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Horizontal_color extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LayOut'),
      ),
      body:Column(
        children: [
          Expanded(child: Container(color: Colors.orange,)),
          Expanded(child: Container(color: Colors.white,)),
          Expanded(child: Container(color: Colors.green,))
        ],
      ),
    );
  }

}