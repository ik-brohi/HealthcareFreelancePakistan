import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class records extends StatelessWidget{

  late List<DocumentSnapshot> recordsList;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> getRecords() async {
    QuerySnapshot snapshot = await firestore.collection('records').get();
    return snapshot.docs;
  }

  void fetchData() async {
    recordsList = await getRecords();
    // Process the retrieved records
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  } 
}
