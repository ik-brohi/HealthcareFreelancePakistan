import 'package:ecom/Widgets/responsive.dart';
import 'package:ecom/myOrderpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Alignment alignleft = Alignment.topLeft;
  Alignment alignright = Alignment.topRight;
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
                    Container(
                      height: countHeight(65, context),
                      width: countWidth(65, context),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue[100]),
                      child: Center(
                        child: Text(
                          "IK",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.normal,
                              fontSize: 20.0,
                              color: Colors.blue[500]),
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
                                  "Imran Khan",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0),
                                ),
                              ),
                              Align(
                                alignment: alignleft,
                                child: Text(
                                  "Ik02161@gmail.com",
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) => MyOrders()));
              },
              child: ListTile(
                title: Text("My Appointments",
                    style: GoogleFonts.openSans(fontSize: 16.0)),
                subtitle: Text(
                  "2 Appointments",
                  style: GoogleFonts.openSans(fontWeight: FontWeight.normal),
                ),
                trailing: Icon(Icons.chevron_right_rounded),
              ),
            ),
            Divider(),
            ListTile(
              title: Text("Addresses",
                  style: GoogleFonts.openSans(fontSize: 16.0)),
              subtitle: Text(
                "2 Addresses",
                style: GoogleFonts.openSans(fontWeight: FontWeight.normal),
              ),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
            Divider(),
            ListTile(
              title: Text("My Reviews",
                  style: GoogleFonts.openSans(fontSize: 16.0)),
              subtitle: Text(
                "01 Reviews",
                style: GoogleFonts.openSans(fontWeight: FontWeight.normal),
              ),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
            Divider(),
            ListTile(
              title:
                  Text("Account Settings", style: GoogleFonts.openSans(fontSize: 16.0)),
              subtitle: Text(
                "Notification-Security",
                style: GoogleFonts.openSans(fontWeight: FontWeight.normal),
              ),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
            Divider(),
          ],
        )),
      ),
    );
  }
}
