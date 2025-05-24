import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_project/project/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:matrimony_project/project/home_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordHidden = true;

  // Save user details
  Future<void> saveUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullNameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text("Register", style: TextStyle(color: Colors.brown[400])),
        backgroundColor: Colors.brown[50],
        centerTitle: true,
        elevation: 4,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/app.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.brown[50]!.withOpacity(0.1),
                    BlendMode.softLight,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                height: 600,
                width: 350,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFFFFF8E1).withOpacity(0.4),
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
                          'Register',
                          style: TextStyle(
                            fontSize: 40,
                            color: Color(0xFF6D4C41),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildTextField(
                        controller: fullNameController,
                        label: "Full Name",
                        icon: Icons.person,
                        validator: (value) {
                          if (value!.isEmpty) return "Enter your full name";
                          if (value.length < 6) return "Enter at least 6 characters";
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      _buildTextField(
                        controller: emailController,
                        label: "Email",
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      _buildTextField(
                        controller: passwordController,
                        label: "Password",
                        icon: Icons.lock,
                        isPassword: true,
                        validator: (value) {
                          if (value!.isEmpty) return "Enter password";
                          if (value.length < 6) return "Enter at least 6 characters";
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      _buildTextField(
                        controller: confirmPasswordController,
                        label: "Confirm Password",
                        icon: Icons.lock,
                        isPassword: true,
                        validator: (value) {
                          if (value!.isEmpty) return "Enter confirm password";
                          if (value != passwordController.text) return "Passwords do not match";
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await saveUserData();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Registration Successful!")),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6D4C41),
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 6,
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? isPasswordHidden : false,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xFF795548)),
        labelText: label,
        labelStyle: TextStyle(color: Color(0xFF6D4C41), fontWeight: FontWeight.w600),
        filled: true,
        fillColor: Color(0xFFFFF8E1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xFF8D6E63)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xFF5D4037), width: 2),
        ),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(isPasswordHidden ? Icons.visibility_off : Icons.visibility,
              color: Color(0xFF795548)),
          onPressed: () {
            setState(() {
              isPasswordHidden = !isPasswordHidden;
            });
          },
        )
            : null,
      ),
    );
  }
}
