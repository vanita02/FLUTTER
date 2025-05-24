import 'package:flt/about_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NevigatorDemo extends StatefulWidget{
  @override
  State<NevigatorDemo> createState() => _NevigatorDemoState();
}

class _NevigatorDemoState extends State<NevigatorDemo> {
  var formkey = GlobalKey<FormState>();

  // GlobalKey<FormState> FormKey = GlobalKey();
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController phoneNo = TextEditingController();
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigator'),),
      body:flag? Stack(
        children: [
          Expanded(
            child: Container(

              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/hbd.png'),
                      fit: BoxFit.cover)
              ),
            ),
          ),
          Text(name.text)
        ],
      ) : Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  labelText: 'Enter Name',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please Enter Name!!';
                  }
                  if(!RegExp(r'^[a-z,A-Z]+$').hasMatch(value)){
                    return 'Alphabets only!!';
                  }
                },
                controller: name,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  labelText: 'Enter Email',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please Enter email!!';
                  }
                  if(!RegExp(r'^[a-z,0-9]{1,100}@gmail.com$').hasMatch(value)){
                    return 'Email is not Valid!!';
                  }
                },
                controller: email,
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your PhoneNumber',
                  labelText: 'Enter PhoneNumber',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please Enter phoneNumber!!';
                  }
                  if(!RegExp(r'^[0-9]{10}$').hasMatch(value)){
                    return 'Digits only!!';
                  }
                },
                controller: phoneNo,
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                if(formkey.currentState!.validate()){
                  print(email.text);
                  print(phoneNo.text);
                  setState(() {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>AboutPage(name:name)) );

                  });
                }

              }, child: Text('submit'))
            ],
          )),
    );
  }
}