import 'package:ecom/SignUpPage.dart';
import 'package:ecom/onboardingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
  late final UserCredential userCredential;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberPassword = false;
  String? selectedCategory;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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




    // Perform login logic here based on the entered email and password
    // You can check the role of the user and navigate accordingly


    /*if (email=='doctor@example.com' && password =='123@') {
      // Example login logic for demonstration
      if(email == 'doctor@example.com') {
        await prefs.setString("name", "Imran Khan");
        await prefs.setString("email", "doctor@example.com"); // Navigate to doctor's home page
        await prefs.setString("role", "HEALTHCARE PROFESSIONAL"); // Navigate to doctor's home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => onBoardingScreen()),
        );
      } else {
        // Navigate to patient's home page
        await prefs.setString("name", "Patient Test");
        await prefs.setString("email", email);
        await prefs.setString("role", "PATIENT");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => onBoardingScreen()),
        );
      }
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
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
                onPressed: login,
              //  (){
              //   FirebaseAuth.instance.signInWithEmailAndPassword(email: _email , password: _password);
              // },
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
