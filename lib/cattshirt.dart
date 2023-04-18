import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/Widgets/responsive.dart';
import 'package:ecom/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widgets/catalogue.dart';

class tshirtCata extends StatefulWidget {
  final String name;
  tshirtCata({
     required this.name,
  });
  @override
  State<tshirtCata> createState() => _tshirtCataState();
}

class _tshirtCataState extends State<tshirtCata> {
  List brands = [
    Image.asset("Images/pumapromotion.webp"),
    Image.asset("Images/johnplayerpromo.jpeg"),
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
                  "Latest Offers",
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
                        "Images/70percentoff.webp",
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        "Images/80percentoff.webp",
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
                        "Images/jackandjonespromotion.webp",
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        "Images/lifestylepromo.webp",
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
                  "All T-shirts",
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
                                brand: "higlender",
                                price: "1050",
                                discprice: "999",
                                image: "Images/tshirt6.jpeg",
                                title: "blue shirt with white pattern",
                              )));
                    },
                    child: catalogue(
                        "Images/tshirt6.jpeg",
                        "Casual lined blue shirt",
                        "highlender",
                        "1050",
                        "999",
                        context),
                  ),
                  catalogue("Images/tshirt1.jpeg", "Plain white shirt",
                      "highlender", "999", "629", context),
                  catalogue("Images/tshirt3.jpeg", "Long Green T-shirt", "NIKE",
                      "799", "499", context),
                  catalogue("Images/tshirt4.jpeg", "Nike short T-shirt", "NIKE",
                      "899", "799", context),
                  catalogue("Images/tshirt5.jpeg", "Formal plain black shirt",
                      "highlender", "999", "699", context),
                  catalogue("Images/tshirt1.jpeg", "Plain white shirt",
                      "highlender", "999", "629", context),
                  catalogue("Images/tshirt3.jpeg", "Long Green T-shirt", "NIKE",
                      "799", "499", context),
                  catalogue("Images/tshirt4.jpeg", "Nike short T-shirt", "NIKE",
                      "899", "799", context),
                  catalogue("Images/tshirt5.jpeg", "Formal plain black shirt",
                      "highlender", "999", "699", context),
                  catalogue("Images/tshirt1.jpeg", "Plain white shirt",
                      "highlender", "999", "629", context),
                  catalogue("Images/tshirt3.jpeg", "Long Green T-shirt", "NIKE",
                      "799", "499", context),
                  catalogue("Images/tshirt4.jpeg", "Nike short T-shirt", "NIKE",
                      "899", "799", context),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
