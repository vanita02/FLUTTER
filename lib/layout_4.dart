import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LayOut-4'),),
      body: Row(
        children: [
          //FIRST
          Expanded(child: Column(
            children: [
              Expanded(child: Column(
                children: [
                    Expanded(child: Container(color: Colors.brown,)),
                    Expanded(child: Container(color: Colors.white,)),
                    Expanded(child: Container(color: Colors.blueGrey,)),
                ],
              )),
              Expanded(child: Row(
                children: [
                  Expanded(child: Container(color: Colors.pink,)),
                  Expanded(child: Container(color: Colors.purple,)),
                  Expanded(child: Container(color: Colors.brown,)),
                ],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(child: Container(color: Colors.lightGreen,)),
                  Expanded(child: Container(color: Colors.black,)),
                  Expanded(child: Container(color: Colors.yellow,)),
                ],
              )),
            ],
          )),



          //SECOND
          Expanded(child: Column(
            children: [
              Expanded(child: Row(
                children: [
                  Expanded(flex: 2,child: Container(color: Colors.blue,)),
                  Expanded(child: Container(color: Colors.lightBlueAccent,)),
                  Expanded(flex: 2,child: Container(color: Colors.lightGreenAccent,)),
                ],
              )),
              Expanded(child: Row(
                children: [
                  Expanded(flex: 2,child: Container(color: Colors.brown,)),
                  Expanded(flex: 2,child: Container(color: Colors.lightGreen,)),
                  Expanded(flex: 3,child: Container(color: Colors.purple,)),
                  Expanded(child: Container(color: Colors.lightGreen,)),
                  Expanded(child: Container(color: Colors.blue,))
                ],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(flex: 2,child: Container(color: Colors.blueGrey,)),
                  Expanded(flex: 2,child: Container(color: Colors.lightBlueAccent,)),
                  Expanded(flex: 3,child: Container(color: Colors.purple,)),
                ],
              )),
              Expanded(child: Row(
                children: [
                  Expanded(flex: 3,child: Container(color: Colors.lightBlueAccent,)),
                  Expanded(flex: 2,child: Container(color: Colors.blue,)),
                  Expanded(flex: 2,child: Container(color: Colors.lightGreenAccent,)),
                ],
              )),
              Expanded(child: Row(
                children: [
                  Expanded(child: Container(color: Colors.purple,)),
                  Expanded(child: Container(color: Colors.green,)),
                  Expanded(child: Container(color: Colors.blue,)),
                ],
              ))
            ],
          ))
        ],
      ),
    );
  }

}