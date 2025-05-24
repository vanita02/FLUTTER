import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appbar is here"),
      ),
      body: Text("body is here",style: TextStyle(fontSize: 70.2,color: Colors.blue),),
        backgroundColor:Colors.yellow
    );
  }
}
