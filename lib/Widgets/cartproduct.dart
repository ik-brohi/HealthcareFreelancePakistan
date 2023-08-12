import 'package:ecom/Widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

var total = 1;

Widget products(String image, String name, String desc, String price, context) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 10.0),
    child: Container(
      height: countHeight(150, context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              height: countHeight(110, context),
              width: countWidth(80, context),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            height: countHeight(175, context),
            width: countWidth(255, context),
            decoration: BoxDecoration(
              // color: Colors.grey[700],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 3.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        PopupMenuButton(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Icon(
                                Icons.more_vert_rounded,
                                color: Colors.grey,
                              ),
                            ),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Text("Remove"),
                                    value: 1,
                                  ),
                                  PopupMenuItem(
                                    child: Text("Add to Wishlist"),
                                    value: 2,
                                  )
                                ]),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          "Size :",
                          style: GoogleFonts.openSans(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          " S",
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),

                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 222, 222, 222),
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: LikeButton(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    padding:
                                        EdgeInsets.only(left: 2.5, top: 2.0),
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    size: 25.0,
                                    circleColor: CircleColor(
                                        start: Color(0xff00ddff),
                                        end: Color(0xff0099cc)),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Color(0xff33b5e5),
                                      dotSecondaryColor:
                                          Color.fromARGB(255, 2, 35, 46),
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        isLiked ? Icons.add : Icons.add,
                                        color: isLiked
                                            ? Colors.black
                                            : Colors.black,
                                        size: 20.0,
                                      );
                                    }),
                              )),
                        ),
                        SizedBox(
                          width: countWidth(7, context),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("1".toString()),
                        ),
                        SizedBox(
                          width: countWidth(7, context),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 222, 222, 222),
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                child: Center(
                                  child: LikeButton(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      padding:
                                          EdgeInsets.only(left: 2.5, top: 2.0),
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      size: 25.0,
                                      circleColor: CircleColor(
                                          start: Color.fromARGB(
                                              255, 246, 129, 129),
                                          end: Color.fromARGB(255, 204, 0, 0)),
                                      bubblesColor: BubblesColor(
                                        dotPrimaryColor: Color(0xff33b5e5),
                                        dotSecondaryColor:
                                            Color.fromARGB(255, 2, 35, 46),
                                      ),
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          isLiked
                                              ? Icons.horizontal_rule_outlined
                                              : Icons.horizontal_rule_outlined,
                                          color: isLiked
                                              ? Colors.black
                                              : Colors.black,
                                          size: 20.0,
                                        );
                                      }),
                                ),
                              )),
                        ),
                        Spacer(),
                        Text("999 Rs."),
                        SizedBox(
                          width: 5.0,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
