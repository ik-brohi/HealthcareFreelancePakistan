<<<<<<< HEAD
// @dart=2.12
=======
import 'package:ecom/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
>>>>>>> 3ac3ea0ce0d2a9ad8fe49cedd5fdf9f528efa59c
import 'package:flutter/material.dart';
import 'LoginPage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare Freelance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage()
    );
  }
}
