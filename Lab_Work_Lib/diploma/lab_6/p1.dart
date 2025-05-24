import 'package:flutter/material.dart';

class PasswordVisibilityDemo extends StatefulWidget {
  const PasswordVisibilityDemo({super.key});

  @override
  State<PasswordVisibilityDemo> createState() => _PasswordVisibilityDemoState();
}

class _PasswordVisibilityDemoState extends State<PasswordVisibilityDemo> {
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Password Visibility Demo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          controller: _passwordController,
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText; // toggle visibility
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
