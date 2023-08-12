import 'package:ecom/PaymentScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'models/appoinment_provider.dart';
import 'models/appointment_model.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime? _selectedDate;
  double? _price;
  String? _description;
  String? _doctorName;
  String? userEmail;

  final _auth = FirebaseAuth.instance;
  dynamic user;



  void getCurrentUserInfo() async {
    user = await _auth.currentUser!;
    userEmail = user.email;
  }



  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  addAppointment(String appNo, String trackNo, String detail, DateTime dateTime, String status, String documentID, String doctorName){}

  final newAppointment = Appointment(
    appointNo: "A123",
    trackNo: "T456",
    details: "Meeting with client",
    date: DateTime.now(),
    status: "Scheduled",
    documentId: '',
    doctorName: '',
  );


  @override
  Widget build(BuildContext context) {
    final appointmentProvider = Provider.of<AppointmentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _selectDate,
              child: Text(
                _selectedDate == null
                    ? 'Select Date'
                    : 'Selected Date: ${_selectedDate!.toString().substring(0, 10)}',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _price = double.tryParse(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
            ),

            SizedBox(height: 16.0),

            TextField(
              decoration: InputDecoration(
                labelText: 'Doctor Name',
              ),
              onChanged: (value) {
                setState(() {
                  _doctorName = value;

                });
              },
            ),


            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_selectedDate != null && _price != null && _description != null) {
                  // Perform action to confirm the hiring, e.g., make an API call or navigate to the next screen.

                  appointmentProvider.addAppointment(newAppointment);
                  print('Confirmed appointment on $_selectedDate');
                  print('Price: $_price');
                  print('Description: $_description');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Payment Process'),
                        content: Text('Confirm the payment to process the request '),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => PaymentScreen()),
                              );

                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Incomplete Information'),
                        content: Text('Please fill in all fields.'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
