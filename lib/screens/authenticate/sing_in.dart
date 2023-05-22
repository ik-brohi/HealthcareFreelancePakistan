import 'package:flutter/material.dart';
import '../../services/auth.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Welcome to FYP"),

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: 	ElevatedButton(
          child: Text('sign in anon'),
          onPressed: () async {
            dynamic result = await _auth.singInAnnon();
            if(result == null){
              print('error signing in');
            } else {
              print('signed in');
              print(result);
            }
          },
        ),
      ),
    );
  }
}
