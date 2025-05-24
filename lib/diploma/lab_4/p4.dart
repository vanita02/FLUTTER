import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EqueleParts extends StatelessWidget {
  const EqueleParts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EqueleParts Division'),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Container(color: Colors.blue,)),
              Expanded(child: Container(color: Colors.pink,)),
              Expanded(child: Container(color: Colors.yellow,)),
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(color: Colors.black,)),
              Expanded(child: Container(color: Colors.red,)),
              Expanded(child: Container(color: Colors.grey,)),
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(color: Colors.green,)),
              Expanded(child: Container(color: Colors.orange,)),
              Expanded(child: Container(color: Colors.purple,)),
            ],
          )),
        ],
      ),
    );
  }
}
