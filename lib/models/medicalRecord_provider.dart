import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecom/models/medicalRecord_model.dart';


class MedicalRecordProvider extends ChangeNotifier {
  CollectionReference recordsCollection =
  FirebaseFirestore.instance.collection('medical_records');
  List<MedicalRecord> medicalRecords = [];

  // Fetch all medical records from Firestore
  Future<void> fetchMedicalRecords() async {
    final snapshot = await recordsCollection.get();

    medicalRecords = snapshot.docs.map((doc) {
      final data = doc.data();
      return MedicalRecord(
        id: doc.id,
        title: doc.get('title'),
        createDate: doc.get('createDate'),
        description: doc.get('description'),
        image: doc.get('image'),
      );
    }).toList();

    notifyListeners();
  }

  // Add a new medical record to Firestore
  Future<void> addMedicalRecord(MedicalRecord record) async {
    try {
      await recordsCollection.add({
        'title': record.title,
        'createDate': record.createDate,
        'description': record.description,
      });

      fetchMedicalRecords(); // Refresh the list of medical records after adding a new one
    } catch (e) {
      print('Error adding medical record: $e');
    }
  }

  // Update an existing medical record in Firestore
  Future<void> updateMedicalRecord(
      String recordId, MedicalRecord updatedRecord) async {
    try {
      final updatedData = {
        'title': updatedRecord.title,
        'createDate': updatedRecord.createDate,
        'description': updatedRecord.description,
      };

      await recordsCollection.doc(recordId).update(updatedData);

      fetchMedicalRecords(); // Refresh the list of medical records after updating
    } catch (e) {
      print('Error updating medical record: $e');
    }
  }

  // Delete a medical record from Firestore
  Future<void> deleteMedicalRecord(String recordId) async {
    try {
      await recordsCollection.doc(recordId).delete();

      fetchMedicalRecords(); // Refresh the list of medical records after deleting
    } catch (e) {
      print('Error deleting medical record: $e');
    }
  }
}