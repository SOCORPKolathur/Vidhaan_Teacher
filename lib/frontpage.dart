import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Frontpage extends StatefulWidget {
  const Frontpage({Key? key}) : super(key: key);

  @override
  State<Frontpage> createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage>
    with SingleTickerProviderStateMixin {

  List<dynamic> _locations = [
        "6th Grade B Section",

        "7th Grade B Section",

        " 8th Grade B Section",

        "9th Grade B Section",

        "10th Grade B Section",



  ];
  String? _selectedLocation;


  int tabar = 1;


 final GlobalKey <ScaffoldState>  key =GlobalKey();

  int currentDate = 0;
  int cyear = 0;
  String cmonth = "";
  String day = "";
  String month = "";
  String page = "Home";
  String getMonth(int currentMonthIndex) {
    return DateFormat('MMM').format(DateTime(0, currentMonthIndex)).toString();
  }
  Date() {
    setState(() {
      day = DateFormat('EEEE').format(DateTime.now());

      cyear = DateTime.now().year;
      cmonth = getMonth(DateTime.now().month);

      currentDate = DateTime.now().day;

    });

    print(day);
    print(currentDate);
  }

  @override
  void initState() {

    getstaffdetails();
    Date();
    dayfun();

    super.initState();
  }

  bool isSelected = false;
  int Selectedindex = 0;


  bool isSelectedb = false;
  String staffid="";
  String staffname="";
  String staffregno="";
  getstaffdetails() async {
    var document = await FirebaseFirestore.instance.collection("Staffs").get();
    for(int i=0;i<document.docs.length;i++){
      if(document.docs[i]["userid"]==FirebaseAuth.instance.currentUser!.uid){
        setState(() {
          staffid=document.docs[i].id;
        });
      }
    };
    var document2 =  await FirebaseFirestore.instance.collection("Staffs").doc(staffid).get();
    Map<String,dynamic>? value = document2.data();
    setState(() {
      staffname=value!["stname"];
      staffregno=value["regno"];

    });
  }
demo(){

}
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: key,
      backgroundColor: Color(0xff3D8CF8),
     endDrawer: Drawer(

     ),
      body: WillPopScope(
        onWillPop: () {
          if (page == "Home") {
            Navigator.pop(context);
          } else {
            setState(() {
              page = "Home";
            });
          }
          return demo();
        },
        child: SingleChildScrollView(
         physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.ease,
                height: page == "Home" ? height / 2.256 :
                page == "Attendance" ? height / 3.656 :
                page == "Home Works" ? height / 3.656 :
                page == "Behaviour" ? 76.123 :
                page == "Circulars" ? 76.123 :
                page == "Time Table" ? 76.123 :
                page == "Messages" ? 76.123 : 0,




                child:   page == "Circulars" ||  page == "Behaviour" ||
                    page == "Time Table" ||  page == "Messages"? Container() : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    page == "Attendance" ||  page == "Home Works" ? Container() : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 50),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      staffname,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 30),
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(right: 10),
                                            height: height / 20.47,
                                            width: width / 10.333,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child:
                                                Image.asset("assets/bell.png")),
                                        GestureDetector(
                                          onTap: (){
                                            key.currentState!.openEndDrawer();
                                          },
                                          child: Container(
                                              height: height / 15.74,
                                              width: width / 7.4,
                                              child: Image.asset(
                                                "assets/image.png",
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                      ],
                                    ),

                                    /// two image containers
                                  ],
                                ),
                              ), // headline

                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "ID : ${staffregno}",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ), //
                            ],
                          ),




                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: height / 368.5), // id
                        SizedBox( height: height / 30.566,),


                        Divider(
                          color: Colors.white,
                          thickness: 1.5,
                          endIndent: 10,
                          indent: 10,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "This week",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20 ),
                                  ),
                                  SizedBox(width: width * 2 / 368.5),
                                  Icon(
                                    Icons.info_outline_rounded,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ],
                              ),

                              /// select Date

                              Row(
                                children: [
                                  Container(
                                      height: height / 24.566,
                                      width: width / 12,
                                      child: Image.asset(
                                        "assets/Date.png",
                                        fit: BoxFit.cover,
                                        color: Colors.white,
                                      )),
                                  SizedBox(width: width / 150),
                                  Text(
                                    "${cmonth.toString()} ${cyear.toString()}",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                  ),
                                ],
                              ),

                              /// current year
                            ],
                          ),
                        ),

                        SizedBox(height: height / 50.944),

                        /// Select Date

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height / 9.2125,
                                width: width / 7.5,
                                decoration: BoxDecoration(
                                    color: day == "Monday"
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [

                                    Text(
                                      "Mo",
                                      style: GoogleFonts.poppins(
                                          color: day == "Monday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: height / 49.133),
                                    Text(
                                      Day1.toString(),
                                      style: GoogleFonts.poppins(
                                          color: day == "Monday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height / 9.2125,
                                width: width / 7.5,
                                decoration: BoxDecoration(
                                    color: day == "Tuesday"
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Tu",
                                      style: GoogleFonts.poppins(
                                          color: day == "Tuesday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: height / 49.133),
                                    Text(
                                      Day2.toString(),
                                      style: GoogleFonts.poppins(
                                          color: day == "Tuesday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height / 9.2125,
                                width: width / 7.5,
                                decoration: BoxDecoration(
                                    color: day == "Wednesday"
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    Text(
                                      "We",
                                      style: GoogleFonts.poppins(
                                          color: day == "Wednesday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: height / 49.133),
                                    Text(
                                      Day3.toString(),
                                      style: GoogleFonts.poppins(
                                          color: day == "Wednesday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height / 9.2125,
                                width: width / 7.5,
                                decoration: BoxDecoration(
                                    color: day == "Thursday"
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Th",
                                      style: GoogleFonts.poppins(
                                          color: day == "Thursday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: height / 49.133),
                                    Text(
                                      Day4.toString(),
                                      style: GoogleFonts.poppins(
                                          color: day == "Thursday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height / 9.2125,
                                width: width / 7.5,
                                decoration: BoxDecoration(
                                    color: day == "Friday"
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Fr",
                                      style: GoogleFonts.poppins(
                                          color: day == "Friday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: height / 49.133),
                                    Text(
                                      Day5.toString(),
                                      style: GoogleFonts.poppins(
                                          color: day == "Friday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height / 9.2125,
                                width: width / 7.5,
                                decoration: BoxDecoration(
                                    color: day == "Saturday"
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Sa",
                                      style: GoogleFonts.poppins(
                                          color: day == "Saturday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: height / 49.133),
                                    Text(
                                      Day6.toString(),
                                      style: GoogleFonts.poppins(
                                          color: day == "Saturday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height / 9.2125,
                                width: width / 7.5,
                                decoration: BoxDecoration(
                                    color: day == "Sunday"
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Su",
                                      style: GoogleFonts.poppins(
                                          color: day == "Sunday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: height / 49.133),
                                    Text(
                                      Day7.toString(),
                                      style: GoogleFonts.poppins(
                                          color: day == "Sunday"
                                              ? Colors.blue
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ), // Dasy

                        SizedBox(height: height / 120.33),

                        Padding(
                          padding:    day == "Monday"? EdgeInsets.only(left:2):
                        day == "Tuesday"?EdgeInsets.only(left:52):
                        day == "Wednesday"?EdgeInsets.only(left:102):
                        day == "Thursday"?EdgeInsets.only(left:156):
                        day == "Friday"?EdgeInsets.only(left:208):
                        day == "Saturday"?EdgeInsets.only(left:242):
                          day == "Sunday"?EdgeInsets.only(left:290):EdgeInsets.only(left:0),
                          child: Container(

                            height: 2,
                            width:  70,
                           color: Colors.white

                          ),
                        ),

                        Container(

                          height: 1,
                          width:  380,
                          color: Colors.white,

                        )

                      ],
                    ),

                  ],
                ) ,
              ),

              SizedBox(height: height / 52.125),

              Stack(
                children: [

                  Container(
                    height: height / 24.566,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                        height:
                            page == "Home" ? height / 1.474 : height / 1.1338,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(35),
                                topLeft: Radius.circular(35))),
                        child: page == "Home"
                            ? Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(top:0.0,left:8),
                                     child: Text(
                                       "Dashboard,",
                                       style: GoogleFonts.poppins(
                                           color: Colors.blueAccent,
                                           fontSize: 22,
                                           fontWeight:
                                           FontWeight.w700),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(top: 20.0),
                                     child: Row(
                                       mainAxisAlignment:
                                       MainAxisAlignment.spaceEvenly,
                                       children: [
                                         GestureDetector(
                                           onTap: () {
                                             setState(() {
                                               page = "Attendance";
                                             });
                                           },
                                           child: Column(
                                             children: [
                                               Image.asset(
                                                   "assets/calendar.png"),
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Text(
                                                   "Attendance",
                                                   style: GoogleFonts.poppins(
                                                       color: Colors.black,
                                                       fontSize: 14,
                                                       fontWeight:
                                                       FontWeight.w500),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),

                                         /// Attendance

                                         GestureDetector(
                                           onTap: () {
                                             setState(() {
                                               page = "Home Works";
                                             });
                                           },
                                           child: Column(
                                             children: [
                                               Image.asset("assets/edit.png"),

                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Text(
                                                   "Home Works",
                                                   style: GoogleFonts.poppins(
                                                       color: Colors.black,
                                                       fontSize: 14,
                                                       fontWeight:
                                                       FontWeight.w500),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),

                                         ///  home works

                                         GestureDetector(
                                           onTap: () {
                                             setState(() {
                                               page = "Behaviour";
                                             });
                                           },
                                           child: Column(
                                             children: [
                                               Image.asset("assets/user.png"),
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Text(
                                                   "Behaviour",
                                                   style: GoogleFonts.poppins(
                                                       color: Colors.black,
                                                       fontSize: 14,
                                                       fontWeight:
                                                       FontWeight.w500),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),

                                         ///  behaviour
                                       ],
                                     ),
                                   ),

                                   SizedBox(height:40),

                                   Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.spaceEvenly,
                                     children: [
                                       GestureDetector(
                                         onTap: () {
                                           setState(() {
                                             page = "Circulars";
                                           });
                                         },
                                         child: Column(
                                           children: [
                                             Image.asset(
                                                 "assets/important.png"),
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Text(
                                                 "Circulars",
                                                 style: GoogleFonts.poppins(
                                                     color: Colors.black,
                                                     fontSize: 14,
                                                     fontWeight:
                                                     FontWeight.w500),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),

                                       /// circulars

                                       GestureDetector(
                                         onTap: () {
                                           setState(() {
                                             page = "Time Table";
                                           });
                                         },
                                         child: Column(
                                           children: [
                                             Image.asset("assets/time.png"),
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Text(
                                                 "Time Table",
                                                 style: GoogleFonts.poppins(
                                                     color: Colors.black,
                                                     fontSize: 14,
                                                     fontWeight:
                                                     FontWeight.w500),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),

                                       /// attendance

                                       GestureDetector(
                                         onTap: () {
                                           setState(() {
                                             page = "Messages";
                                           });
                                         },
                                         child: Column(
                                           children: [
                                             Image.asset("assets/message.png"),
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Text(
                                                 "Messages",
                                                 style: GoogleFonts.poppins(
                                                     color: Colors.black,
                                                     fontSize: 14,
                                                     fontWeight:
                                                     FontWeight.w500),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),

                                       /// messages
                                     ],
                                   ),

                                 ],


                                  ),
                              )
                            : page == "Circulars"
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 60),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                     
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              page = "Home";
                                            });
                                          },
                                          child: Text(
                                            "Circulars",
                                            style: GoogleFonts.poppins(
                                                color: Colors.blueAccent,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),

                                        SizedBox(
                                          height: height / 368.5,
                                        ),

                                        Row(
                                          children: [
                                            Text(
                                              "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(width: width / 33.333),
                                            Container(
                                              height: height / 49.133,
                                              width: width / 170,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: width / 33.333),
                                            Text(
                                              formatterDate.toString(),
                                              style: GoogleFonts.poppins(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),

                                        /// date/day

                                        SizedBox(height: height / 184.25),

                                        Divider(
                                          color: Colors.grey.shade400,
                                          thickness: 1,
                                        ),

                                        Flexible(
                                          child: ListView(
                                            shrinkWrap: true,
                                              physics: ScrollPhysics(),
                                              children: [
                                                
                                                SizedBox(height: height / 184.25),


                                                StreamBuilder(
                                                    stream: FirebaseFirestore.instance.collection("Circulars").snapshots(),

                                                    builder: (context , snapshot) {
                                                      return ListView.builder(
                                                          shrinkWrap: true,
                                                          physics: NeverScrollableScrollPhysics(),
                                                          itemCount: snapshot.data!.docs.length,
                                                          itemBuilder: (context , index) {
                                                            return Container(
                                                              height: height / 4.60625,
                                                              width: width / 1.0714,
                                                              margin: EdgeInsets.only(bottom: 25),
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius:
                                                                  BorderRadius.circular(12),
                                                                  border: Border.all(
                                                                      color: Colors.black)),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(10),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.spaceEvenly,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Image.asset(
                                                                            "assets/Exlmtry.png"),
                                                                        SizedBox(width: width / 60),
                                                                        Text(
                                                                          snapshot.data!.docs[index]["Descr"],
                                                                          style:
                                                                          GoogleFonts.poppins(
                                                                              color:
                                                                              Colors.black,
                                                                              fontSize: 16,
                                                                              fontWeight:
                                                                              FontWeight
                                                                                  .w600),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(height: height / 73.7),
                                                                    Expanded(
                                                                      child: Text(
                                                                        snapshot.data!.docs[index]["reason"],
                                                                        style: GoogleFonts.poppins(
                                                                            color: Colors.black,
                                                                            fontSize: 15,
                                                                            fontWeight:
                                                                            FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",

                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  color: Colors
                                                                                      .grey
                                                                                      .shade700,
                                                                                  fontSize: 15,
                                                                                  fontWeight:
                                                                                  FontWeight
                                                                                      .w500),
                                                                            ),
                                                                            SizedBox(
                                                                                width:
                                                                                width / 33.33),
                                                                            Container(
                                                                              height:
                                                                              height / 49.133,
                                                                              width: width / 170,
                                                                              color: Colors.grey,
                                                                            ),
                                                                            SizedBox(
                                                                                width:
                                                                                width / 33.33),
                                                                            Text(
                                                                              currentTime,
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                  color: Colors
                                                                                      .grey
                                                                                      .shade700,
                                                                                  fontSize: 15,
                                                                                  fontWeight:
                                                                                  FontWeight
                                                                                      .w500),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          snapshot.data!.docs[index]["From "],

                                                                          style:
                                                                          GoogleFonts.poppins(
                                                                              color:
                                                                              Colors.green,
                                                                              fontSize: 16,
                                                                              fontWeight:
                                                                              FontWeight
                                                                                  .w600),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),

                                                              ),

                                                            );
                                                          }
                                                      );
                                                    }
                                                ),

                                                ///   circular container

                                                SizedBox(height: height / 36.85),

                                                SizedBox(height: 200,)   
                                                
                                                ]),
                                        ),

                                      ],
                                    ),
                                  )
                                : page == "Home Works"
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 50),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  page = "Home";
                                                });
                                              },
                                              child: Text(
                                                "HomeWork",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.blueAccent,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),

                                            Row(
                                              children: [
                                                Text(
                                                  "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors
                                                          .grey.shade700,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: width / 33.33,
                                                ),
                                                Container(
                                                  height: height / 49.133,
                                                  width: width / 170,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width: width / 33.33,
                                                ),
                                                Text(
                                                  day,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors
                                                          .grey.shade700,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),

                                            /// date/day

                                            SizedBox(height: height / 36.85),

                                            Divider(
                                              color: Colors.grey.shade400,
                                              thickness: 1.5,
                                            ),

                                            Flexible(
                                              child: ListView(
                                                shrinkWrap: true,
                                                  physics: ScrollPhysics(),
                                                  children: [
                                                    SizedBox(height: height / 73.7),


                                                    Center(
                                                      child: Container(
                                                        padding: EdgeInsets.only(left: 10,right: 10),
                                                        height: height / 14.74,
                                                        width: width / 1.363,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: Colors.grey.shade300),
                                                            borderRadius:
                                                            BorderRadius.circular(10)),
                                                        child: DropdownButton(
                                                          underline: SizedBox(),
                                                          isExpanded : true,

                                                          value: _selectedLocation,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              _selectedLocation = newValue.toString();
                                                            });
                                                          },
                                                          items: _locations.map((location) {
                                                            return DropdownMenuItem(
                                                              child: new Text(location,style: GoogleFonts.poppins(
                                                                  fontSize: 19,
                                                                  fontWeight: FontWeight.w600,
                                                                  color: Colors.blue
                                                              ),),
                                                              value: location,
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ),

                                                    /// Center Container

                                                    SizedBox(height: height / 73.7),

                                                    Divider(
                                                      color: Colors.grey.shade400,
                                                      thickness: 1.5,
                                                    ),

                                                    SizedBox(height: height / 36.85),

                                                    Center(
                                                      child: Text(
                                                        "Type todays Home Work",
                                                        style: GoogleFonts.poppins(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight.w600),
                                                      ),
                                                    ),

                                                    /// today homework

                                                    SizedBox(height: height / 36.85),

                                                    Center(
                                                      child: Container(
                                                        padding: EdgeInsets.only(
                                                            top: 20, left: 18),
                                                        height: height / 3.685,
                                                        width: width / 1.2636,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: Colors.grey),
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                12)),
                                                        child: TextField(
                                                          controller: homecoller,
                                                          keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                          maxLines: 5,
                                                          minLines: 1,
                                                          decoration:
                                                          InputDecoration(
                                                              hintText:
                                                              "English - Read Lessons Fully",
                                                              hintStyle:
                                                              GoogleFonts
                                                                  .poppins(
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                              ),
                                                              border:
                                                              InputBorder
                                                                  .none),
                                                        ),
                                                      ),
                                                    ),

                                                    /// center container

                                                    SizedBox(height: height / 49.133),

                                                    Center(
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          add();
                                                        },
                                                        child: Container(
                                                          height: height / 16.37,
                                                          width: width / 2.3636,
                                                          decoration: BoxDecoration(
                                                              color: Color(0xff609F00),
                                                              border: Border.all(
                                                                  color: Colors.grey),
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  7)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                "Assign Now",
                                                                style:
                                                                GoogleFonts.poppins(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                              ),
                                                              Image.asset(
                                                                  "assets/notes.png")
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(height:400), 
                                                    
                                                    
                                                    
                                                    ]),
                                            ),

                                          ],
                                        ),
                                      )
                                    : page == "Attendance"
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30.0),
                                            child: Container(
                                              height: height / 29.48,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  35),
                                                          topLeft:
                                                              Radius.circular(
                                                                  35))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 4),
                                                child:Column(
                                                  crossAxisAlignment:CrossAxisAlignment.start,
                                                  
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          page = "Home";
                                                        });
                                                      },
                                                      child: Text(
                                                        "Attendance",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .blueAccent,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),

                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                        SizedBox(
                                                          width: width / 100,
                                                        ),

                                                        Container(
                                                          height:
                                                              height / 49.13,
                                                          width: width / 170,
                                                          color: Colors.grey,
                                                        ),

                                                        SizedBox(
                                                          width: width / 100,
                                                        ),
                                                        Text(
                                                          day,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                      ],
                                                    ),

                                                    /// date/day

                                                    SizedBox(
                                                      height: height / 49.13,
                                                    ),

                                                    Divider(
                                                      color:
                                                          Colors.grey.shade400,
                                                      thickness: 1.5,
                                                    ),

                                                    Flexible(
                                                      child: ListView(
                                                        shrinkWrap: true,
                                                        physics: ScrollPhysics(),
                                                        children: [SizedBox(
                                                          height: height / 49.13,
                                                        ),

                                                          Center(
                                                            child: Container(
                                                              padding: EdgeInsets.only(left: 10,right: 10),
                                                              height: height / 14.74,
                                                              width: width / 1.363,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  border: Border.all(
                                                                      color: Colors.grey.shade300),
                                                                  borderRadius:
                                                                  BorderRadius.circular(10)),
                                                              child: DropdownButton(
                                                                underline: SizedBox(),
                                                                isExpanded : true,

                                                                value: _selectedLocation,
                                                                onChanged: (newValue) {
                                                                  setState(() {
                                                                    _selectedLocation = newValue.toString();
                                                                  });
                                                                },
                                                                items: _locations.map((location) {
                                                                  return DropdownMenuItem(
                                                                    child: new Text(location,style: GoogleFonts.poppins(
                                                                        fontSize: 19,
                                                                        fontWeight: FontWeight.w600,
                                                                        color: Colors.blue
                                                                    ),),
                                                                    value: location,
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          ),

                                                          /// Grade Container

                                                          SizedBox(
                                                            height: height / 49.13,
                                                          ),

                                                          Divider(
                                                            color:
                                                            Colors.grey.shade400,
                                                            thickness: 1.5,
                                                          ),

                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                  width: width / 8),
                                                              Text(
                                                                "Name",
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                              ),
                                                              SizedBox(
                                                                  width: width / 4),
                                                              Text(
                                                                "Present",
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                              ),
                                                              SizedBox(
                                                                  width: width / 10),
                                                              Text(
                                                                "Absent",
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                              ),
                                                            ],
                                                          ),

                                                          ///  title

                                                          SizedBox(
                                                              height: height / 29.48),

                                                          StreamBuilder(
                                                              stream: FirebaseFirestore.instance.collection(
                                                                  "Students")
                                                                  .snapshots(),
                                                              builder: (context,
                                                                  snapshot) {
                                                                return ListView.builder(
                                                                    itemCount: snapshot.data!.docs.length,
                                                                    physics: NeverScrollableScrollPhysics(),
                                                                    shrinkWrap: true,
                                                                    itemBuilder:(BuildContextcontext, index) {
                                                                      return Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(bottom: 15),
                                                                            child: Container(
                                                                              height: height / 24.56,
                                                                              width: width / 4,
                                                                              child: Text(
                                                                                snapshot.data!.docs[index]["name"],
                                                                                style: GoogleFonts.poppins(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                bottom: 20,
                                                                                left: 8),
                                                                            child:
                                                                            Container(
                                                                              height:
                                                                              height / 29.48,
                                                                              width:
                                                                              width / 10,
                                                                              decoration:
                                                                              BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.blueAccent.shade700)),
                                                                              child: InkWell(
                                                                                  onTap: () {
                                                                                    present(snapshot.data!.docs[index].id);
                                                                                  },
                                                                                  child: GestureDetector(
                                                                                      onTap: () {},
                                                                                      child: Icon(
                                                                                        snapshot.data!.docs[index]["isSelected"] == true ? Icons.check : null,
                                                                                        color: Colors.blueAccent.shade700,
                                                                                      ))),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                            const EdgeInsets.only(bottom: 20),
                                                                            child:
                                                                            Container(
                                                                              height:
                                                                              height / 29.48,
                                                                              width:
                                                                              width / 10,
                                                                              decoration:
                                                                              BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.red)),
                                                                              child:
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  absent(snapshot.data!.docs[index].id);
                                                                                },
                                                                                child: Icon(
                                                                                  snapshot.data!.docs[index]["isSelected"] == false ? Icons.clear : null,
                                                                                  color: Colors.red,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),


                                                                        ],
                                                                      );
                                                                    });
                                                              }),
                                                          SizedBox(height: 300,)
                                                        ]
                                                      ),
                                                    ),

                                                   

                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        : page == "Behaviour"
                                            ? Padding(
                                                padding:  EdgeInsets.only(
                                                    top: 30.0),
                                                child: Container(
                                                  height:height / 1.133,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(topRight: Radius.circular(35),
                                                              topLeft: Radius.circular(35))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            top: 8),
                                                    child: Column(
                                                    
                                                     crossAxisAlignment:CrossAxisAlignment.start,
                                                     
                                                      children: [

                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              page = "Home";
                                                            });
                                                          },
                                                          child: Text(
                                                            "Behaviour",
                                                            style: GoogleFonts.poppins(
                                                                color: Colors
                                                                    .blueAccent,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: height /
                                                                92.125),
                                                        Text(
                                                          "Student report",
                                                          style: GoogleFonts
                                                              .poppins(
                                                              color: Colors
                                                                  .grey
                                                                  .shade700,
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600),
                                                        ),

                                                        SizedBox(
                                                            height:
                                                            height / 36.85),

                                                        Divider(
                                                          color: Colors.grey.shade400,
                                                          thickness: 1,
                                                        ),
                                                        
                                                        
                                                        Flexible(
                                                          child: ListView(
                                                            shrinkWrap: true,
                                                            physics: ScrollPhysics(),
                                                            children: [SizedBox(height: height / 82.642),

                                                              Center(
                                                                child: Container(
                                                                  padding: EdgeInsets.only(left: 10,right: 10),
                                                                  height: height / 14.74,
                                                                  width: width / 1.363,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors.white,
                                                                      border: Border.all(
                                                                          color: Colors.grey.shade300),
                                                                      borderRadius:
                                                                      BorderRadius.circular(10)),
                                                                  child: DropdownButton(
                                                                    underline: SizedBox(),
                                                                    isExpanded : true,

                                                                    value: _selectedLocation,
                                                                    onChanged: (newValue) {
                                                                      setState(() {
                                                                        _selectedLocation = newValue.toString();
                                                                      });
                                                                    },
                                                                    items: _locations.map((location) {
                                                                      return DropdownMenuItem(
                                                                        child: new Text(location,style: GoogleFonts.poppins(
                                                                            fontSize: 19,
                                                                            fontWeight: FontWeight.w600,
                                                                            color: Colors.blue
                                                                        ),),
                                                                        value: location,
                                                                      );
                                                                    }).toList(),
                                                                  ),
                                                                ),
                                                              ),



                                                              /// Center Container

                                                              SizedBox(
                                                                  height: height /
                                                                      52.642),

                                                              Divider(
                                                                color: Colors
                                                                    .grey.shade400,
                                                                thickness: 1,
                                                              ),

                                                              SizedBox(
                                                                  height:
                                                                  height / 73.7),

                                                              Center(
                                                                child: Text(
                                                                  "Click the Student to change their value",
                                                                  style: GoogleFonts.poppins(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade600,
                                                                      fontSize: 14,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                                ),
                                                              ),

                                                              /// today homework

                                                              Container(
                                                                padding:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 25,
                                                                    top: 15),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Name",
                                                                      style: GoogleFonts.poppins(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                          15,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                    ),
                                                                    Text(
                                                                      "Value",
                                                                      style: GoogleFonts.poppins(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                          15,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                          decoration:
                                                                          TextDecoration
                                                                              .underline),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                              /// Name

                                                              StreamBuilder(
                                                                  stream: FirebaseFirestore.instance.collection("Students").snapshots(),
                                                                  builder: (context , snapshot) {
                                                                    return ListView.builder (
                                                                        shrinkWrap: true,
                                                                        physics: NeverScrollableScrollPhysics(),
                                                                        itemCount: snapshot.data!.docs.length,
                                                                        itemBuilder: (context , index) {
                                                                          return Container(
                                                                            padding:
                                                                            EdgeInsets.only(
                                                                                left: 20,
                                                                                right: 25,
                                                                                top: 15),
                                                                            child: Row(
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment
                                                                                  .spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  snapshot.data!.docs[index]["name"],
                                                                                  style: GoogleFonts.poppins(
                                                                                      color: Colors
                                                                                          .black,
                                                                                      fontSize:
                                                                                      15,
                                                                                      fontWeight:
                                                                                      FontWeight
                                                                                          .w600),
                                                                                ),
                                                                                GestureDetector(
                                                                                  onTap: ()  {

                                                                                    value( snapshot.data!.docs[index].id);


                                                                                  },
                                                                                  child: Container(
                                                                                    height: height /
                                                                                        29.48,
                                                                                    width:
                                                                                    width / 3.6,
                                                                                    decoration: BoxDecoration(
                                                                                        color: Colors
                                                                                            .green,
                                                                                        borderRadius:
                                                                                        BorderRadius.circular(
                                                                                            5)),
                                                                                    child: Row(
                                                                                      mainAxisAlignment:
                                                                                      MainAxisAlignment
                                                                                          .spaceEvenly,
                                                                                      children: [
                                                                                        Image.asset(
                                                                                            "assets/thumup.png"),
                                                                                        Text(
                                                                                          "Good",
                                                                                          style: GoogleFonts.poppins(
                                                                                              color: Colors
                                                                                                  .white,
                                                                                              fontSize:
                                                                                              15,
                                                                                              fontWeight:
                                                                                              FontWeight.w600),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),


                                                                              ],
                                                                            ),
                                                                          );
                                                                        }
                                                                    );
                                                                  }
                                                              ),
                                                              ///  good

                                                              SizedBox(height: 150,),
                                                              
                                                              
                                                              
                                                            ]
                                                          ),
                                                        ),

                                                       



                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : page == "Time Table"
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 30.0),
                                                    child: Container(
                                                      height: height / 1.474,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius.circular(35),
                                                                  topLeft: Radius.circular(35))),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                         // physics: NeverScrollableScrollPhysics(),
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  page = "Home";
                                                                });
                                                              },
                                                              child: Text(
                                                                "Time Table",
                                                                style: GoogleFonts.poppins(
                                                                    color: Colors
                                                                        .blueAccent,
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              height: height /
                                                                  92.125,
                                                            ),

                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                                                                  style: GoogleFonts.poppins(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade700,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                SizedBox(
                                                                    width: width /
                                                                        33.33),
                                                                Container(
                                                                  height:
                                                                      height /
                                                                          49.133,
                                                                  width: width /
                                                                      260,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                SizedBox(
                                                                    width: width /
                                                                        33.33),
                                                                Text(
                                                                  day,
                                                                  style: GoogleFonts.poppins(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade700,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ],
                                                            ),

                                                            /// date/day

                                                            SizedBox(
                                                                height: height /
                                                                    36.85),

                                                            Divider(
                                                              color:
                                                                  Colors.black,
                                                              thickness: 0.5,
                                                            ),

                                                            Flexible(
                                                              child: ListView(
                                                                shrinkWrap: true,
                                                                physics: ScrollPhysics(),
                                                                children: [
                                                                  // SizedBox(
                                                                  //     height: height /
                                                                  //         49.133),

                                                                     SizedBox(
                                                                      height: height /
                                                                          122.83),

                                                                  Container(
                                                                    margin: EdgeInsets.only(bottom:10),
                                                                    height: height /1.8425,
                                                                    width: width / 1,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xff3D8CF8),
                                                                        borderRadius: BorderRadius.circular(12)),
                                                                    child: Column(
                                                                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                                                      children: [
                                                                        Stack(
                                                                            children: [
                                                                              Container(
                                                                                height: height / 18.425,
                                                                                width: width / 1.2,
                                                                                decoration: BoxDecoration(color: Color(0xffECECEC), borderRadius: BorderRadius.circular(18)),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsets.only(left: 80),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "6th Grade B Section",
                                                                                      style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w600),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                height:
                                                                                height / 18.425,
                                                                                width:
                                                                                width / 4.285,
                                                                                decoration:
                                                                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                                                                                child:
                                                                                Center(
                                                                                  child: Text(
                                                                                    " 1 HR",
                                                                                    style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                        Stack(
                                                                            children: [
                                                                              Container(
                                                                                height:
                                                                                height / 18.425,
                                                                                width:
                                                                                width / 1.2,
                                                                                decoration:
                                                                                BoxDecoration(color: Color(0xffECECEC), borderRadius: BorderRadius.circular(18)),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsets.only(left: 80),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "7th Grade C Section",
                                                                                      style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w600),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                height:
                                                                                height / 18.425,
                                                                                width:
                                                                                width / 4.285,
                                                                                decoration:
                                                                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                                                                                child:
                                                                                Center(
                                                                                  child: Text(
                                                                                    " 2 HR",
                                                                                    style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                        Stack(
                                                                            children: [
                                                                              Container(
                                                                                height:
                                                                                height / 18.425,
                                                                                width:
                                                                                width / 1.2,
                                                                                decoration:
                                                                                BoxDecoration(color: Color(0xffECECEC), borderRadius: BorderRadius.circular(18)),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsets.only(left: 80),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "6th Grade A Section",
                                                                                      style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w600),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                height:
                                                                                height / 18.425,
                                                                                width:
                                                                                width / 4.285,
                                                                                decoration:
                                                                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                                                                                child:
                                                                                Center(
                                                                                  child: Text(
                                                                                    " 3 HR",
                                                                                    style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                        Stack(
                                                                            children: [
                                                                              Container(
                                                                                height:
                                                                                height / 18.425,
                                                                                width:
                                                                                width / 1.2,
                                                                                decoration:
                                                                                BoxDecoration(color: Color(0xffECECEC), borderRadius: BorderRadius.circular(18)),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsets.only(left: 80),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "6th Grade B Section",
                                                                                      style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w600),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                height:
                                                                                height / 18.425,
                                                                                width:
                                                                                width / 4.285,
                                                                                decoration:
                                                                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                                                                                child:
                                                                                Center(
                                                                                  child: Text(
                                                                                    " 4 HR",
                                                                                    style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                        Stack(
                                                                            children: [
                                                                              Container(
                                                                                height:
                                                                                height / 18.425,
                                                                                width:
                                                                                width / 1.2,
                                                                                decoration:
                                                                                BoxDecoration(color: Color(0xffECECEC), borderRadius: BorderRadius.circular(18)),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsets.only(left: 80),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "10th Grade D Section",
                                                                                      style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w600),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                height:
                                                                                height / 18.425,
                                                                                width:
                                                                                width / 4.285,
                                                                                decoration:
                                                                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                                                                                child:
                                                                                Center(
                                                                                  child: Text(
                                                                                    " 5 HR",
                                                                                    style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ])
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  SizedBox(height: 150,)
                                                                ],
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container()),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 27, bottom: 600,right: 27),
                    child: Container(
                      height: height / 14.28,
                      width: width / 1.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0,
                                blurRadius: 10),
                          ],
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(top:8.0,bottom: 4),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top:15),
                              enabledBorder:
                                  OutlineInputBorder(borderSide: BorderSide.none),
                              focusedBorder:
                                  OutlineInputBorder(borderSide: BorderSide.none),
                              prefixIcon: Icon(Icons.search_rounded
                              ),
                              hintText: "Search",
                              hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey.shade900, fontSize: 16)),
                        ),
                      ),
                    ),
                  ), // textfield
                ],
              ), // white
            ],
          ),
        ),
      ),
    );
  }

  int Day1 = 0;
  int Day2 = 0;
  int Day3 = 0;
  int Day4 = 0;
  int Day5 = 0;
  int Day6 = 0;
  int Day7 = 0;

  dayfun() {
    if (day == "Monday") {
      setState(() {
        Day1 = currentDate + 0;
        Day2 = currentDate + 1;
        Day3 = currentDate + 2;
        Day4 = currentDate + 3;
        Day5 = currentDate + 4;
        Day6 = currentDate + 5;
        Day7 = currentDate + 6;
      });
    } else if (day == "Tuesday") {
      setState(() {
        Day1 = currentDate - 1;
        Day2 = currentDate + 0;
        Day3 = currentDate + 1;
        Day4 = currentDate + 2;
        Day5 = currentDate + 3;
        Day6 = currentDate + 4;
        Day7 = currentDate + 5;
      });
    } else if (day == "Wednesday") {
      setState(() {
        Day1 = currentDate - 1;
        Day2 = currentDate - 2;
        Day3 = currentDate + 0;
        Day4 = currentDate + 1;
        Day5 = currentDate + 2;
        Day6 = currentDate + 3;
        Day7 = currentDate + 4;
      });
    } else if (day == "Thursday") {
      setState(() {
        Day1 = currentDate - 1;
        Day2 = currentDate - 2;
        Day3 = currentDate - 3;
        Day4 = currentDate + 0;
        Day5 = currentDate + 1;
        Day6 = currentDate + 2;
        Day7 = currentDate + 3;
      });
    } else if (day == "Friday") {
      setState(() {
        Day1 = currentDate - 1;
        Day2 = currentDate - 2;
        Day3 = currentDate - 3;
        Day4 = currentDate - 4;
        Day5 = currentDate + 0;
        Day6 = currentDate + 1;
        Day7 = currentDate + 2;
      });
    } else if (day == "Saturday") {
      setState(() {
        Day1 = currentDate - 1;
        Day2 = currentDate - 2;
        Day3 = currentDate - 3;
        Day4 = currentDate - 4;
        Day5 = currentDate - 5;
        Day6 = currentDate + 0;
        Day7 = currentDate + 1;
      });
    } else if (day == "Sunday") {
      setState(() {
        Day1 = currentDate - 1;
        Day2 = currentDate - 2;
        Day3 = currentDate - 3;
        Day4 = currentDate - 4;
        Day5 = currentDate - 5;
        Day6 = currentDate - 6;
        Day7 = currentDate + 0;
      });
    }
  }

  present(id) {
    FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .update({"isSelected": true});
  }

  absent(id) {
    FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .update({"isSelected": false});
  }
  good(id) {
    FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .update({"isSelected": true});
  }
  bad(id) {
    FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .update({"isSelected": false});
  }

  TextEditingController homecoller=TextEditingController();
  dynamic formatterDate = DateFormat('dd');
  dynamic currentTime = DateFormat.jm().format(DateTime.now());
   add () {

     FirebaseFirestore.instance.collection("homeworks").doc().set({

       "class"  : "9b",
       "date"   :  "${ DateTime.now().day}/${ DateTime.now().month}/${ DateTime.now().year}",
       "des"    : homecoller.text
     });
   } 
   
   value (id){
     FirebaseFirestore.instance.collection("Students").doc(id).update({

       "value" : "Good"

     });
   }




}
