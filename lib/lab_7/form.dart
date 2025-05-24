import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  // GlobalKey<FormState> FormKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Email Form'),),
      body: Form(
          key: formkey,
          child: Column(
        children: [
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
              if(value.length != 10){
                return 'Enter Valid PhoneNumber!!';
              }
            },
            controller: phoneNo,
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            if(formkey.currentState!.validate()){
              print(email.text);
              print(phoneNo.text);
            }
          }, child: Text('submit'))
        ],
      )),
    );
  }

}
// obscure