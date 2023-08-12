import 'package:ecom/Widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget orderStatus(String title, Color bg, Color textcolor, context) {
  return Container(
    height: countHeight(40, context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: bg,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title.toUpperCase(),
        style:
            GoogleFonts.openSans(color: textcolor, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
