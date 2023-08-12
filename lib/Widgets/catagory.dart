import 'package:ecom/Widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget catagory(String title, String image, context) {
  return Container(
      child: Column(
    children: [
      Container(
        height: countHeight(50, context),
        width: countWidth(50, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(image),
        ),
      ),
      Text(
        title,
        style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
      ),
    ],
  ));
}
