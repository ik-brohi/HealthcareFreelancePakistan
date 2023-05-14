import 'package:ecom/Widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget catalogue(String image, String title, String orgprice,
     context) {
  return Container(
    decoration: BoxDecoration(),
    height: 125.0,
    child: Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Color.fromARGB(231, 184, 182, 182),
              height: countHeight(180, context),
              width: countWidth(160, context),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            )),
        SizedBox(
          height: 2.0,
        ),
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        "$orgprice".toUpperCase(),

                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          height: countHeight(90.5, context),
        ),
      ],
    ),
  );
}
