import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Services extends StatelessWidget{

  late List<DocumentSnapshot> servicesList;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> getServices() async {
    QuerySnapshot snapshot = await firestore.collection('services').get();
    return snapshot.docs;
  }

  void fetchData() async {
    servicesList = await getServices();
    // Process the retrieved services
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
