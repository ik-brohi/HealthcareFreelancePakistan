import 'package:ecom/Widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget processingOrders(String orderno, String trackingid, String orderdate,
    String expecteddate, String qty, String amount, context) {
  Alignment alignleft = Alignment.topLeft;
  return Container(
    width: double.infinity,
    height: countHeight(155, context),
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
                      "Order No : $orderno",
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
          Align(
              alignment: alignleft,
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Tracking No : ",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.normal,
                          fontSize: 17.0,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      width: countWidth(15, context),
                    ),
                    Text("$trackingid",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600, fontSize: 18.0)),
                  ],
                ),
              )),
          Align(
              alignment: alignleft,
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Qty : ",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.normal,
                          fontSize: 17.0,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      width: countWidth(10, context),
                    ),
                    Text("$qty",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600, fontSize: 18.0)),
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
                    Text("PROCESSING",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[900],
                            fontSize: 18.0)),
                  ],
                ),
              )),
        ],
      ),
    ),
  );
}
