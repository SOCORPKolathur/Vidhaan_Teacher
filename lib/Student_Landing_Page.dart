import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'StudentAttendance_Page.dart';
import 'StudentCircular_Page.dart';
import 'Student_home_Page.dart';
import 'const_file.dart';

class Student_landing_Page extends StatefulWidget {
  const Student_landing_Page({Key? key}) : super(key: key);

  @override
  State<Student_landing_Page> createState() => _Student_landing_PageState();
}

class _Student_landing_PageState extends State<Student_landing_Page> {

  int selecteIndexvalue=0;


  String Studentid='';
  String Studentname='';
  String Studentregno='';
  String Studentimg='';

  studentdetails() async {
    var document = await FirebaseFirestore.instance.collection("Students").get();
    for(int i=0;i<document.docs.length;i++){
      if(document.docs[i]["studentid"]==FirebaseAuth.instance.currentUser!.uid){
        setState(() {
          Studentid=document.docs[i].id;
        });
        print("Student:${Studentid}");
        print(Studentid);
      }
      if(Studentid.isNotEmpty){
        var studentdocument= await FirebaseFirestore.instance.collection("Students").doc(Studentid).get();
        Map<String,dynamic>?stuvalue=studentdocument.data();
        setState(() {
          Studentname=stuvalue!['stname'];
          Studentregno=stuvalue['regno'];
          Studentimg=stuvalue['imgurl'];
        });
      }
    };
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          //image and name and class(Profile )
          Material(
            elevation: 30,
            shadowColor: Colors.black12,
        color: Color(0xff2C79F1),
        borderRadius: BorderRadius.only(
            bottomLeft:Radius.circular(35)
        ),
            child: Container(
              height: 130,
              width: double.infinity,
             decoration:  BoxDecoration(
                 color: Color(0xff2C79F1),
               borderRadius: BorderRadius.only(
                 bottomLeft:Radius.circular(35)
               )
             ),
              child: Padding(
                padding:  EdgeInsets.only(top: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 15,),

                    //image
                    CircleAvatar(
                      radius: 38,
                      foregroundImage:AssetImage("assets/avator.png"),
                    ),
                    SizedBox(width: 20,),
                    //name and class text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width:180,
                          height: 20,
                          child: Text("Student Name",style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),),
                        ),

                        SizedBox(
                          width:180,
                          height: 20,
                          child: Text("ID :Student Class",style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),),
                        ),
                      ],
                    ),
                    SizedBox(width: 35,),
                    //more button
                    Icon(Icons.more_vert_outlined,color: Colors.white,)



                  ],
                ),
              )
            ),
          ),

          //body containers and contains


          Container(
            height: 500,
            width: double.infinity,
            //color:Color(0xffFEFCFF)
            color: Colors.white70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAttendance_Page(Studentid),));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.indigo),
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(child: Icon(Icons.calendar_month,size: 30,)),
                          ),
                          SizedBox(height: 3,),
                          Text("Attendance")
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Student_homework(Studentid),));

                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(child: Icon(Icons.calendar_month,size: 30,)),
                          ),
                          SizedBox(height: 3,),
                          Text("Homework")
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentCircular_Page(),));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(child: Icon(Icons.calendar_month,size: 30,)),
                          ),
                          SizedBox(height: 3,),
                          Text("Circulars")
                        ],
                      ),
                    )
                    
                    
                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    GestureDetector(
                      onTap: (){},
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(child: Icon(Icons.calendar_month,size: 30,)),
                          ),
                          SizedBox(height: 3,),
                          Text("Time Table")
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){},
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(child: Icon(Icons.calendar_month,size: 30,)),
                          ),
                          SizedBox(height: 3,),
                          Text("Homework")
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){},
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(child: Icon(Icons.calendar_month,size: 30,)),
                          ),
                          SizedBox(height: 3,),
                          Text("Circulars")
                        ],
                      ),
                    )

                  ],
                )
                
              ],
            ),
            
          )







        ],
      ),
      bottomNavigationBar: CreateBottombar(),
    );
  }



  Container CreateBottombar() {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      color: Colors.white,
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),

          child: Container(
            height: height / 10.8,
            child:

            GNav(
                backgroundColor: Color(0xff196EEF),
                haptic: true,
                tabBorderRadius: 18,
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 600),
                gap: 8,
                color: Colors.white,
                activeColor: Colors.blue,
                iconSize: 26,
                tabBackgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: width / 36, vertical: height / 151.2),
                tabs: [
                  GButton(
                    margin: EdgeInsets.only(left: width / 36),
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.message,
                    text: 'Messages',
                  ),
                  GButton(
                    icon: Icons.assignment,
                    text: 'Exams',
                  ),
                  GButton(
                    margin: EdgeInsets.only(right: width / 36),
                    icon: Icons.person_outline,
                    text: 'Profile',
                  )
                ],
                selectedIndex: selecteIndexvalue,
                onTabChange: onTabTapped
            ),
          )


      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      selecteIndexvalue = index;
    });

  }
}
