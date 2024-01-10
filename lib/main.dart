import 'package:apppppppp/firebase_options.dart';
import 'package:apppppppp/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Container(
//           color: Color.fromARGB(255, 117, 134, 23),
//           alignment: Alignment.center,
//          child: Login(
//          ),
//         ),
//       ),
//     ),
    
//   );
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  // void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromARGB(255, 88, 68, 238),
          alignment: Alignment.center,
         child: Login(
         ),
        ),
      ),
    ),
    
  );
}