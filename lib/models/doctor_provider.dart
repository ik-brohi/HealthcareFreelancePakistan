import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecom/models/doctor_model.dart';



class DoctorProvider extends ChangeNotifier {
  CollectionReference doctorsCollection =
  FirebaseFirestore.instance.collection('doctors');
  List<Doctor> doctors = [];

  Future<void> fetchDoctors() async {
    try{
      final snapshot = await doctorsCollection.get();

      doctors = snapshot.docs.map((doc) {
        final data = doc.data();
        return Doctor(
          name: data['name'],
          title: data['title'],
          location: data['location'],
          hourlyRate: data['hourlyRate'].toDouble(),
          ratings: data['ratings'].toDouble(),
          description: data['description'].toString(),
        );
      }).toList();
    }
    catch(e){
      print(e);
    }

    notifyListeners();
  }

  Future<void> addDoctor(Doctor doctor) async {
    await doctorsCollection.add({
      'name': doctor.name,
      'title': doctor.title,
      'location': doctor.location,
      'hourlyRate': doctor.hourlyRate,
      'ratings': doctor.ratings,
      'description': doctor.description,
    });

    notifyListeners();
  }

  Future<void> updateDoctor(Doctor doctor) async {
    final doctorDoc = doctorsCollection.doc(doctor.id);

    await doctorDoc.update({
      'name': doctor.name,
      'title': doctor.title,
      'location': doctor.location,
      'hourlyRate': doctor.hourlyRate,
      'ratings': doctor.ratings,
      'description': doctor.description,
    });

    notifyListeners();
  }

  Future<void> deleteDoctor(String doctorId) async {
    final doctorDoc = doctorsCollection.doc(doctorId);

    await doctorDoc.delete();
    doctors.removeWhere((doctor) => doctor.id == doctorId);

    notifyListeners();
  }

  Doctor findById(String id) {
    return doctors.firstWhere((doctor) => doctor.id == id);
  }
}
