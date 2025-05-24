import 'package:flt/project/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController useridcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find your Soulmate Here',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF6D4C41), // Coffee brown text
            fontWeight: FontWeight.bold,
          ),
        ),
        // centerTitle: true, // Center the title
        backgroundColor: Color(0xFFFFF3E0),
        elevation: 4,
        shadowColor: Colors.black26,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/matrimonial_bg.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color(0xFFFFF8E1).withOpacity(0.6),
                    // Cream overlay with reduced opacity
                    BlendMode.softLight, // Softer effect for the overlay
                  ),
                ),
              ),
            ),
          ),
          // Centered container with text
          Center(
            child: Container(
              height: 450,
              width: 350,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFFFFFFF).withOpacity(0.5),
                // Creamy white container
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 40,
                          color: Color(0xFF6D4C41),
                          // Coffee brown color for the title
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter User Name';
                        }
                        if (!RegExp(r"^[a-zA-Z\s'-]{3,50}").hasMatch(value)) {
                          return "Enter a valid user name";
                        }
                        return null;
                      },
                      controller: useridcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_add,
                          color: Color(0xFF8D6E63), // Subtle brown icon color
                        ),
                        labelText: 'User Name',
                        labelStyle: TextStyle(color: Color(0xFF8D6E63)),
                        hintText: 'Enter User Name',
                        hintStyle: TextStyle(color: Color(0xFFBCAAA4)),
                        // filled: true,
                        fillColor: Color(0xFFFFF3E0),
                        // Light cream field color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xFF8D6E63)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Color(0xFF6D4C41), width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Password';
                        }
                        if (!RegExp(
                                r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#\$%&*_]).{6,}$')
                            .hasMatch(value)) {
                          return "Invalid password!";
                        }
                        return null;
                      },
                      controller: passwordcontroller,
                      obscureText: isHide,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xFF8D6E63),
                        ),
                        labelText: 'User Password',
                        labelStyle: TextStyle(color: Color(0xFF8D6E63)),
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(color: Color(0xFFBCAAA4)),
                        // filled: true,
                        fillColor: Color(0xFFFFF3E0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xFF8D6E63)),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHide = !isHide;
                            });
                          },
                          icon: Icon(
                            !isHide ? Icons.visibility : Icons.visibility_off,
                            color: Color(0xFF8D6E63),
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Color(0xFF6D4C41), width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(ListToPrint: []),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6D4C41),
                        // Coffee brown button
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Rounded corners
                        ),
                        elevation: 5,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
