import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    // Dispose the focus node when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 215, 215),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: screenWidth,
                  height: screenWidth * 1.33, // Maintain a 4:3 aspect ratio
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 30, 82, 146),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.41,
                          top: screenWidth * 0.3,
                        ),
                        child: Container(
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color.fromARGB(255, 254, 255, 255),
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person_3_rounded,
                              color: Color.fromARGB(255, 249, 250, 252),
                              size: screenWidth * 0.07,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenWidth * 0.50,
            left: screenWidth * 0.06,
            child: GestureDetector(
              onTap: () {
                // Handle the country code selection here
              },
              child: Container(
                width: screenWidth * 0.86,
                height: screenWidth * 1.35, // Increased height to accommodate new fields
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        'Update your profile',
                        style: TextStyle(
                          color: Color.fromARGB(255, 76, 158, 40),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    buildTextField(_nameController, 'Enter your Name'),
                    buildTextField(_emailController, 'Enter your Email'),
                    buildTextField(_pincodeController, 'Enter your Pincode'),
                    SizedBox(height: 20),
                    Container(
                      width: screenWidth * 0.68,
                      height: screenWidth * 0.1,
                      color: Color.fromARGB(255, 85, 182, 94),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 50, 92),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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

  Widget buildTextField(
      TextEditingController controller, String hintText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          // Add any specific validation or handling as needed
        },
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 252, 251, 251)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 92, 89, 86)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 188, 186, 186)),
          ),
        ),
      ),
    );
  }
}
