import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vartial_color extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LayOut'),
      ),
      body:Row(
        children: [
          Expanded(child: Container(color: Colors.blue,)),
          Expanded(child: Container(color: Colors.red,)),
          Expanded(child: Container(color: Colors.green,))
        ],
      ),
    );
  }

}