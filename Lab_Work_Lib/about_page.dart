import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
   var name;
   AboutPage({super.key,required this.name});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/hbd.png'),
                    fit: BoxFit.cover)
            ),
          ),
        ),
        Text(name.text),
        Positioned(
          top: 400,
          left: 500,
          child: ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Home Page'),),
        )
      ],
    );
  }
}
