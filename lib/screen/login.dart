import 'package:apppppppp/screen/otp.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 // Import your OTP page here

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _phoneNumberController = TextEditingController();
  bool isMobileNumberValid = false;
  FocusNode _phoneNumberFocusNode = FocusNode();

  @override
  void dispose() {
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 215, 215),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.4, // Adjusted height
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
                            left: screenWidth * 0.4, // Adjusted position
                            top: screenHeight * 0.15), // Adjusted position
                        child: Icon(
                          Icons.mail_lock_outlined,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.27, // Adjusted position
            left: screenWidth * 0.05, // Adjusted position
            child: GestureDetector(
              onTap: () {
                // Handle the country code selection here
              },
              child: Container(
                width: screenWidth * 0.9, // Adjusted width
                height: screenHeight * 0.4, // Adjusted height
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.02), // Adjusted position
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Color.fromARGB(255, 57, 120, 31),
                            fontSize: screenWidth * 0.05, // Adjusted size
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.01), // Adjusted position
                      child: Text(
                        'Enter your mobile to get',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 10, 0, 0),
                          fontSize: screenWidth * 0.04, // Adjusted size
                        ),
                      ),
                    ),
                    Text(
                      'Login OTP',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 11, 0, 0),
                        fontSize: screenWidth * 0.04, // Adjusted size
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Adjusted padding
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: screenWidth * 0.02), // Adjusted padding
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 212, 210, 210),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                CountryCodePicker(
                                  onChanged: (CountryCode countryCode) {
                                    print(
                                        "Selected Country Code: ${countryCode.dialCode}");
                                  },
                                  initialSelection: 'US',
                                  favorite: ['+1', 'US'],
                                  showCountryOnly: false,
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: false,
                                  padding: EdgeInsets.zero,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: screenWidth * 0.2), // Adjusted position
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color:
                                        const Color.fromARGB(255, 5, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03), // Adjusted height
                    buildTextField(
                        _phoneNumberController,
                        'Enter your Mobile Number number'),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.63, // Adjusted position
            left: screenWidth * 0.38, // Adjusted position
            child:GestureDetector(
  onTap: () async {
    if (isMobileNumberValid) {
      try {
        await _auth.verifyPhoneNumber(
          phoneNumber: '+${_phoneNumberController.text}', // Add the selected country code
          verificationCompleted: (PhoneAuthCredential credential) {
            
          },
          verificationFailed: (FirebaseAuthException e) {
            print('Verification Failed: ${e.message}');
          },
          codeSent: (String verificationId, int? resendToken) async {
         
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpPage(verificationId),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            // Auto-retrieval of SMS timed out
          },
        );
      } catch (e) {
        print('Error: $e');
      }
    } else {
      // Show an error dialog for invalid mobile number
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text(
                            'Invalid mobile number. Please enter a valid 10-digit number.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
               // Adjusted padding
      child: Container(
        width: screenWidth * 0.17,
        height: screenHeight * 0.08,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 15, 50, 92),
          borderRadius: BorderRadius.circular(screenWidth * 0.08),
        ),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: screenWidth * 0.06,
        ),
      ),
    ),
  
),


          Positioned(
            top: screenHeight * 0.76, // Adjusted position
            left: screenWidth * 0.1, // Adjusted position
            right: screenWidth * 0.1, // Adjusted position
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: const Color.fromARGB(255, 122, 120, 120),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Adjusted padding
                  child: Text(
                    'OR',
                    style: TextStyle(
                      color: Color.fromARGB(255, 125, 124, 124),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: const Color.fromARGB(255, 123, 123, 123),
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.82, // Adjusted position
            left: screenWidth * 0.1, // Adjusted position
            right: screenWidth * 0.1, // Adjusted position
            child: Container(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01), // Adjusted padding
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 15, 50, 92),
                borderRadius: BorderRadius.circular(screenWidth * 0.03), // Adjusted radius
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.android,
                    color: Colors.white,
                    size: screenWidth * 0.07, // Adjusted size
                  ),
                  SizedBox(width: screenWidth * 0.1), // Adjusted width
                  Text(
                    'Login with Google',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04, // Adjusted size
                    ),
                  ),
                ],
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
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          if (value.length == 10) {
            setState(() {
              isMobileNumberValid = true;
            });
            _phoneNumberFocusNode.unfocus();
          } else {
            setState(() {
              isMobileNumberValid = false;
            });
          }
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

