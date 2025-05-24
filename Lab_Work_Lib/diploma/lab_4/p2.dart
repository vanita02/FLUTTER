import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Horizontal extends StatelessWidget {
  const Horizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal Division'),
      ),
      body: Row(
        children: [
          Expanded(child: Container(color: Colors.blue,)),
          Expanded(child: Container(color: Colors.pink,)),
          Expanded(child: Container(color: Colors.yellow,)),
        ],
      ),
    );
  }
}
