import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'registration_page.dart';

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
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Check if user is already logged in
  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(ListToPrint: []),
        ),
      );
    }
  }

  // Save login details
  Future<void> _saveLogin(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
    await prefs.setString("username", username);
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }


  // Login button action
  void _login() {
    if (_formKey.currentState!.validate()) {
      _saveLogin(useridcontroller.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(ListToPrint: []),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Find your Soulmate Here',
            style: TextStyle(
              fontSize: 20,
              color: Colors.brown[400], // Coffee brown text
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.brown[50],
        elevation: 4,
        shadowColor: Colors.black26,
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
                    Colors.brown.withOpacity(0.6),
                    BlendMode.softLight,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                height: 500,
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
                          'Login',
                          style: TextStyle(
                            fontSize: 40,
                            color: Color(0xFF6D4C41),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: useridcontroller,
                        validator: (value) {
                          if (value!.isEmpty) return 'Please Enter User Name';
                          if (!RegExp(r"^[a-zA-Z\s'-]{3,50}$").hasMatch(value)) {
                            return "Enter a valid user name";
                          }
                          return null;
                        },
                        decoration: _inputDecoration(Icons.person, "User Name", "Enter User Name"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: passwordcontroller,
                        obscureText: isHide,
                        validator: (value) {
                          if (value!.isEmpty) return 'Please Enter Password';
                          if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#\$%&*_]).{6,}$')
                              .hasMatch(value)) {
                            return "Invalid password!";
                          }
                          return null;
                        },
                        decoration: _inputDecoration(Icons.lock, "User Password", "Enter Password").copyWith(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isHide = !isHide;
                              });
                            },
                            icon: Icon(
                              isHide ? Icons.visibility_off : Icons.visibility,
                              color: Color(0xFF795548),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6D4C41),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 6,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Don't have an account? Register here",
                          style: TextStyle(
                            color: Colors.brown[700],
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

  InputDecoration _inputDecoration(IconData icon, String label, String hint) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Color(0xFF795548)),
      labelText: label,
      labelStyle: TextStyle(color: Color(0xFF6D4C41), fontWeight: FontWeight.w600),
      hintText: hint,
      hintStyle: TextStyle(color: Color(0xFFBCAAA4)),
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
    );
  }
}
