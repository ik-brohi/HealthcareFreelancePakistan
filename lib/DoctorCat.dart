import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/Widgets/responsive.dart';
import 'package:ecom/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widgets/catalogue.dart';

class DoctorCat extends StatefulWidget {
  final String name;
  DoctorCat({
     required this.name,
  });
  @override
  State<DoctorCat> createState() => _DoctorCatState();
}

class _DoctorCatState extends State<DoctorCat> {
  List brands = [
    Image.asset("Images/2.png"),
    Image.asset("Images/1.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.name.toUpperCase(),
          style: GoogleFonts.openSans(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        elevation: 0.00,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: countHeight(165, context),
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: 2,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  child: brands[itemIndex],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Hire Instant Healthcare Professional",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                  height: countHeight(225, context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "Images/p1.png",
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        "Images/p2.png",
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                  height: countHeight(225, context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "Images/p4.png",
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        "Images/p3.png",
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "All Available professionals",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(5),
                addRepaintBoundaries: true,
                childAspectRatio: 0.65,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                crossAxisCount: 2,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => Details(
                                price: "1050 Rs",
                                image: "Images/Doctor11.jpg",
                                title: "Doctor Farhan",
                              )));
                    },
                    child: catalogue(
                        "Images/Doctor11.jpg",
                        "Doctor Farhan",
                        "1050 Rs",
                        context),
                  ),
                  catalogue("Images/Doctor11.jpg", "Amir Ali", "629 Rs", context),
                  catalogue("Images/Doctor11.jpg", "Fahad Qureshi","499 Rs", context),
                  catalogue("Images/Doctor11.jpg", "Imran Khan", "799 Rs", context),
                  catalogue("Images/Doctor11.jpg", "Doctor Najam", "699 Rs", context),
                  catalogue("Images/Doctor11.jpg", "Saif Din", "629 Rs", context),
                  catalogue("Images/Doctor11.jpg", "Rafeeq", "499 Rs", context),
                  catalogue("Images/Doctor11.jpg", "Rahul Panjwani", "799 Rs", context),
                  catalogue("Images/Doctor11.jpg", "Rahib Ali", "699 Rs", context),
                  catalogue("Images/Doctor11.jpg", "Rizwan Khatak", "629 Rs", context),
                  catalogue("Images/Doctor11.jpg", "Meer Muhammad", "499 Rs", context),
                  catalogue("Images/Doctor11.jpg", "Roshin Ali", "1000 Rs", context ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
