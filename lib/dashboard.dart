import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/Widgets/catagory.dart';
import 'package:ecom/Widgets/catalogue.dart';
import 'package:ecom/Widgets/responsive.dart';
import 'package:ecom/cart.dart';
import 'package:ecom/doctorprofile.dart';
import 'package:ecom/detailpage.dart';
import 'package:ecom/notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    List brands = [
      Image.asset("Images/promo1.png"),
      Image.asset("Images/promo2.png"),
      Image.asset("Images/promo3.png"),
      Image.asset("Images/promo4.png"),
    ];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("Home", style: GoogleFonts.ubuntu(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: (() {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (builder) => Notifications()));
          }),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications,),
          ),
        ),
        actions: [
          GestureDetector(
           /* onTap: (() {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (builder) => Cart(showbtn: true)));
            }),*/
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.location_on_sharp,),
            ),
          ),
          GestureDetector(
            onTap: (() {
              Tooltip(
                child: Text("search Pressed"),
                message: "Search pressed",
              );
            }),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.grey[900]),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 150,
                    //aspectRatio: 25 / 9,
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
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    child: brands[itemIndex],
                  ),
                ),
                SizedBox(
                  height: countHeight(5, context),
                ),

                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      //    verticalDirection: VerticalDirection.down,
                      children: [
                        GestureDetector(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => tshirtCata(
                                      name: "Psychologists",
                                    )));
                          }),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: catagory(
                                "Physiologist", "Images/generalphysican.png", context),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => tshirtCata(
                                      name: "Neurologists",
                                    )));
                          }),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                catagory("Neurologist", "Images/Neurologist.png", context),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => tshirtCata(
                                      name: "Epidemiologists",
                                    )));
                          }),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                catagory("Epidemiologist", "Images/Epidemiologist.png", context),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => tshirtCata(
                                      name: "Chaplains",
                                    )));
                          }),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: catagory(
                                "Chaplain", "Images/Chaplain.png", context),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => tshirtCata(
                                      name: "Nurses",
                                    )));
                          }),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: catagory(
                                "Nurse", "Images/Nurse.png", context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => tshirtCata(name: "summer SAle")));
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Online Healthcare Professionals",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: countHeight(278, context),
                      //width: countWidth(350, context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (builder) =>
                                      tshirtCata(name: "HRX")));
                            }),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Image.asset(
                                  "Images/onlinespecialist.png",
                                  fit: BoxFit.fill,
                                  //   height: 300.0,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (builder) =>
                                      tshirtCata(name: "wrong")));
                            }),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Image.asset(
                                  "Images/onlinenurse.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) =>
                            tshirtCata(name: "featured brands")));
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Healthcare Tips",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => tshirtCata(name: "LEVIS")));
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: countHeight(195, context),
                                  width: countWidth(360, context),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 90, 163, 234),
                                    //borderRadius: BorderRadius.circular(10),
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Image.asset(
                                      "Images/healthcaretips.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                // Container(
                                //   height: countHeight(195, context),
                                //   width: countWidth(150, context),
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(10),
                                //
                                //   ),
                                //   // child: Image.asset(
                                //   //   "Images/levisdiscount.webp",
                                //   //   fit: BoxFit.fill,
                                //   // ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Tips",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700, fontSize: 18.0),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "To ensure your health",
                              style: GoogleFonts.openSans(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 5.0,
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => tshirtCata(name: "trending")));
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(5),
                    addRepaintBoundaries: true,
                    childAspectRatio: 0.62,
                    crossAxisSpacing: 9.9,
                    mainAxisSpacing: 15.0,
                    crossAxisCount: 2,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => Details(
                                    price: "1050 RS",
                                    image: "Images/doctor1.jpg",
                                    title: "Doctor Saif",
                                  )));
                        },
                        child: catalogue(
                            "Images/doctor1.jpg",
                            "Doctor Saif",
                            "2000 Rs",
                            context),
                      ),
                      catalogue("Images/doctor2.png", "Maria Ali", "1000 Rs", context),
                      catalogue("Images/doctor1.jpg", "M Din", "1500 Rs", context),
                      catalogue("Images/doctor1.jpg",
                          "Abdul Salam", "1000 Rs", context),
                      catalogue(
                          "Images/doctor1.jpg",
                          "Doctor Shamas",
                          "3000 Rs",
                          context),
                      catalogue(
                          "Images/doctor1.jpg",
                          "Asad Ali",
                          "1000 Rs",
                          context),
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
