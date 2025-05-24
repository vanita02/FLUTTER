import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFeild Demo'),
      ),
      body: Material(
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {
              print(name.text);
            }, child: Text('display'))
          ],
        ),
      ),
    );
  }
}
