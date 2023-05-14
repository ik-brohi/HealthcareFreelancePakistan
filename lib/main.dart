import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/Firebase/records.dart';
import 'package:flutter/material.dart';
import 'onboardingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Healthcare Freelance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: onBoardingScreen(),
    );
  }
}
