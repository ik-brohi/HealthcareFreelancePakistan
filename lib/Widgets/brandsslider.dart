import 'package:ecom/Widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandSlider(
    String title, Color color, Image image, context, String desc) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 02.0, spreadRadius: 2),
        ],
        color: color,
      ),
      width: countWidth(270, context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              // decoration:
              //   BoxDecoration(border: Border.all(color: Colors.black)),
              height: countHeight(90, context),
              width: countWidth(100, context),
              child: image),
          Text(
            title.toString(),
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
          Text(
            desc.toString(),
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}
