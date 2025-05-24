import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthdayCardDemo extends StatefulWidget {
  const BirthdayCardDemo({super.key});

  @override
  State<BirthdayCardDemo> createState() => _BirthdayCardDemoState();
}

class _BirthdayCardDemoState extends State<BirthdayCardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text('Birthday Card'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/hbd.png',
                  height: 150,
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.cake, size: 100, color: Colors.pink),
                ),
                SizedBox(height: 20),
                Text(
                  '🎂 Happy Birthday! 🎉',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Wishing you a day filled with love, laughter,\nand lots of cake!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
