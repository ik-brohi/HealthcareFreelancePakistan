import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User _user;

  User get user => _user;

  UserProvider() {
    _firebaseAuth.authStateChanges().listen((user) {
      _user = user!;
      notifyListeners();
    });
  }

  Future<void> updateUser() async {
    _user = (await _firebaseAuth.currentUser)!;
    notifyListeners();
  }

  Future<void> signUp(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user!;
      notifyListeners();
    } catch (e) {
      // Handle sign-up errors
      print('Sign-up error: $e');
    }
  }

  Future<void> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user!;
      notifyListeners();
    } catch (e) {
      // Handle sign-in errors
      print('Sign-in error: $e');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _user = null;
    notifyListeners();
  }
}