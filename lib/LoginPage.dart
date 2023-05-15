import 'package:ecom/SignUpPage.dart';
import 'package:ecom/onboardingScreen.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberPassword = false;
  String? selectedCategory;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    // Perform login logic here based on the entered email and password
    // You can check the role of the user and navigate accordingly
    if (email.isNotEmpty && password.isNotEmpty && selectedCategory != null) {
      // Example login logic for demonstration
      if (selectedCategory == 'HEALTHCARE PROFESSIONAL' &&
          email == 'doctor@example.com') {
        // Navigate to doctor's home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => onBoardingScreen()),
        );
      } else if (selectedCategory == 'PATIENT') {
        // Navigate to patient's home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => onBoardingScreen()),
        );
      }
    }
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
