import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar whiteappBar(String title) {
  return AppBar(
    title: Text(
      title.toUpperCase(),
      style: GoogleFonts.openSans(color: Colors.black),
    ),
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  );
}
