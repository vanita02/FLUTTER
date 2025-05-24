import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  import 'package:intl/intl.dart';

class DateFormate_SingleChileScrollView extends StatefulWidget {
  const DateFormate_SingleChileScrollView({super.key});

  @override
  State<DateFormate_SingleChileScrollView> createState() => _DateFormate_SingleChileScrollViewState();
}

class _DateFormate_SingleChileScrollViewState extends State<DateFormate_SingleChileScrollView> {
  var current = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DateFromate'),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all()
                ),
                child: Center(child: Text(DateFormat('dd/MM/yyyy  ').format(current),style: TextStyle(fontSize: 30),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all()
                ),
                child: Center(child: Text(DateFormat('dd-MM-yyyy ').format(current),style: TextStyle(fontSize: 30),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all()
                ),
                child: Center(child: Text(DateFormat('dd-MMM-yyyy').format(current),style: TextStyle(fontSize: 30),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all()
                ),
                child: Center(child: Text(DateFormat('dd-MM-yy ').format(current),style: TextStyle(fontSize: 30),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all()
                ),
                child: Center(child: Text(DateFormat('dd MMM, yyyy ').format(current),style: TextStyle(fontSize: 30),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
