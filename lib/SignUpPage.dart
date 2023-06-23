import 'package:ecom/LoginPage.dart';
import 'package:ecom/onboardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Page',
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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //final TextEditingController fullNameController = TextEditingController();
  //final TextEditingController phoneController = TextEditingController();

  bool rememberPassword = false;
  String? selectedCategory;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  Future signup() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String email = emailController.text;
    String password = passwordController.text;
    //String fullName = fullNameController.text;
    //String phoneNum = phoneController.text;


    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = credential.user;
      print(user?.uid);
      await user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginApp()),
    );
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
            /*TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),*/
            SizedBox(height: 8.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 8.0),
            //Phone Number Field
            /*TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),*/
            SizedBox(height: 8.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
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
              onPressed: signup,
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
