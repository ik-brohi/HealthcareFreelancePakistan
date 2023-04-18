import 'package:ecom/Widgets/cartproduct.dart';
import 'package:ecom/Widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  final bool showbtn;
  Cart({required this.showbtn});
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Messages",
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: countHeight(25, context)),
              SizedBox(
                  height: countHeight(350, context),
                  child: Image.asset("Images/nomsg.gif")),
              Text(
                "No Messages Found",
                style: GoogleFonts.openSans(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
