import 'package:flutter/material.dart';
import 'home_page.dart'; // Import your HomePage

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      _showWelcomeSheet();
    });
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(ListToPrint: [])),
      );
    });
  }
  void _showWelcomeSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return Container(
          height: 200,
          child: Stack(
            children: [
              ClipPath(
                clipper: WavyClipper(), // Custom wavy clipper
                child: Container(
                  height: 100,
                  color: Colors.brown[300],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[700],
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Find your soulmate here!',
                      style: TextStyle(fontSize: 20, color: Colors.brown[500]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }





  @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(seconds: 3), () {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomePage(ListToPrint: [])),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 120), // Change 'logo.png' to your actual logo path
            SizedBox(height: 20),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[700]),
            ),
          ],
        ),
      ),
    );
  }
}


class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.5, size.height - 30);
    path.quadraticBezierTo(size.width * 0.75, size.height - 60, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

