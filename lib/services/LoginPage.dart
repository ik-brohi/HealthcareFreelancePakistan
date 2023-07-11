import 'package:ecom/services/SignUpPage.dart';
import 'package:ecom/onboardingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool islogin = false;

  late final UserCredential userCredential;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberPassword = false;
  String? selectedCategory;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void  login() async{
    String email = emailController.text;
    String password = passwordController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Sign in logic
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = userCredential.user;
        if(user!.emailVerified){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => onBoardingScreen()),
          );
        }
        // Authentication successful, navigate to the next screen or perform any necessary actions.
      } catch (e) {
        // Handle authentication errors.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter Email',
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
                  email = value!;
                });
              },
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Enter Password',

              ),
              key: ValueKey('password'),
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
                  password = value!;
                });
              },
            ),

            SizedBox(height: 8.0),
            Row(
              children: [
                Checkbox(
                  value: rememberPassword,
                  onChanged: (bool? value) {
                    setState(() {
                      rememberPassword = value ?? false;
                    });
                  },
                ),
                Text('Remember password'),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: AuthServices.signinUser(email, password, context),

              child: Text('Login'),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                // Navigate to signup page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpApp()),
                );
              },
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Don\'t have an account?',
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      ' Sign Up here.',
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
