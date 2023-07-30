import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecom/models/doctor_model.dart';
import 'dart:async';

class DoctorProvider extends ChangeNotifier {
  CollectionReference doctorsCollection =
      FirebaseFirestore.instance.collection('doctor');
  List<Doctor> doctors = [];
 


  FutureOr<void> fetchDoctors() async {
    try {
  
      QuerySnapshot querySnapshot = await doctorsCollection.get();

      doctors = querySnapshot.docs.map((doc) {
        // final data = doc.data();
        return Doctor(
          id: doc.id,
          name: doc.get("name"),
          title: doc.get("title"),
          location: doc.get("location"),
          hourlyRate: doc.get("hour"),
          ratings: doc.get("ratings"),
          description: doc.get("description"),
        );
      }).toList();
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  FutureOr<void> addDoctor(Doctor doctor) async {
    await doctorsCollection.add({
      'ID'  : doctor.id,
      'name': doctor.name,
      'title': doctor.title,
      'location': doctor.location,
      'hourlyRate': doctor.hourlyRate,
      'ratings': doctor.ratings,
      'description': doctor.description,
    });

    notifyListeners();
  }

  FutureOr<void> updateDoctor(Doctor doctor) async {
    final doctorDoc = doctorsCollection.doc();

    await doctorDoc.update({
      'id': doctor.id,
      'name': doctor.name,
      'title': doctor.title,
      'location': doctor.location,
      'hourlyRate': doctor.hourlyRate,
      'ratings': doctor.ratings,
      'description': doctor.description,
    });

    notifyListeners();
  }

  FutureOr<void> deleteDoctor(String doctorId) async {
    final doctorDoc = doctorsCollection.doc(doctorId);

    await doctorDoc.delete();
    doctors.removeWhere((doctor) => doctor.id == doctorId);

    notifyListeners();
  }

  Doctor findById(String id) {
    return doctors.firstWhere((doctor) => doctor.id == id);
  }
}
