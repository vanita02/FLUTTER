import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDemo extends StatefulWidget {
  const ImageDemo({super.key});

  @override
  State<ImageDemo> createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Demo'),),
      body: Container(
        child: Center(child: Image.asset('assets/images/flutter_app_logo.jpg')),
      ),
    );
  }
}
