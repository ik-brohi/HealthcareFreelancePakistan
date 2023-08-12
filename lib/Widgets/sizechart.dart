import 'package:ecom/Widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget sizeChart(String size, Color bgcolor, Color textcolor, context) {
  return Container(
    decoration: BoxDecoration(
        color: bgcolor,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)),
    height: countHeight(45, context),
    width: countWidth(45, context),
    child: Center(
        child: Text(
      size.toUpperCase(),
      style: GoogleFonts.roboto(fontWeight: FontWeight.w600, color: textcolor),
    )),
  );
}
