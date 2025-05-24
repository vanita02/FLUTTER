import 'package:flt/project/crud.dart';
import 'package:flt/project/user_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddEditUserList extends StatefulWidget {
  final Map<String, dynamic>? existingUser;
  final bool isEdit;
  final int? editIndex;
  final bool isShowPassword = false;

  AddEditUserList({this.existingUser, this.isEdit = false, this.editIndex});

  @override
  State<AddEditUserList> createState() => _LoginRegistrationPageState();
}

class _LoginRegistrationPageState extends State<AddEditUserList> {
  bool isPassword = false;
  List<Map<String, dynamic>> userList = [];
  List<String> countryCodes = ['+91', '+1', '+44', '+61'];
  List<String> cities = ['Ahmedabad', 'Rajkot', 'Dwarka', 'Vadodara'];
  String selectedCountryCode = '+91';
  List<String> selectedHobbies = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  String dob = 'Select DOB';
  DateTime? date = DateTime.now();
  String? selectedGender;
  String? selectedCity;
  int selectedYear = DateTime.now().year;
  DateTime? selectedDate;
  DateTime eighteenYearsAgo = DateTime.now().subtract(Duration(days: 18 * 365));

  final _formKey = GlobalKey<FormState>();

  bool isHide = true;

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.existingUser != null) {
  //     nameController.text = widget.existingUser!['Name'];
  //     emailController.text = widget.existingUser!['Email'];
  //     phoneController.text = widget.existingUser!['PhoneNo'];
  //     passwordController.text = widget.existingUser!['Password'];
  //     confirmPasswordController.text = widget.existingUser!['Confirm'];
  //     if (widget.existingUser!['BirthDate'] != null) {
  //       selectedDate = DateTime.parse(widget.existingUser!['BirthDate']);
  //       dobController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
  //     } else {
  //       selectedDate = null;
  //     }
  //
  //     selectedGender = widget.existingUser!['Gender'];
  //     selectedHobbies =
  //         List<String>.from(widget.existingUser!['Hobbies']);
  //     selectedCountryCode = widget.existingUser!['CountryCode'] ?? '+91';
  //   }
  // }
  @override
  void initState() {
    super.initState();

    if (widget.existingUser != null) {
      // print("🚀 DEBUG: editIndex = ${widget.editIndex}");
      // print("📢 DEBUG: Current userList = ${CrudList.userList}");

      nameController.text = widget.existingUser!['Name'];
      emailController.text = widget.existingUser!['Email'];
      phoneController.text = widget.existingUser!['PhoneNo'];
      passwordController.text = widget.existingUser!['Password'];
      confirmPasswordController.text = widget.existingUser!['Confirm'];


      if (widget.existingUser != null && widget.existingUser!['BirthDate'] != null) {
        selectedDate = DateTime.tryParse(widget.existingUser!['BirthDate']);
        if (selectedDate != null) {
          dobController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
        }
      }
      // Handle BirthDate
      // if (widget.existingUser!['BirthDate'] != null &&
      //     widget.existingUser!['BirthDate'].toString().isNotEmpty) {
      //   selectedDate = DateTime.tryParse(widget.existingUser!['BirthDate']);
      //   if (selectedDate != null) {
      //     dobController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
      //   }
      // }

      // Handle Gender
      selectedGender = widget.existingUser!['Gender'];

      // Handle Hobbies
      if (widget.existingUser!['Hobby'] is List) {
        selectedHobbies = List<String>.from(widget.existingUser!['Hobby']);
      } else if (widget.existingUser!['Hobby'] is String) {
        selectedHobbies = widget.existingUser!['Hobby']
            .split(',')
            .map((e) => e.trim())
            .toList();
      } else {
        selectedHobbies = [];
      }

      // Handle City
      selectedCity = widget.existingUser!['City'];
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFFF4EDE4),
          //  leading: IconButton(
          //   icon: Icon(Icons.arrow_back, color: Colors.brown),
          //   onPressed: () {
          //     Navigator.pop(context, CrudList.userList);
          //   },
          // ),

          title: Text(
            widget.isEdit ? 'Update' : 'Registration',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
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
                      Color(0xFFFFF8E1).withOpacity(0.8),
                      // Softer, more subtle overlay
                      BlendMode.softLight,
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Card(
                color: Color(0xFFFFF8E1).withOpacity(0.5),
                // Soft, inviting cream color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8,
                // Slightly more elevation for a floating effect
                child: Padding(
                  padding: EdgeInsets.all(25),
                  // Slightly more padding for balance
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name Field
                        Row(
                          children: [
                            Text('Name',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown)),
                            SizedBox(width: 30),
                            Expanded(
                              child: getTextFormFeild(
                                nameOfcontroller: nameController,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'Please Enter Name';
                                  if (!RegExp(r"^[a-zA-Z\s']{3,50}$")
                                      .hasMatch(value)) {
                                    return "Enter a valid full name (3-50 characters, alphabets only)";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),

                        // Email Field
                        Row(
                          children: [
                            Text('Email',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown)),
                            SizedBox(width: 30),
                            Expanded(
                              child: getTextFormFeild(
                                nameOfcontroller: emailController,
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'Please Enter Email';
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9._%+]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                      .hasMatch(value)) {
                                    return "Enter a valid email address";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),

                        // Mobile Field with Country Code
                        Row(
                          children: [
                            Text('Mobile',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown)),
                            SizedBox(width: 20),
                            Wrap(
                              children: [
                                DropdownButton<String>(
                                  value: selectedCountryCode,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCountryCode = newValue!;
                                    });
                                  },
                                  items: countryCodes
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: getTextFormFeild(
                                nameOfcontroller: phoneController,
                                maxLength: 10,
                                keybordtype: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'Please Enter Mobile Number';
                                  if (!RegExp(r"^\+?[0-9]{10}$")
                                      .hasMatch(value)) {
                                    return 'Enter a valid 10-digit mobile number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),

                        // DOB Picker
                        Row(
                          children: [
                            Text('DOB',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown)),
                            SizedBox(width: 30),
                            Expanded(
                              child: TextFormField(
                                controller: dobController,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Please Enter Your Birth Date';
                                  selectedDate = date;
                                  if (selectedDate == null)
                                    return 'Please Enter Your Birth Date';
                                  int age =
                                      DateTime.now().year - selectedDate!.year;
                                  if (DateTime.now().month <
                                          selectedDate!.month ||
                                      (DateTime.now().month ==
                                              selectedDate!.month &&
                                          DateTime.now().day <
                                              selectedDate!.day)) {
                                    age--;
                                  }
                                  if (age < 18)
                                    return 'You must be at least 18 years old to register.';
                                  return null;
                                },
                                readOnly: false,
                                onTap: () async {
                                  DateTime now = DateTime.now();
                                  DateTime eighteenYearsAgo = DateTime(now.year - 18, now.month, now.day);
                                  date = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate ?? eighteenYearsAgo,
                                    firstDate: DateTime(1900),
                                    lastDate: eighteenYearsAgo,
                                  );
                                  if (date != null) {
                                    dobController.text =
                                        DateFormat('dd/MM/yyyy').format(date!);
                                    setState(() {});
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Select your Date of Birth',
                                  prefixIcon: Icon(Icons.calendar_today),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),

                        // City Dropdown (Newly Added)
                        Row(
                          children: [
                            Text('City',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown)),
                            SizedBox(width: 30),
                            Expanded(
                              child: DropdownButton<String>(
                                value: selectedCity,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCity = newValue!;
                                  });
                                },
                                hint: Text("Select a city"),
                                items: cities.map<DropdownMenuItem<String>>(
                                    (String city) {
                                  return DropdownMenuItem<String>(
                                    value: city,
                                    child: Text(city),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        if (selectedCity == null)
                          Text(
                            "Please select your City",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),

                        // Gender Radio Buttons with validation
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gender',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown)),
                            SizedBox(width: 30),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Male',
                                      groupValue: selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGender = value;
                                        });
                                      },
                                    ),
                                    Text('Male'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Female',
                                      groupValue: selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGender = value;
                                        });
                                      },
                                    ),
                                    Text('Female'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Other',
                                      groupValue: selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGender = value;
                                        });
                                      },
                                    ),
                                    Text('Other'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        // Gender Validation
                        if (selectedGender == null)
                          Text(
                            "Please select your gender",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),

                        // Hobbies Checkbox with validation
                        Text('Select Hobbies',
                            style:
                                TextStyle(fontSize: 20, color: Colors.brown)),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckboxListTile(
                              value: selectedHobbies.contains('Reading'),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    selectedHobbies.add('Reading');
                                  } else {
                                    selectedHobbies.remove('Reading');
                                  }
                                });
                              },
                              title: Text('Reading'),
                            ),
                            CheckboxListTile(
                              value: selectedHobbies.contains('Music'),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    selectedHobbies.add('Music');
                                  } else {
                                    selectedHobbies.remove('Music');
                                  }
                                });
                              },
                              title: Text('Music'),
                            ),
                            CheckboxListTile(
                              value: selectedHobbies.contains('Dancing'),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    selectedHobbies.add('Dancing');
                                  } else {
                                    selectedHobbies.remove('Dancing');
                                  }
                                });
                              },
                              title: Text('Dancing'),
                            ),
                            CheckboxListTile(
                              value: selectedHobbies.contains('Other'),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    selectedHobbies.add('Other');
                                  } else {
                                    selectedHobbies.remove('Other');
                                  }
                                });
                              },
                              title: Text('Other'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Hobbies Validation
                        if (selectedHobbies.isEmpty)
                          Text(
                            "Please select at least one hobby",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),

                        // Password Field
                        Row(
                          children: [
                            Text('Password',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown)),
                            SizedBox(width: 30),
                            Expanded(
                              child: getTextFormFeild(
                                nameOfcontroller: passwordController,
                                maxLength: 16,
                                hinttext: "Enter your password",
                                isPassword: isHide,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isHide = !isHide;
                                    });
                                  },
                                  icon: Icon(
                                    !isHide
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Color(0xFF8D6E63),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Please enter your password';
                                  if (!RegExp(
                                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#\$%&*_]).{6,}$')
                                      .hasMatch(value)) {
                                    return "Invalid password!";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Confirm Password Field
                        Row(
                          children: [
                            Text('Confirm ',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown)),
                            SizedBox(width: 30),
                            Expanded(
                              child: getTextFormFeild(
                                nameOfcontroller: confirmPasswordController,
                                maxLength: 16,
                                hinttext: "Enter your password",
                                isPassword: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Please enter your password';
                                  if (!RegExp(
                                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#\$%&*_]).{6,}$')
                                      .hasMatch(value)) {
                                    return "Password must be at least 6 characters long";
                                  }
                                  if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    return "Password did not Match";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Submit/Update Button
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (selectedGender == null) {
                                  return; // Ensure gender is selected
                                }

                                if (selectedHobbies.isEmpty) {
                                  return; // Ensure at least one hobby is selected
                                }

                                Map<String, dynamic> map = {
                                  'Name': nameController.text,
                                  'Email': emailController.text,
                                  'PhoneNo': phoneController.text,
                                  'BirthDate': selectedDate?.toIso8601String(),
                                  'Age':
                                      DateTime.now().year - selectedDate!.year,
                                  'Gender': selectedGender,
                                  'Password': passwordController.text,
                                  'Hobby': selectedHobbies,
                                  'Confirm': confirmPasswordController.text,
                                  'City': selectedCity,
                                };

                                if (widget.isEdit) {
                                  CrudList.userList[widget.editIndex!] = map;
                                  Navigator.pop(context, map);
                                } else {
                                  // Adding a new user
                                  CrudList.userList.add(map);
                                  Navigator.pop(context, map);
                                }

                                print("Form submitted successfully!");
                                nameController.clear();
                                phoneController.clear();
                                emailController.clear();
                                passwordController.clear();
                                confirmPasswordController.clear();

                                setState(() {
                                  selectedGender = null;
                                  selectedHobbies = [];
                                  selectedDate = eighteenYearsAgo;
                                  selectedCity = null;
                                });

                                print(CrudList.userList);
                              }
                            },
                            child: Text(widget.isEdit ? 'Edit' : 'Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
    // );
  }

  Widget getTextFormFeild({
    required TextEditingController nameOfcontroller,
    String? hinttext,
    double radious = 8.0,
    String? Function(String?)? validator,
    bool isPassword = false,
    int? maxLength,
    TextInputType? keybordtype, // Change dynamic? to TextInputType?
    List<TextInputFormatter>? inputFormatters,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: nameOfcontroller,
      validator: validator,
      obscureText: isPassword,
      maxLength: maxLength,
      keyboardType: keybordtype,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hinttext,
        labelText: hinttext,
        suffixIcon: suffixIcon,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.zero),
        ),
      ),
    );
  }

  String? dobValidator(DateTime? selectedDate) {
    if (selectedDate == null) {
      return 'Please select your date of birth';
    }
    int age = DateTime.now().year - selectedDate.year;
    if (DateTime.now().month < selectedDate.month ||
        (DateTime.now().month == selectedDate.month &&
            DateTime.now().day < selectedDate.day)) {
      age--;
    }
    if (age < 18) {
      return 'You must be at least 18 years old to register.';
    }
    return null;
  }
}
