import 'package:ecom/Messages.dart';
import 'package:ecom/dashboard.dart';
import 'package:ecom/favourite.dart';
import 'package:ecom/myOrderpage.dart';
import 'package:ecom/profile.dart';
import 'package:ecom/profileDoctor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? role;
  @override
  void initState() {
    super.initState();
    _getRoleFromSharedPreferences();
  }

  Future<void> _getRoleFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      role = prefs.getString('role') ?? '';
    });
  }

  int index = 0;
  List pages = [
    Dashboard(),
    Messages(showbtn: false),
    MyOrders(),
    Profile(),
    ProfileDoctor(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, body: index==3 ? (role=='HEALTHCARE PROFESSIONAL' ? pages[4]: pages[3]): pages[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.white,
          elevation: 0.0,
          unselectedItemColor: Colors.grey[900],
          showSelectedLabels: false,
          selectedItemColor: Colors.grey[900],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "HOME",
              activeIcon: Icon(
                Icons.home_filled,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send_outlined),
              label: "Messages",
              activeIcon: Icon(
                Icons.send,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined),
              label: "Appointments",
              activeIcon: Icon(
                Icons.schedule,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp),
              label: "Profile",
              activeIcon: Icon(
                Icons.person,
              ),
            ),
          ]),
    );
  }
}
