import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String id;
  late final String name;
  late final String role;
  late final int age;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.role, required String uid,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'role': role,
    };
  }

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      role: json['role'], uid: json['uid'],
  );
}