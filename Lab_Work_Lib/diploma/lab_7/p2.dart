import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackDemo extends StatefulWidget {
  const StackDemo({super.key});

  @override
  State<StackDemo> createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack Demo'),),
      body: Stack(
        children: [
          Center(child: Image.asset('assets/images/flutter_app_logo.jpg')),
          Center(child: Text('Its Flutter Logo',style: TextStyle(fontSize: 40),)),
        ],
      ),
    );
  }
}
