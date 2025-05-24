import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1), // Set the overall background to cream color
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Color(0xFFFFF3E0), // Cream color for the AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF6D4C41).withOpacity(0.5),
                            blurRadius: 5.0,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/flutter_app_logo.jpg',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Matrimonial App',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFF3E0), // Dark brown text
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // "Meet Our Team" Section
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 200.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF6D4C41), // Cream color
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Meet Our Team',
                        style: TextStyle(color: Color(0xFFFFF3E0), fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFFF8E1), // Light cream color for background
                      border: Border.all(color: Color(0xFF6D4C41), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF6D4C41).withOpacity(0.3),
                          blurRadius: 5.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Developed by:  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF6D4C41),)),
                            Expanded(
                              child: Text('Vanita Kambariya (23010101125)'),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mentored by:   ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF6D4C41),)),
                            Expanded(
                              child: Text(
                                'Prof. Mehul Bhundiya (Computer Engineering Department),\nSchool of Computer Science',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Explored by:   ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF6D4C41),)),
                            Expanded(
                              child: Text(
                                'ASWDC, School of Computer Science,\nSchool of Computer Science',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Eulogized by: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF6D4C41),)),
                            Expanded(
                              child: Text(
                                'Darshan University, Rajkot, Gujarat - INDIA',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // About Section
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 200.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF6D4C41),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'About ASWDC',
                        style: TextStyle(color: Color(0xFFFFF3E0), fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFFF8E1), // Light cream background
                      border: Border.all(color: Color(0xFF6D4C41), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF6D4C41).withOpacity(0.3),
                          blurRadius: 5.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/images.png',
                          height: 100,
                          width: 400,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'ASWDC is the Application, Software, and Website Development Center at Darshan University '
                                        'run by students and staff of the School of Computer Science. '
                                        'Sole purpose is to bridge the gap between curriculum and industry demands.',
                                  ),
                                  Text(''),
                                  Text('Sole purpose of ASWDC is to bridge gap'
                                      'between university curriculum & industry'
                                      'demands. Students learn cutting edge'
                                      'technologies, develop real world application'
                                      '& experiences professional environment @'
                                      'ASWDC under guidance of industry experts &'
                                      'faculty members.')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Contact us Section
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 220.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF6D4C41), // Cream color
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Contact Us',
                        style: TextStyle(color: Color(0xFFFFF3E0), fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFFF8E1), // Light cream background
                      border: Border.all(color: Color(0xFF6D4C41), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF6D4C41).withOpacity(0.3),
                          blurRadius: 5.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.email,color: Color(0xFF6D4C41),),
                                      Text(' aswdc@darshan.ac.in',style: TextStyle(color: Color(0xFF6D4C41)),),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.phone,color: Color(0xFF6D4C41),),
                                      Text(' +91-9727747317',style: TextStyle(color: Color(0xFF6D4C41))),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.language,color: Color(0xFF6D4C41),),
                                      Text(' aswdc@darshan.ac.in',style: TextStyle(color: Color(0xFF6D4C41))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Contact us second box
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFFF8E1), // Light cream background
                  border: Border.all(color: Color(0xFF6D4C41), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF6D4C41).withOpacity(0.3),
                      blurRadius: 5.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.share,color: Color(0xFF6D4C41),),
                                  Text(' Share App',style: TextStyle(color: Color(0xFF6D4C41))),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.apps,color: Color(0xFF6D4C41),),
                                  Text(' More Apps',style: TextStyle(color: Color(0xFF6D4C41))),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.star_rate,color: Color(0xFF6D4C41),),
                                  Text(' Rate Us',style: TextStyle(color: Color(0xFF6D4C41))),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.thumb_up,color: Color(0xFF6D4C41),),
                                  Text(' Like us on Facebook',style: TextStyle(color: Color(0xFF6D4C41))),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.update,color: Color(0xFF6D4C41),),
                                  Text(' Check For Update',style: TextStyle(color: Color(0xFF6D4C41))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}