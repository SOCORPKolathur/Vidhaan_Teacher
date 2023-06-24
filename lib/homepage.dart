import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vidhaan_teacher_dart/circulars.dart';
import 'package:vidhaan_teacher_dart/datepage.dart';
import 'package:vidhaan_teacher_dart/frontpage.dart';
import 'package:vidhaan_teacher_dart/profile_page.dart';
import 'package:vidhaan_teacher_dart/timetable.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  int _selectedIndex = 0;
  PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  List<Widget> _widgetOptions = <Widget>[
    Frontpage(),
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.white,

    ),
    profile()
  ];


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: Color(0xff3D8CF8),

          body: _widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: CreateBottombar(context),



    );
  }

  Container CreateBottombar(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.white,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),


          child:Container(
            height: 70,
            child: GNav(
              backgroundColor: Color(0xff3D8CF8),

                haptic: true,
                tabBorderRadius: 18,


                curve: Curves.easeOutExpo,
                duration: Duration(milliseconds: 600),
                gap: 8,
                color: Colors.white,
                activeColor: Colors.blue,
                iconSize: 26,

                tabBackgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                tabs: [
                  
                  GButton(
                    margin: EdgeInsets.only(left: 10),
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.message,
                    text: 'Messages',
                  ),
                  GButton(
                    icon:Icons.assignment,
                    text: 'Exams',
                  ),
                  GButton(
                    margin: EdgeInsets.only(right: 10),
                    icon: Icons.person_outline,
                    text: 'Profile',
                  )
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }   ),
          )




        ),
      ),
    );
  }
}
