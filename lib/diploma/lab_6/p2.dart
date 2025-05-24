import 'package:flutter/material.dart';

class RegistrationScreenDemo extends StatefulWidget {
  @override
  _RegistrationScreenDemoState createState() => _RegistrationScreenDemoState();
}

class _RegistrationScreenDemoState extends State<RegistrationScreenDemo> {
  final _formKey = GlobalKey<FormState>();
  String _gender = "Male";
  bool _agree = false;
  String _selectedCountry = "India";

  final List<String> _countries = ["India", "USA", "UK", "Canada", "Australia"];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration Form')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('Register', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

              SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Enter your email' : null,
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: (value) => value!.length < 6 ? 'Password must be at least 6 characters' : null,
              ),

              SizedBox(height: 20),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: _obscureConfirm,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                  ),
                ),
                validator: (value) =>
                value != passwordController.text ? 'Passwords do not match' : null,
              ),

              SizedBox(height: 20),
              Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
              ListTile(
                title: Text("Male"),
                leading: Radio(
                  value: "Male",
                  groupValue: _gender,
                  onChanged: (value) => setState(() => _gender = value!),
                ),
              ),
              ListTile(
                title: Text("Female"),
                leading: Radio(
                  value: "Female",
                  groupValue: _gender,
                  onChanged: (value) => setState(() => _gender = value!),
                ),
              ),

              SizedBox(height: 20),
              Text("Country", style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: _selectedCountry,
                items: _countries.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedCountry = value!),
              ),

              SizedBox(height: 20),
              CheckboxListTile(
                value: _agree,
                onChanged: (value) => setState(() => _agree = value!),
                title: Text("I agree to the Terms and Conditions"),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _agree) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Registration Successful for ${nameController.text}'),
                    ));
                  } else if (!_agree) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('You must agree to the terms and conditions.'),
                    ));
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
