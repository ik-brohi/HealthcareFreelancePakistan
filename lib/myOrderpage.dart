import 'package:ecom/Widgets/cancelledOrder.dart';
import 'package:ecom/Widgets/comlpetedOrders.dart';
import 'package:ecom/Widgets/processingOrders.dart';
import 'package:ecom/Widgets/responsive.dart';
import 'package:ecom/models/appoinment_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatefulWidget {
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  Alignment alignleft = Alignment.topLeft;
  var active = "delivered";
  bool delivered = true;
  bool processing = false;
  bool cancelled = false;
  TextStyle activeStyle = TextStyle();


  @override
  Widget build(BuildContext context) {
    final appointmentProvider = Provider.of<AppointmentProvider>(context);
    final appointment = appointmentProvider.appointments[0];
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            child: Column(
          children: [
            Align(
              alignment: alignleft,
              child: Text(
                "My Appointments",
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
            ),
            SizedBox(
              height: countHeight(20, context),
            ),
            SingleChildScrollView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Row(
                  children: [
                    Align(
                      // alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: (() {
                          setState(() {
                            delivered = true;
                            processing = false;
                            cancelled = false;
                            active = "Active";
                          });
                        }),
                        child: Container(
                          height: countHeight(40, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: active == "Active"
                                  ? Colors.black
                                  : Colors.grey[50]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Active".toUpperCase(),
                              style: active == "Active"
                                  ? GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)
                                  : GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: countWidth(10, context),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: (() {
                          setState(() {
                            delivered = false;
                            processing = true;
                            cancelled = false;
                            active = "Previous";
                          });
                        }),
                        child: Container(
                          height: countHeight(40, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: active == "Previous"
                                  ? Colors.black
                                  : Colors.grey[50]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Previous".toUpperCase(),
                              style: active == "Previous"
                                  ? GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)
                                  : GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: countWidth(10, context),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: (() {
                          setState(() {
                            delivered = false;
                            processing = false;
                            cancelled = true;
                            active = "Cancelled";
                          });
                        }),
                        child: Container(
                          height: countHeight(40, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: active == "Cancelled"
                                  ? Colors.black
                                  : Colors.grey[50]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Cancelled".toUpperCase(),
                              style: active == "Cancelled"
                                  ? GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)
                                  : GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: countHeight(20, context),
            ),
            if (delivered)
              Container(
                child: Column(
                  children: [
                    // completedOrders("15605", "A45682WL08", "08-APR-2022",
                    //     "2650", context),

                    completedOrders(appointment.doctorName, appointment.details, appointment.date, appointment.status, appointment.appointNo, context),
                    SizedBox(
                      height: countHeight(15, context),
                    ),
                    // completedOrders("15605", "A45682WL08", "08-APR-2022",
                    //     "2650", context),
                  ],
                ),
              ),
            if (processing)
              Container(
                child: Column(
                  children: [
                    processingOrders("15605", "A45682WL08", "08-APR-2022", "", "2650", context),
                    SizedBox(
                      height: countHeight(15, context),
                    ),
                    processingOrders("15605", "A45682WL08", "08-APR-2022", "", "2650", context),
                  ],
                ),
              ),
            if (cancelled)
              Container(
                child: Column(
                  children: [
                    cancelledOrders(
                        "15605", "08-APR-2022", "2650", context),
                    SizedBox(
                      height: countHeight(15, context),
                    ),
                    cancelledOrders(
                        "15605", "08-APR-2022", "2650", context),
                  ],
                ),
              ),
          ],
        )),
      ),
    );
  }
}
