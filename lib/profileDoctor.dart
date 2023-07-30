import 'dart:typed_data';
import 'package:ecom/DoctorOrderPage.dart';
import 'package:ecom/Widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'AddressPage.dart';
import 'PrivacySecurityPage.dart';
import 'ReviewsPage.dart';
import 'medicalRecordPage.dart';
import 'dart:async';

class ProfileDoctor extends StatefulWidget {
  @override
  State<ProfileDoctor> createState() => _ProfileDoctorState();
}

class _ProfileDoctorState extends State<ProfileDoctor> {
  Uint8List? _imageData;
  Alignment alignleft = Alignment.topLeft;
  Alignment alignright = Alignment.topRight;

  FutureOr<void> getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        _imageData = imageBytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            child: Column(
              children: [
                Align(
                  alignment: alignleft,
                  child: Text(
                    "My Profile",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold, fontSize: 32.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: getImage,
                          child: Container(
                            height: countHeight(65, context),
                            width: countWidth(65, context),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue[100],
                            ),
                            child: _imageData != null
                                ? CircleAvatar(
                              backgroundImage: MemoryImage(_imageData!),
                              radius: countWidth(32, context),
                            )
                                : Center(
                              child: Text(
                                "Upload",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                    color: Colors.blue[500]),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: alignleft,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: alignleft,
                                    child: Text(
                                      "Doctor Saif",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0),
                                    ),
                                  ),
                                  Align(
                                    alignment: alignleft,
                                    child: Text(
                                      "DoctorSaif@gmail.com",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorOrderPage()));
                  },
                  child: ListTile(
                    title: Text("My Requests", style: GoogleFonts.openSans(fontSize: 16.0)),
                    subtitle: Text(
                      "My Requests",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.normal),
                    ),
                    trailing: Icon(Icons.chevron_right_rounded),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddressPage()));
                  },
                  child: ListTile(
                    title: Text("Addresses", style: GoogleFonts.openSans(fontSize: 16.0)),
                    subtitle: Text(
                      "2 Addresses",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.normal),
                    ),
                    trailing: Icon(Icons.chevron_right_rounded),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedicalRecordPage()));
                  },
                  child: ListTile(
                    title: Text("My Records", style: GoogleFonts.openSans(fontSize: 16.0)),
                    subtitle: Text(
                      "2 Official documents submitted",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.normal),
                    ),
                    trailing: Icon(Icons.chevron_right_rounded),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewsPage()));
                  },
                  child: ListTile(
                    title: Text("My Reviews", style: GoogleFonts.openSans(fontSize: 16.0)),
                    subtitle: Text(
                      "01 Reviews",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.normal),
                    ),
                    trailing: Icon(Icons.chevron_right_rounded),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrivacySecurityPage()));
                  },
                  child: ListTile(
                    title: Text("Account Settings", style: GoogleFonts.openSans(fontSize: 16.0)),
                    subtitle: Text(
                      "Privacy and Security",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.normal),
                    ),
                    trailing: Icon(Icons.chevron_right_rounded),
                  ),
                ),
                Divider(),
                // Closing brace for the ListView widget
              ], // Closing brace for the Column widget
            ), // Closing brace for the Container widget
        ), // Closing brace for the Padding widget
      ), // Closing brace for the Scaffold widget
    ); // Closing brace for the build method
  } // Closing brace for the _ProfileState class
}

