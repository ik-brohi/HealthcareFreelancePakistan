import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in annon
  Future singInAnnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in with E&P
  //register with E&P
  //Sign out
}