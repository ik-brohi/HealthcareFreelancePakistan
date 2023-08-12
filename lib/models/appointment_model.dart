import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  final String appointNo;
  final String trackNo;
  final String details;
  final DateTime date;
  final String status;
  final String documentId;
  final String doctorName;// Add this field to store the document ID

  Appointment({
    required this.appointNo,
    required this.trackNo,
    required this.details,
    required this.date,
    required this.status,
    required this.documentId,
    required this.doctorName,
  });

  factory Appointment.fromSnapshot(QueryDocumentSnapshot<Object?> doc) {
    Map data = doc.data() as Map;
    return Appointment(
      appointNo: data?['appointNo'],
      trackNo: data?['trackNo'],
      details: data?['details'],
      date: (data?['date'] as Timestamp).toDate(),
      status: data?['status'],
      documentId: doc.id,
      doctorName: (data?['doctor']),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointNo': appointNo,
      'trackNo': trackNo,
      'details': details,
      'date': date,
      'status': status,
      'doctor' : doctorName
    };
  }
}
