import 'package:ecom/Widgets/responsive.dart';
import 'package:ecom/Widgets/sizechart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class Details extends StatefulWidget {
  final String image;

  final String title;
  final String price;

  Details({


    required this.image,
    required this.price,
    required this.title,
  });
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: showContent()));
  }

  Widget showContent() {
    return ClipRRect(
      child: Column(
        children: [
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                expandedHeight: 450.0,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                    )),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: LikeButton(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            padding: EdgeInsets.only(left: 2.0),
                            mainAxisAlignment: MainAxisAlignment.center,
                            size: 25.0,
                            circleColor: CircleColor(
                                start: Color(0xff00ddff),
                                end: Color(0xff0099cc)),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Color(0xff33b5e5),
                              dotSecondaryColor: Color.fromARGB(255, 2, 35, 46),
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                isLiked
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_outline,
                                color: isLiked ? Colors.red : Colors.red,
                                size: 20.0,
                              );
                            }),
                      ),
                    ),
                  )
                ],
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: SizedBox(
                      height: 5000.0,
                      width: 250.0,
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: countWidth(100, context),
                            child: Text(
                              "Doctor Saif",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "Physiologist",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18.0,
                                    color: Colors.grey),
                              ),
                              Spacer(),
                              SizedBox(
                                width: countWidth(10, context),
                              ),
                              Text(
                                "999 RS",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18.0,
                                    color: Colors.blue[900]),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            child: Column(children: [
                          Align(
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(
                            height: countWidth(10, context),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Description",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.0,
                                  color: Colors.grey[600]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.",
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.",
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.This is sample of description.",
                                //  maxLines: 3,
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ])),
                        SizedBox(
                          height: 10.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Reviews",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 18.0,
                                color: Colors.grey[800]),
                          ),
                        ),
                        ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "5",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow[700],
                              ),
                            ],
                          ),
                          title: Text(
                            "User 1",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            "Very good health care service provider.",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "5",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow[700],
                              ),
                            ],
                          ),
                          title: Text(
                            "User 2",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            "Thanks for giving me relief from pain",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        // SizedBox(
                        //  ),
                        ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "5",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow[700],
                              ),
                            ],
                          ),
                          title: Text(
                            "User 3",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            "Great experience with the doctor nice personality",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Text(
                "Hire Now",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
