import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:matrimony_project/project/project_api.dart';
import 'package:matrimony_project/project/project_db.dart';
import 'crud.dart';

class AddEditUserList extends StatefulWidget {
  CrudList _user = new CrudList();
  ProjectApi _api = new ProjectApi();

  Map<String, dynamic>? userDetail;
  final Map<String, dynamic>? existingUser;
  bool isEdit;
  final int? editIndex;
  final bool isShowPassword = false;
   // AddEditUserList({Key? key, this.userDetail}) : super(key: key);
  AddEditUserList(
      {Key? key,
        this.existingUser,
      this.isEdit = false,
      this.editIndex,
      this.userDetail}) : super(key: key);

  @override
  State<AddEditUserList> createState() => _LoginRegistrationPageState();
}

class _LoginRegistrationPageState extends State<AddEditUserList> {
  ProjectDb myDatabase = ProjectDb();

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

  Future<void> fetchUsersAndUpdateUI() async {
    await widget._user.getUserList();
    setState(() {});// Forces UI update
  }

  @override
  // void initState() {
  //   super.initState();
  //   fetchUsersAndUpdateUI();
  //   if (widget.userDetail != null) {
  //     print("🚀 DEBUG: Editing user data -> ${widget.userDetail}");
  //
  //     nameController.text = widget.userDetail![ProjectDb.NAME];
  //     emailController.text = widget.userDetail![ProjectDb.EMAIL];
  //     phoneController.text = widget.userDetail![ProjectDb.PHONE_NO];
  //     passwordController.text = widget.userDetail![ProjectDb.PASSWORD];
  //     confirmPasswordController.text = widget.userDetail![ProjectDb.CONFIRM_PASSWORD];
  //
  //     if (widget.userDetail != null &&
  //         widget.userDetail![ProjectDb.DOB] != null) {
  //       // selectedDate = DateTime.tryParse(widget.userDetail![ProjectDb.DOB]);
  //       String dobString = widget.userDetail![ProjectDb.DOB];
  //       selectedDate = DateTime.parse(dobString);
  //       if (selectedDate != null) {
  //         dobController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
  //       }
  //     }
  //     // Handle BirthDate
  //     // if (widget.existingUser!['BirthDate'] != null &&
  //     //     widget.existingUser!['BirthDate'].toString().isNotEmpty) {
  //     //   selectedDate = DateTime.tryParse(widget.existingUser!['BirthDate']);
  //     //   if (selectedDate != null) {
  //     //     dobController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
  //     //   }
  //     // }
  //
  //     // Handle Gender
  //     selectedGender = widget.userDetail![ProjectDb.GENDER];
  //
  //     // Handle Hobbies
  //     if (widget.userDetail![ProjectDb.HOBBIES] is List) {
  //       selectedHobbies = List<String>.from(widget.userDetail![ProjectDb.HOBBIES]);
  //     }
  //     else if (widget.userDetail![ProjectDb.HOBBIES] is String) {
  //       selectedHobbies = widget.userDetail![ProjectDb.HOBBIES]
  //           .split(',')
  //           .map((e) => e.trim())
  //           .toList();
  //     } else {
  //       selectedHobbies = [];
  //     }
  //
  //     // Handle City
  //     selectedCity = widget.userDetail![ProjectDb.CITY];
  //   }
  // }

  @override
  void initState() {
    super.initState();
    fetchUsersAndUpdateUI(); // Ensure user list is up-to-date
    ProjectDb().testDatabase();

    print("🛠 Editing User: ${widget.userDetail}");

    if (widget.userDetail != null && widget.userDetail!.isNotEmpty) {
      // Assign values to controllers
      nameController.text = widget.userDetail?[ProjectDb.NAME] ?? '';
      emailController.text = widget.userDetail?[ProjectDb.EMAIL] ?? '';
      phoneController.text = widget.userDetail?[ProjectDb.PHONE_NO]?.toString() ?? '';
      passwordController.text = widget.userDetail?[ProjectDb.PASSWORD] ?? '';
      confirmPasswordController.text = widget.userDetail?[ProjectDb.CONFIRM_PASSWORD] ?? '';

      // Assign dropdown values properly
      selectedCity = widget.userDetail?[ProjectDb.CITY] ?? '';
      selectedGender = widget.userDetail?[ProjectDb.GENDER] ?? '';

      print("🔹 Selected City: $selectedCity");
      print("🔹 Selected Gender: $selectedGender");

      // Ensure Age is correctly parsed
      // selectedAge = widget.userDetail?[ProjectDb.AGE]?.toString() ?? '0';

      // 🛠 Fixing DOB Handling
      var dobValue = widget.userDetail?[ProjectDb.DOB];
      if (dobValue != null) {
        if (dobValue is String && dobValue.isNotEmpty) {
          // Handle string DOB properly
          selectedDate = DateTime.tryParse(dobValue);
        } else if (dobValue is int) {
          // Handle incorrect integer DOB format
          selectedDate = DateTime.fromMillisecondsSinceEpoch(dobValue * 1000);
        }

        if (selectedDate != null) {
          dobController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
        } else {
          dobController.text = ''; // Fallback if parsing fails
        }
      }

      // 🛠 Fixing Hobbies Handling
      final dynamic hobbiesData = widget.userDetail?[ProjectDb.HOBBIES];
      if (hobbiesData is String) {
        selectedHobbies = hobbiesData.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
      } else if (hobbiesData is List) {
        selectedHobbies = List<String>.from(hobbiesData);
      } else {
        selectedHobbies = [];
      }

      print("✅ Processed Hobbies: $selectedHobbies");

      // Update UI
      if (mounted) {
        setState(() {});
      }
    } else {
      print("⚠️ User detail is NULL or EMPTY!");
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[400],
        // appBar: AppBar(
        //   toolbarHeight: 70,
        //   backgroundColor: Colors.brown[50],
        //   //  leading: IconButton(
        //   //   icon: Icon(Icons.arrow_back, color: Colors.brown),
        //   //   onPressed: () {
        //   //     Navigator.pop(context, CrudList.userList);
        //   //   },
        //   // ),
        //
        //   title: Center(
        //     child: Text(
        //       widget.isEdit ? 'Update' : 'Registration',
        //       style: TextStyle(
        //           fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown[400]),
        //     ),
        //   ),
        // ),
        appBar: CurvedAppBar(),
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.brown[400]!, Colors.brown[300]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name Field
                          Row(
                            children: [
                              // Text('Name :',
                              //     style: TextStyle(
                              //         fontSize: 20, color: Colors.white)),
                              // SizedBox(width: 30),
                              Expanded(
                                child: getTextFormFeild(
                                  nameOfcontroller: nameController,
                                  hintIcon: Icons.person,
                                  hinttext: "Enter your Name",
                                  labletext: "Enter your Name",
                                  keybordtype: TextInputType.text,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^[a-zA-Z]+$')),
                                  ],
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
                              // Text('Email :',
                              //     style: TextStyle(
                              //         fontSize: 20, color: Colors.white)),
                              // SizedBox(width: 30),
                              Expanded(
                                child: getTextFormFeild(
                                  nameOfcontroller: emailController,
                                  hintIcon: Icons.email,
                                  hinttext: "Enter your Email",
                                  labletext: "Enter your Email",
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
                              // Text('Mobile :',
                              //     style: TextStyle(
                              //         fontSize: 20, color: Colors.white)),
                              // SizedBox(width: 20),
                              // Wrap(
                              //   children: [
                              //     DropdownButton<String>(
                              //       value: selectedCountryCode,
                              //       onChanged: (String? newValue) {
                              //         setState(() {
                              //           selectedCountryCode = newValue!;
                              //         });
                              //       },
                              //       items: countryCodes
                              //           .map<DropdownMenuItem<String>>(
                              //               (String value) {
                              //             return DropdownMenuItem<String>(
                              //                 value: value, child: Text(value,style: TextStyle(color: Colors.white),));
                              //           }).toList(),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(width: 10),
                              Expanded(
                                child: getTextFormFeild(
                                  nameOfcontroller: phoneController,
                                  maxLength: 10,
                                  hintIcon: Icons.phone,
                                  phoneCodeItems: countryCodes,
                                  selectedPhoneCode: selectedCountryCode,
                                  onPhoneCodeChanged: (newValue) {
                                    setState(() {
                                      selectedCountryCode = newValue!;
                                    });
                                  },
                                  hinttext: "Enter your Phone No",
                                  labletext: "Enter your Phone No",
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
                          // DOB Picker
                          Row(
                            children: [
                              // Text('DOB :',
                              //     style: TextStyle(
                              //         fontSize: 20, color: Colors.white)),
                              // SizedBox(width: 30),
                              Expanded(
                                child: getTextFormFeild(
                                  nameOfcontroller: dobController,
                                  hinttext: 'Select your Date of Birth',
                                  labletext: 'Select your Date of Birth',
                                  hintIcon: Icons.calendar_month,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Please Enter Your Birth Date';
                                    if (!RegExp(
                                            r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$')
                                        .hasMatch(value)) {
                                      return 'Enter a valid date (DD/MM/YYYY)';
                                    }
                                    selectedDate =
                                        DateFormat('dd/MM/yyyy').parse(value);
                                    if (selectedDate == null)
                                      return 'Please Enter Your Birth Date';
                                    int age = DateTime.now().year -
                                        selectedDate!.year;
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
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime now = DateTime.now();
                                    DateTime eighteenYearsAgo = DateTime(
                                        now.year - 18, now.month, now.day);
                                    date = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          selectedDate ?? eighteenYearsAgo,
                                      firstDate: DateTime(1900),
                                      lastDate: eighteenYearsAgo,
                                    );
                                    if (date != null) {
                                      setState(() {
                                        dobController.text =
                                            DateFormat('dd/MM/yyyy')
                                                .format(date!);
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),

                          // City Dropdown (Newly Added)
                          Row(
                            children: [
                              Expanded(
                                child: getTextFormFeild(
                                  maxLength: 10,
                                  hinttext: "Select Your City",
                                  labletext: "Select Your City",
                                  hintIcon: Icons.location_city,
                                  dropdownItems: cities.toSet().toList(),
                                  // Remove duplicates
                                  selectedValue: cities.contains(selectedCity)
                                      ? selectedCity
                                      : null,
                                  // Ensure value exists
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedCity = newValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          if (selectedCity == null)
                            Text(
                              "Please select your City",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),

                          // Gender Radio Buttons with validation
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                // Adds some spacing inside the container
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    // Border styling
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors
                                        .white // Optional: Rounded corners
                                    ),
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.brown[500],
                                  ),
                                ),
                              ),
                              SizedBox(width: 30),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio<String>(
                                        activeColor: Colors.white,
                                        value: 'Male',
                                        groupValue: selectedGender,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return Colors
                                                  .white; // Color when selected
                                            }
                                            return Colors
                                                .white; // Border color when unselected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGender = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Male',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        activeColor: Colors.white,
                                        value: 'Female',
                                        groupValue: selectedGender,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return Colors
                                                  .white; // Color when selected
                                            }
                                            return Colors
                                                .white; // Border color when unselected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGender = value;
                                          });
                                        },
                                      ),
                                      Text('Female',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        activeColor: Colors.white,
                                        value: 'Other',
                                        groupValue: selectedGender,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.selected)) {
                                              return Colors
                                                  .white; // Color when selected
                                            }
                                            return Colors
                                                .white; // Border color when unselected
                                          },
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGender = value;
                                          });
                                        },
                                      ),
                                      Text('Other',
                                          style:
                                              TextStyle(color: Colors.white)),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),

                          // Hobbies Checkbox with validation
                          Container(
                            padding: EdgeInsets.all(8),
                            // Adds some spacing inside the container
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                // Border styling
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white // Optional: Rounded corners
                                ),
                            child: Text(
                              'Hobbies',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.brown[500],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CheckboxListTile(
                                checkColor: Colors.black,
                                activeColor: Colors.white,
                                side: BorderSide(
                                  color: selectedHobbies.contains('Dancing')
                                      ? Colors.white
                                      : Colors.white,
                                  // White when checked, Red when unchecked
                                  width: 2,
                                ),
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
                                title: Text('Reading',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              CheckboxListTile(
                                checkColor: Colors.black,
                                activeColor: Colors.white,
                                side: BorderSide(
                                  color: selectedHobbies.contains('Dancing')
                                      ? Colors.white
                                      : Colors.white,
                                  // White when checked, Red when unchecked
                                  width: 2,
                                ),
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
                                title: Text('Music',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              CheckboxListTile(
                                checkColor: Colors.black,
                                activeColor: Colors.white,
                                side: BorderSide(
                                  color: selectedHobbies.contains('Dancing')
                                      ? Colors.white
                                      : Colors.white,
                                  // White when checked, Red when unchecked
                                  width: 2,
                                ),
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
                                title: Text('Dancing',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              CheckboxListTile(
                                checkColor: Colors.brown[400],
                                activeColor: Colors.white,
                                side: BorderSide(
                                  color: selectedHobbies.contains('Dancing')
                                      ? Colors.white
                                      : Colors.white,
                                  // White when checked, Red when unchecked
                                  width: 2,
                                ),
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
                                title: Text('Other',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                          // SizedBox(height: 20),

                          // Hobbies Validation
                          if (selectedHobbies.isEmpty)
                            Text(
                              "Please select at least one hobby",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),

                          // Password Field
                          Row(
                            children: [
                              // Text('Password',
                              //     style: TextStyle(
                              //         fontSize: 20, color: Colors.white)),
                              // SizedBox(width: 30),
                              Expanded(
                                child: getTextFormFeild(
                                  nameOfcontroller: passwordController,
                                  maxLength: 16,
                                  hintIcon: CupertinoIcons.padlock_solid,
                                  hinttext: "Enter your password",
                                  labletext: "Enter your password",
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
                                      color: Colors.brown[400],
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
                          // SizedBox(height: 12),

                          // Confirm Password Field
                          Row(
                            children: [
                              // Text('Confirm ',
                              //     style: TextStyle(
                              //         fontSize: 20, color: Colors.white)),
                              // SizedBox(width: 30),
                              Expanded(
                                child: getTextFormFeild(
                                  nameOfcontroller: confirmPasswordController,
                                  maxLength: 16,
                                  hintIcon: CupertinoIcons.padlock_solid,
                                  hinttext: "Enter your confirm password",
                                  labletext: "Enter your confirm password",
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
                                      color: Colors.brown[400],
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Please enter your confirm password';
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
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (selectedGender == null) {
                                    return; // Ensure gender is selected
                                  }

                                  if (selectedHobbies.isEmpty) {
                                    return; // Ensure at least one hobby is selected
                                  }
                                  if (widget.userDetail == null) {
                                    // CrudList.userList[widget.editIndex!] = map;
                                    widget._user.addUserInUserTable(
                                      Name: nameController.text,
                                      Email: emailController.text,
                                      PhoneNo: phoneController.text,
                                      Password: passwordController.text,
                                      ConfirmPassword:
                                          confirmPasswordController.text,
                                      City: selectedCity,
                                      Gender: selectedGender,
                                      Hobbies: selectedHobbies is String
                                          ? selectedHobbies
                                          : selectedHobbies.join(','),
                                      Age: (DateTime.now().year -
                                              (selectedDate?.year ??
                                                  DateTime.now().year))
                                          .toString(),
                                      dob: selectedDate is DateTime
                                          ? selectedDate?.toIso8601String()
                                          : selectedDate,
                                    );
                                    await widget._user.getUserList();
                                    // await widget._api.addData(
                                    //     {
                                    //   'Name': nameController.text,
                                    //   'Email': emailController.text,
                                    //   'PhoneNo': phoneController.text,
                                    //   'Password': passwordController.text,
                                    //   'ConfirmPassword':
                                    //       confirmPasswordController.text,
                                    //   'City': selectedCity,
                                    //   'Gender': selectedGender,
                                    //   'Hobbies': selectedHobbies is String ? selectedHobbies : selectedHobbies.join(','),
                                    //
                                    //       // selectedHobbies,
                                    //   // : selectedHobbies.join(','),
                                    //   'Age': (DateTime.now().year -
                                    //           (selectedDate?.year ??
                                    //               DateTime.now().year))
                                    //       .toString(),
                                    //   'dob': selectedDate is DateTime
                                    //       ? selectedDate?.toIso8601String()
                                    //       : selectedDate,
                                    // }
                                    // );
                                    setState(() {

                                    });
                                    Navigator.pop(context, widget.userDetail);


                                  } else {
                                    // Adding a new user
                                    // CrudList.userList.add(map);
                                    // widget._user.updateUser(
                                    //   id: widget.userDetail?[ProjectDb.USER_ID],
                                    //   Name: nameController.text,
                                    //   Email: emailController.text,
                                    //   PhoneNo: phoneController.text,
                                    //   Password: passwordController.text,
                                    //   ConfirmPassword:
                                    //       confirmPasswordController.text,
                                    //   City: selectedCity,
                                    //   Gender: selectedGender,
                                    //   Hobbies: selectedHobbies is String
                                    //       ? selectedHobbies
                                    //       : selectedHobbies.join(','),
                                    //   Age: (DateTime.now().year -
                                    //           (selectedDate?.year ??
                                    //               DateTime.now().year))
                                    //       .toString(),
                                    //   dob: selectedDate is DateTime
                                    //       ? selectedDate?.toIso8601String()
                                    //       : selectedDate,
                                    // );
                                    // Navigator.pop(context, widget.userDetail);
                                    await widget._user.updateUser(
                                      id: int.tryParse(widget.userDetail?[ProjectDb.USER_ID]?.toString() ?? '0') ?? 0,
                                      // Ensure valid ID
                                      Name: nameController.text,
                                      Email: emailController.text,
                                      PhoneNo: phoneController.text,
                                      Password: passwordController.text,
                                      ConfirmPassword:
                                          confirmPasswordController.text,
                                      City: selectedCity,
                                      Gender: selectedGender,
                                      Hobbies: selectedHobbies,
                                      // Pass as list
                                      Age: int.tryParse((DateTime.now().year -
                                                  (selectedDate?.year ??
                                                      DateTime.now().year))
                                              .toString()) ??
                                          0,
                                      dob: selectedDate != null
                                          ? selectedDate!.toIso8601String()
                                          : '',
                                    );

                                    await widget._api.editData(
                                        widget.userDetail![ProjectDb.USER_ID].toString(), {
                                      'Name': nameController.text,
                                      'Email': emailController.text,
                                      'PhoneNo': phoneController.text,
                                      'Password': passwordController.text,
                                      'ConfirmPassword':
                                          confirmPasswordController.text,
                                      'City': selectedCity,
                                      'Gender': selectedGender,
                                      'Hobbies': selectedHobbies is String
                                          ? selectedHobbies
                                          : selectedHobbies.join(','),
                                      'Age': (DateTime.now().year -
                                              (selectedDate?.year ??
                                                  DateTime.now().year))
                                          .toString(),
                                      'dob': selectedDate is DateTime
                                          ? selectedDate?.toIso8601String()
                                          : selectedDate,
                                    }
                                    );

                                    setState(() {
                                      widget.isEdit = !widget.isEdit;
                                    });
                                    print("Form submitted successfully!");
                                    print(widget.userDetail?['Hobby']);
                                    print(widget.userDetail?['Dob']);

                                    // Pop the screen with updated user data
                                    Navigator.pop(context, {
                                      ProjectDb.USER_ID: widget.userDetail?[ProjectDb.USER_ID] ?? 0,
                                      ProjectDb.NAME: nameController.text,
                                      ProjectDb.EMAIL: emailController.text,
                                      ProjectDb.PHONE_NO: phoneController.text,
                                      ProjectDb.PASSWORD: passwordController.text,
                                      ProjectDb.CONFIRM_PASSWORD: confirmPasswordController.text,
                                      ProjectDb.CITY: selectedCity,
                                      ProjectDb.GENDER: selectedGender,
                                      ProjectDb.HOBBIES: selectedHobbies.join(','), // Ensure it's a string
                                      ProjectDb.AGE: int.tryParse(
                                          (DateTime.now().year - (selectedDate?.year ?? DateTime.now().year))
                                              .toString()) ??
                                          0,
                                      ProjectDb.DOB:
                                      selectedDate != null ? selectedDate!.toIso8601String() : '',
                                    });

                                  }


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
                                    widget.isEdit = !widget.isEdit;
                                  });
                                }
                              },
                              child: Text(
                                widget.isEdit ? 'Edit' : 'Submit',
                                style: TextStyle(color: Colors.brown[400]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
    // );
  }

  Widget getTextFormFeild({
    TextEditingController? nameOfcontroller,
    String? hinttext,
    String? labletext,
    double radius = 8.0,
    String? Function(String?)? validator,
    bool isPassword = false,
    int? maxLength,
    TextInputType? keybordtype,
    List<TextInputFormatter>? inputFormatters,
    Widget? suffixIcon,
    Widget? prifixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
    IconData? hintIcon,
    List<String>? dropdownItems, // City dropdown
    String? selectedValue,
    void Function(String?)? onChanged,
    List<String>? phoneCodeItems, // Phone code dropdown
    String? selectedPhoneCode,
    void Function(String?)? onPhoneCodeChanged,
  }) {
    return dropdownItems != null
        ? DropdownButtonFormField<String>(
            value: selectedValue,
            decoration: InputDecoration(
              hintText: hinttext,
              labelText: labletext,
              labelStyle: TextStyle(color: Colors.brown[400]),
              prefixIcon: hintIcon != null
                  ? Icon(hintIcon, color: Colors.brown[400])
                  : null,
              // Add icon for city dropdown
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: Colors.brown),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: Colors.brown),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: Colors.brown, width: 2.0),
              ),
            ),
            onChanged: onChanged,
            items: dropdownItems.map((city) {
              return DropdownMenuItem(
                value: city,
                child: Text(city),
              );
            }).toList(),
          )
        : TextFormField(
            controller: nameOfcontroller,
            validator: validator,
            obscureText: isPassword,
            maxLength: maxLength,
            keyboardType: keybordtype,
            inputFormatters: inputFormatters,
            readOnly: readOnly,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hinttext,
              labelText: labletext,
              labelStyle: TextStyle(color: Colors.brown[400]),
              suffixIcon: suffixIcon,
              prefixIcon: phoneCodeItems != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.phone, color: Colors.brown[400]),
                        ), // Phone icon before dropdown
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedPhoneCode,
                              onChanged: onPhoneCodeChanged,
                              items: phoneCodeItems.map((code) {
                                return DropdownMenuItem(
                                  value: code,
                                  child: Text(code,
                                      style:
                                          TextStyle(color: Colors.brown[400])),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    )
                  : (prifixIcon ??
                      (hintIcon != null
                          ? Icon(hintIcon, color: Colors.brown[400])
                          : null)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: Colors.brown),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: Colors.brown),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: Colors.brown, width: 2.0),
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

class CurvedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarClipper(),
      child: AppBar(
        automaticallyImplyLeading: true,
        // ✅ Enables back button automatically
        title: Text(
          AddEditUserList().isEdit ? 'Update' : 'Registration',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown[400]),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[50],
        elevation: 4,
        shadowColor: Colors.brown[600],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height - 40, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
