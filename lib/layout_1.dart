import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LayOut-1'),),
      body: Column(
        children: [
          Expanded(child:Container(color: Colors.blue,)),
          Expanded(child:Row(
            children: [
              Expanded(flex: 2,child: Container(color: Colors.pink,)),
              Expanded(child:Column(
                children: [
                  Expanded(child: Container(color: Colors.red,)),
                  Expanded(child: Container(color: Colors.green,))
                ],
              ))
            ],
          )),
          Expanded(child:Row(
            children: [
              Expanded(child: Container(color: Colors.orange,)),
              Expanded(child: Container(color: Colors.grey,)),
              Expanded(child: Container(color: Colors.brown,))
            ],
          ))
        ],
      ),
    );
  }

}