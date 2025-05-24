import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';

class FirstLogoPage extends StatefulWidget {
  FirstLogoPage({super.key});

  @override
  State<FirstLogoPage> createState() => _SplashScreenDemoState();
}

class _SplashScreenDemoState extends State<FirstLogoPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(ListToPrint: [],)),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network('assets/images/logo2.png',
          height: 800,
          width: 700,
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
        Container(
          color: Colors.brown,
            child: Center(child: Text('Hello everyone!!',
              style: TextStyle(fontSize: 40, color: Colors.brown),),),
        ),
    );
  }
}

