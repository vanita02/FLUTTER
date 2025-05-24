import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vertical extends StatelessWidget {
  const Vertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vertical Division'),
      ),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.blue,)),
          Expanded(child: Container(color: Colors.pink,)),
          Expanded(child: Container(color: Colors.yellow,)),
        ],
      ),
    );
  }
}
