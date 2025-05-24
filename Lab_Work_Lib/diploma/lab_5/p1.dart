import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({super.key});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Widget Demo'),),
      body: Center(
        child: Text('Hello world',style: TextStyle(color: Colors.red,fontSize: 20),),
      ),
    );
  }
}
