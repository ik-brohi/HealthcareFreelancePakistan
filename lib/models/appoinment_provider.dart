import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'appointment_model.dart';

class AppointmentProvider extends ChangeNotifier {
  final CollectionReference _appointmentsCollection =
  FirebaseFirestore.instance.collection('appointments');
  String userEmail = FirebaseAuth.instance.currentUser?.email as String;
  List<Appointment> _appointments = [] ;

  List<Appointment> get appointments => _appointments ;

  Future<void> fetchAppointments() async {
    try {
      var snapshot = await _appointmentsCollection.get();
      _appointments = snapshot.docs
          .map((doc) => Appointment.fromSnapshot(doc))
          .toList();
      notifyListeners();
    } catch (e) {
      print("Error fetching appointments: $e");
    }
  }


  Future<void> addAppointment(Appointment appointment) async {
    try {
      await _appointmentsCollection.add(appointment.toJson());
      await fetchAppointments();
    } catch (e) {
      print("Error adding appointment: $e");
    }
  }

  Future<void> updateAppointment(Appointment appointment) async {
    try {
      await _appointmentsCollection
          .doc(appointment.documentId)
          .update(appointment.toJson());
      await fetchAppointments();
    } catch (e) {
      print("Error updating appointment: $e");
    }
  }

  Future<void> deleteAppointment(String documentId) async {
    try {
      await _appointmentsCollection.doc(documentId).delete();
      await fetchAppointments();
    } catch (e) {
      print("Error deleting appointment: $e");
    }
  }

// The rest of your code here...
}
