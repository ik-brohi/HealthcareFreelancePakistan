import 'package:ecom/splashscreen.dart';
import 'package:flutter/material.dart';

import 'intro/intro_app.dart';

class onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  final List<Introduction> list = [
    Introduction(
      title: "Find Doctor",
      subTitle: "Let's find your desired Healthcare Specialist",
      imageUrl: 'Images/searchproduct.gif',
    ),
    Introduction(
      title: 'Book an Appointment',
      subTitle: 'Select your date and time to book an appointment',
      imageUrl: 'Images/date.png',
    ),
    Introduction(
      title: 'Door to Door',
      subTitle: 'Lets enjoy door to door healthcare facilitates',
      imageUrl: 'Images/door.jpg',
    ),
    Introduction(
      title: 'Track Appointment',
      subTitle: 'Track your appointment details and schedule',
      imageUrl: 'Images/track.gif',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: Colors.white,
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}
