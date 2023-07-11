import 'package:ecom/services/LoginPage.dart';
import 'package:ecom/onboardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth.dart';

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignUp - Healthcare Freelance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  bool rememberPassword = false;
  String? selectedCategory;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Success!'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Registered Successfully!"),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
  Future signup() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String email = emailController.text;
    String password = passwordController.text;
    String fullName = fullNameController.text;

    try{
      AuthServices.signupUser(
          email, password, fullName, context);
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(context),
      );
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            //Full Name Text Field
          TextFormField(
              controller: fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Full Name';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  fullNameController.text = value!;
                });
              },
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Please Enter valid Email';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  emailController.text = value!;
                });
              },
            ),
            SizedBox(height: 8.0),
            //Phone Number Field
            /*TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 8.0),*/
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (value) {
                if (value!.length < 6) {
                  return 'Please Enter Password of min length 6';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  passwordController.text = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Choose Role',
              ),
              items: <String>[
                'HEALTHCARE PROFESSIONAL',
                'PATIENT',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed:
                signup,
              child: Text('Sign Up'),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                // Navigate to signup page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginApp()),
                );
              },
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Already have an account? ',
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      ' Login Here.',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
