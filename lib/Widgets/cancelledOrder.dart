import 'package:ecom/Widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cancelledOrders(
    String orderno, String orderdate, String amount, context) {
  Alignment alignleft = Alignment.topLeft;
  return Container(
    width: double.infinity,
    height: countHeight(127, context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 221, 221, 221),
          blurRadius: 2.0,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
              alignment: alignleft,
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Appointment No : $orderno",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600, fontSize: 18.0),
                    ),
                    Spacer(),
                    Text("$orderdate",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.normal,
                            fontSize: 17.0,
                            color: Colors.grey)),
                  ],
                ),
              )),
          Spacer(),
          Align(
              alignment: alignleft,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      height: countHeight(40, context),
                      width: countWidth(135, context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                          child: Text("Details",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0))),
                    ),
                    Spacer(),
                    Text("CANCELLED",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            color: Colors.red[600],
                            fontSize: 18.0)),
                  ],
                ),
              )),
        ],
      ),
    ),
  );
}
