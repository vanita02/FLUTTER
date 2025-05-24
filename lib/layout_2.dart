import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LayOut-2'),),
      body: Column(
        children: [
          //FIRST
          Expanded(child: Row(
            children: [
              Expanded(child: Container(color: Colors.greenAccent,)),
              Expanded(child:Column(
                children: [
                  Expanded(child:Row(
                    children: [
                      Expanded(child:  Container(color: Colors.blueGrey,)),
                      Expanded(child:  Container(color: Colors.deepPurpleAccent,)),
                    ],
                  )),
                  Expanded(child:Row(
                    children: [
                      Expanded(child:  Container(color: Colors.purple,)),
                      Expanded(child:  Container(color: Colors.red,)),
                    ],
                  )),
                ],
              ))
            ],
          )),

          //SECOND
          Expanded(child:Row(
            children: [
              Expanded(child: Container(color: Colors.white,)),
              Expanded(child:Row(
                children: [
                  Expanded(child:Column(
                    children: [
                      Expanded(child:  Container(color: Colors.green,)),
                      Expanded(flex: 2,child:  Container(color: Colors.pink,)),
                      Expanded(child:  Container(color: Colors.blueGrey,))
                    ],
                  )),
                  Expanded(child:Column(
                    children: [
                      Expanded(child:  Container(color: Colors.yellow,)),
                      Expanded(child:  Container(color: Colors.brown,)),
                      Expanded(child:  Container(color: Colors.orange,))
                    ],
                  )),
                  Expanded(child:Column(
                    children: [
                      Expanded(flex: 2,child:  Container(color: Colors.green,)),
                      Expanded(child:  Container(color: Colors.purple,)),
                      Expanded(flex: 2,child:  Container(color: Colors.blueGrey,))
                    ],
                  )),
                ],
              )),
              Expanded(child: Container(color: Colors.yellow,)),
            ],
          )),

          //3RD
          Expanded(child:Row(
            children: [
              Expanded(child: Container(color: Colors.brown,)),
              Expanded(child: Container(color: Colors.green,)),
              Expanded(child: Container(color: Colors.purple,))
            ],
          ))
        ],
      ),
    );
  }

}