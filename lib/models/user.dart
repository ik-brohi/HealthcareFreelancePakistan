import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String id;
  late final String name;
  late final String role;
  late final String gender;
  late final int phone;
  late final String username;
  late final Timestamp dob;


  User({
    this.id = '',
    required this.name,
    required this.role,
    required this.phone,
    required this.gender,
    required this.username,
    required this.dob,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dob': dob,
      'role': role,
      'phone': phone,
      'gender': gender,
      'username': username,
    };
  }

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      dob: json['dob'],
      username: json['username'],
      gender: json['gender'],
      role: json['role'],
  );
}