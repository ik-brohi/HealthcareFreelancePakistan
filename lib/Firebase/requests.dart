import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Requests extends StatelessWidget{

  late List<DocumentSnapshot> requestsList;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> getRequests() async {
    QuerySnapshot snapshot = await firestore.collection('requests').get();
    return snapshot.docs;
  }

  void fetchData() async {
    requestsList = await getRequests();
    // Process the retrieved appointments
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
