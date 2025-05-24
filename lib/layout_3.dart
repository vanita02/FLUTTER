import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout3 extends StatelessWidget{
  @override
  Widget build( context) {
   return Scaffold(
     appBar: AppBar(title: Text('LayOut-3'),),
     body: Column(
       children: [
         //FIRST
         Expanded(child:Row(
           children: [
             Expanded(flex: 3,child:  Container(color: Colors.brown,)),
             Expanded(child:  Container(color: Colors.lightBlueAccent,))
           ],
         )),



         //SECOND
         Expanded(flex: 2,child:Row(
           children: [
             Expanded(child:  Container(color: Colors.yellow,)),
             Expanded(child:Row(
               children: [
                 Expanded(child: Column(
                   children: [
                     Expanded(child: Container(color: Colors.lightBlueAccent,)),
                     Expanded(child: Container(color: Colors.purple,))
                   ],
                 )),
                 Expanded(child: Column(
                   children: [
                     Expanded(child: Container(color: Colors.blueAccent,)),
                     Expanded(child: Container(color: Colors.green,))
                   ],
                 )),
               ],
             )),
             Expanded(child:  Container(color: Colors.pink,))
           ],
         )),



         //3RD
         Expanded(flex: 2,child:Row(
           children: [
             Expanded(child:  Container(color: Colors.black,)),
             Expanded(child:  Container(color: Colors.white,)),
             Expanded(child:  Container(color: Colors.black,)),
             Expanded(child:  Container(color: Colors.white,))
           ],
         )),



         //4TH
         Expanded(child: Row(
           children: [
             Expanded(child: Column(
               children: [
                 Expanded(child: Row(
                   children: [
                     Expanded(child: Container(color: Colors.blueGrey,)),
                     Expanded(child: Column(
                       children: [
                         Expanded(child: Row(
                           children: [
                             Expanded(child: Container(color: Colors.yellow,)),
                             Expanded(child: Container(color: Colors.purple,))
                           ],
                         )),
                         Expanded(child: Row(
                           children: [
                             Expanded(child: Container(color: Colors.lightGreen,)),
                             Expanded(child: Container(color: Colors.white,))
                           ],
                         )),
                       ],
                     ))
                   ],
                 )),
                 Expanded(child: Row(
                   children: [
                     Expanded(child: Container(color: Colors.purple,)),
                     Expanded(child: Container(color: Colors.brown,))
                   ],
                 )),
               ],
             )),
             Expanded(child: Container(color: Colors.lightGreen)),
             Expanded(child: Column(
               children: [
                 Expanded(child: Row(
                   children: [
                     Expanded(child: Container(color: Colors.blueGrey,)),
                     Expanded(child: Column(
                       children: [
                         Expanded(child: Row(
                           children: [
                             Expanded(child: Container(color: Colors.yellow,)),
                             Expanded(child: Container(color: Colors.purple,))
                           ],
                         )),
                         Expanded(child: Row(
                           children: [
                             Expanded(child: Container(color: Colors.lightGreen,)),
                             Expanded(child: Container(color: Colors.white,))
                           ],
                         )),
                       ],
                     ))
                   ],
                 )),
                 Expanded(child: Row(
                   children: [
                     Expanded(child: Container(color: Colors.purple,)),
                     Expanded(child: Container(color: Colors.brown,))
                   ],
                 )),
               ],
             ))
           ],
         ))
       ],
     ),
   );
  }

}