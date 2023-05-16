import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  String name;
  String email;
  String role;
  String profilePicture;

  User({required this.name, required this.email, required this.profilePicture, required this.role});
}

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void login(String email, String password) {
    // authenticate user and retrieve user data
    _user = User(name: "Imran Khan", email: email, profilePicture: "assets/images/profile.png", role: "HEALTHCARE PROFESSIONAL");
    notifyListeners();
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Login"),
          onPressed: () {
            UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
            userProvider.login("doctor@example.com", "password");
          },
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, ${userProvider.user?.name ?? ""}"),
      ),
      body: Center(
        child: Image.asset(userProvider.user?.profilePicture ?? ""),
      ),
    );
  }
}
