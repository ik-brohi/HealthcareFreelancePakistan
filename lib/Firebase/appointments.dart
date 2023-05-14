import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Appointments extends StatelessWidget{

  late List<DocumentSnapshot> appointmentsList;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> getAppointments() async {
    QuerySnapshot snapshot = await firestore.collection('appointments').get();
    return snapshot.docs;
  }

  void fetchData() async {
    appointmentsList = await getAppointments();
    // Process the retrieved appointments
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
