import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreenDemo extends StatefulWidget {
   SplashScreenDemo({super.key});

  @override
  State<SplashScreenDemo> createState() => _SplashScreenDemoState();
}

class _SplashScreenDemoState extends State<SplashScreenDemo> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => HomeScreen()),  
      );
    });
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network('https://static.vecteezy.com/system/resources/previews/019/166/318/non_2x/lion-head-lion-logo-symbol-gaming-logo-elegant-element-for-brand-abstract-symbols-vector.jpg',
        height: 100, 
        width: 200,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Splash_Screen_Demo'),),
      body: 
      Center(child: Text('Hello everyone!!',style: TextStyle(fontSize: 40,color: Colors.pink),),),
    );
  }
}

