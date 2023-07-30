import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'Root_Page2.dart';
import 'Root_Page3.dart';
import 'Root_Page4.dart';
import 'Root_page.dart';
import 'const_file.dart';

class Frontpage extends StatefulWidget {


  @override
  State<Frontpage> createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage>
    with SingleTickerProviderStateMixin {


  String? _selectedLocation;


  int tabar = 1;

 final GlobalKey <ScaffoldState>  key =GlobalKey();

  int currentDate = 0;
  int cyear = 0;
  String cmonth = "";
  String day = "";
  String month = "";

TextEditingController Searchcontroller=TextEditingController();

  String getMonth(int currentMonthIndex) {
    return DateFormat('MMM').format(DateTime(0, currentMonthIndex)).toString();
  }

  List Period=[];


 List Fridaylists=[8,16,24,32,40,48,56,64];

  Date() {
    Period.clear();
    setState(() {
      Period.clear();
      day = DateFormat('EEEE').format(DateTime.now());

      cyear = DateTime.now().year;
      cmonth = getMonth(DateTime.now().month);

      currentDate = DateTime.now().day;

    });

    print(day);
    print(currentDate);

    if(day=="Friday"){
   for(int i=0;i<Fridaylists.length;i++){
     setState((){
       Period.add(Fridaylists[i]);
     });
   }
   print(Period);
    }

  }

  @override
  void initState() {
    getstaffdetails();
    Date();
    dayfun();
    adddropdownvalue();

    super.initState();
  }

  bool isSelected = false;
  int Selectedindex = 0;
  bool isSelectedy = false;



  bool isSelectedb = false;
  String staffid="";
  String staffname="";
  String staffregno="";
  String staffimg="";

  getstaffdetails() async {
    var document = await FirebaseFirestore.instance.collection("Staffs").get();
    for(int i=0;i<document.docs.length;i++){
      if(document.docs[i]["userid"]==FirebaseAuth.instance.currentUser!.uid){
        setState(() {
          staffid=document.docs[i].id;
        });
        print("Saffid:${staffid}");
        print(staffid);
      }
      if(staffid.isNotEmpty){
        var staffdocument= await FirebaseFirestore.instance.collection("Staffs").doc(staffid).get();
        Map<String,dynamic>?staffvalue=staffdocument.data();
        setState(() {
          staffname=staffvalue!['stname'];
          staffregno=staffvalue['regno'];
          staffimg=staffvalue['imgUrl'];
        });
      }
    };

    print("staffname stff id staff img");
    print(staffname);
    print(staffregno);
    print(staffimg);
  }

  demo(){}
  String? _selectedCity;
  final TextEditingController _typeAheadControllerclass = TextEditingController();
  final TextEditingController _typeAheadControllersection = TextEditingController();
  final TextEditingController _typeAheadControllerstaffid = TextEditingController();
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
  static final List<String> classes = [];
  static final List<String> section = [];

  String dropdownValue4="Class";
  String dropdownValue5="Section";

  static List<String> getSuggestionsclass(String query) {
    List<String> matches = <String>[];
    matches.addAll(classes);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  static List<String> getSuggestionssection(String query) {
    List<String> matches = <String>[];
    matches.addAll(section);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  adddropdownvalue() async {
    print("hello");
    setState(() {
      classes.clear();
      section.clear();
    });
    var document = await  FirebaseFirestore.instance.collection("ClassMaster").orderBy("order").get();
    var document2 = await  FirebaseFirestore.instance.collection("SectionMaster").orderBy("order").get();
    setState(() {
      classes.add("Class");
      section.add("Section");
    });
    for(int i=0;i<document.docs.length;i++) {
      setState(() {
        classes.add(document.docs[i]["name"]);
      });

    }
    for(int i=0;i<document2.docs.length;i++) {
      setState(() {
        section.add(document2.docs[i]["name"]);
      });

    }
  }

  final DateFormat formatter = DateFormat('dd / M / yyyy');
  String formattedDate='${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}';
  int dates=DateTime.now().day;
  int year=DateTime.now().year;
  int month2=DateTime.now().month;
  String selectdate='';

  final present = List<bool>.generate(1000, (int bool) => true, growable: true);

  String page = "Home";

  int pageselected=0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: key,
      backgroundColor: Color(0xff0873C4),
     endDrawer: Drawer(
       backgroundColor:Color(0xff0873C4),

       child: SingleChildScrollView(
         child: Column(      
           children: [
             SizedBox(height:height/25.2),

             Container(
                 height: height/3.0,
                 width: double.infinity,
                 decoration: const BoxDecoration(

                     image: DecorationImage(
                         fit: BoxFit.cover,
                         image: AssetImage("assets/Rectangle.png")
                     )
                 ),
                 child: Column(
                   mainAxisAlignment:MainAxisAlignment.start,
                   children: [
                     SizedBox(
                       child: Stack(
                           children: [

                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [

                                 Padding(
                                   padding: EdgeInsets.only(
                                       top: height / 25.745, left: width / 40.4),
                                   child: CircleAvatar(
                                     radius: 64,
                                     backgroundColor: Colors.grey.shade200,
                                     backgroundImage:  NetworkImage(
                                         staffimg
                                     ),
                                   ),
                                 ),

                                 const SizedBox(height: 5,),

                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Padding(
                                       padding: EdgeInsets.only(left: width / 10),
                                       child: Text(
                                         staffname, style: GoogleFonts.poppins(
                                           color: Colors.white,
                                           fontSize: 22,
                                           fontWeight: FontWeight.bold

                                       ),),
                                     ),
                                     Padding(
                                       padding: EdgeInsets.only(left: width / 15),
                                       child: Text("ID : ${staffregno}",
                                         style: GoogleFonts.poppins(
                                             color: Colors.white,
                                             fontSize:width/22.5,
                                             fontWeight: FontWeight.w500

                                         ),),
                                     )
                                   ],
                                 ),


                               ],
                             ),

                             Positioned(
                               bottom: height / 13.45, left: width / 4.6,
                               child: const CircleAvatar(
                                   radius: 24,
                                   backgroundColor: Colors.white,
                                   child: Icon(Icons.create_outlined,
                                     color: Colors.black, size: 26,)
                               ),
                             )

                           ]
                       ),
                     ),

                   ],
                 )),

             GestureDetector(
               onTap:(){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>Root_Page() ,));

                 key.currentState!.closeEndDrawer();
               },
               child: Container(
                 child: ListTile(
                   leading: Icon(Icons.home,color: Colors.white,),
                   title: Text("Home",style:GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize:width/22.5)),
                 ),
               ),
             ),


             GestureDetector(
               onTap:(){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>Root_Page2() ,));

                 key.currentState!.closeEndDrawer();
               },
               child: Container(
                 child: ListTile(
                   leading: Icon(Icons.message,color: Colors.white,),
                   title: Text("Message",style:GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize:width/22.5)),
                 ),
               ),
             ),


             GestureDetector(
               onTap:(){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>Root_Page3() ,));

                 key.currentState!.closeEndDrawer();
               },
               child: Container(

                 child: ListTile(
                   leading: Icon(Icons.assignment,color: Colors.white,),
                   title: Text("Exams",style:GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize:width/22.5)),
                 ),
               ),
             ),


             GestureDetector(
               onTap:(){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>Root_Page4() ,));

                 key.currentState!.closeEndDrawer();
               },
               child: Container(

                 child: ListTile(
                   leading: Icon(Icons.person_outline,color: Colors.white,),
                   title: Text("Profile",style:GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize:width/22.5)),
                 ),
               ),
             ),

             GestureDetector(
               onTap:(){
                 setState((){
                   page = "Attendance";
                 });
                 key.currentState!.closeEndDrawer();
               },
               child: Container(
                 child: ListTile(
                   leading: Icon(Icons.calendar_month_outlined,color: Colors.white,),
                   title: Text("Attendance",style:GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize:width/22.5)),
                 ),
               ),
             ),

             GestureDetector(
               onTap:(){
                 setState((){
                 page = "Home Works";
               });
                 key.currentState!.closeEndDrawer();

               },
               child: Container(
                 child: ListTile(
                   leading: Icon(Icons.note_alt,color: Colors.white,),
                   title: Text("Home Works",style:GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize:width/22.5)),
                 ),
               ),
             ),

             GestureDetector(
               onTap:(){

                 setState((){
                   page = "Behaviour";
                 });
                 key.currentState!.closeEndDrawer();
               },
               child: Container(
                 child: ListTile(
                   leading: Icon(Icons.person_outline,color: Colors.white,),
                   title: Text("Behaviour",style:GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize:width/22.5)),
                 ),
               ),
             ),

             GestureDetector(
               onTap:(){
                 setState((){
                   page = "Circulars";
                 });
                 key.currentState!.closeEndDrawer();
               },
               child: Container(
                 child: ListTile(
                   leading: Icon(Icons.note_alt_outlined,color: Colors.white,),
                   title: Text("Circulars",style:GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize:width/22.5)),
                 ),
               ),
             ),


             GestureDetector(
               onTap:(){
                 setState((){
                   page = "Time Table";
                 });
                 key.currentState!.closeEndDrawer();
               },
               child: Container(
                 child: ListTile(
                   leading: Icon(Icons.timer_outlined,color: Colors.white,),
                   title: Text("Time Table",style:GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize:width/22.5)),
                 ),
               ),
             ),

             GestureDetector(
               onTap:(){
                 setState((){
                   page = "Messages";
                 });
                 key.currentState!.closeEndDrawer();
               },
               child: Container(
                 child: ListTile(
                   leading: Icon(Icons.mail_outline_outlined,color: Colors.white,),
                   title: Text("Messages",style:GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize:width/22.5)),
                 ),
               ),
             ),


           ],
         ),
       ),
     ),
      body:

      WillPopScope(
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
        child:
        SingleChildScrollView(
         physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.ease,
                height: page == "Home" ? height / 2.256 :
                page == "Attendance" ? height / 3.63 :
                page == "Home Works" ? height / 3.63 :
                page == "Behaviour" ? 76.123 :
                page == "Circulars" ? 76.123 :
                page == "Time Table" ? 76.123 :
                page == "Messages" ? 76.123 : 0,






                child:   page == "Circulars" ||  page == "Behaviour" ||
                    page == "Time Table" ||  page == "Messages"? Container() :
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    page == "Attendance" ||  page == "Home Works" ? Container() : Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding:  EdgeInsets.only(
                                    left: width/36, right: width/36, top: height/15.12),
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
                                            margin: EdgeInsets.only(right:width/36),
                                            height: height / 20.47,
                                            width: width / 10.333,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child:
                                                Icon(Icons.notifications_none,color:Color(0xff2C79F1))),
                                        GestureDetector(
                                          onTap: (){
                                            key.currentState!.openEndDrawer();
                                          },
                                          child: Container(
                                              height: height / 20.47,
                                              width: width / 10.333,
                                              decoration: BoxDecoration(

                                                  border: Border.all(
                                                    color:Colors.white,
                                                    width: 2
                                                  ),
                                                  borderRadius: BorderRadius.circular(5)),
                                              child:
                                              Icon(Icons.menu_sharp,color:Colors.white)),
                                        ),
                                      ],
                                    ),

                                    /// two image containers
                                  ],
                                ),
                              ), // headline

                              Padding(
                                padding:  EdgeInsets.only(left: width/36),
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
                        SizedBox( height: height / 31.566,),


                        Divider(
                          color: Colors.white,
                          thickness: 1.5,
                          endIndent: 10,
                          indent: 10,
                        ),

                        Padding(
                          padding:  EdgeInsets.only(
                              left:width/36, right:width/36, top: height/50.4),
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
                                      child:
                                      Icon(Icons.calendar_month_outlined,color:Color(0xffffffff))),
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
                        IgnorePointer(
                          child: CalendarTimeline(
                            dayNameColor: Colors.white,
                            initialDate: DateTime(year, month2, dates),
                            firstDate: DateTime(1990, 1, 15),
                            lastDate: DateTime(2050, 11, 20),
                            onDateSelected: (date){
                              setState(() {
                                dates=date.day;
                                month2=date.month;
                                year=date.year;
                                formattedDate = DateFormat('ddMyyyy').format(date);
                                selectdate = DateFormat('dd/M/yyyy').format(date);
                              });
                              print(formattedDate);
                            },
                            leftMargin: 20,
                            monthColor: Colors.white,
                            dayColor: Colors.white,
                            activeDayColor: Color(0xff0873C4),
                            activeBackgroundDayColor: Colors.white,
                            dotsColor: Colors.white,
                            locale: 'en_ISO',
                          ),
                        ),
                        /*
                        Padding(
                          padding:  EdgeInsets.only(left:width/36, right: width/36),
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
                        ), // D
                        asy
                         */

                        SizedBox(height: height / 120.33),

                        /*Padding(
                          padding:    day == "Monday"? EdgeInsets.only(left:width/180):
                        day == "Tuesday"?EdgeInsets.only(left:width/6.923):
                        day == "Wednesday"?EdgeInsets.only(left:width/3.529):
                        day == "Thursday"?EdgeInsets.only(left:width/2.307):
                        day == "Friday"?EdgeInsets.only(left:width/1.730):
                        day == "Saturday"?EdgeInsets.only(left:width/1.487):
                          day == "Sunday"?EdgeInsets.only(left:width/1.241):EdgeInsets.only(left:0),
                          child: Container(

                            height: height/378,
                            width:  width/5.142,
                           color: Colors.white

                          ),
                        ),*/

                        Container(

                          height: 1,
                          width:  width/0.947,
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
                    padding:  EdgeInsets.only(
                      top: height/25.2),
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
                                padding:  EdgeInsets.only(top: height/15.12),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding:  EdgeInsets.only(top:0.0,left:width/45),
                                     child: Text(
                                       "Dashboard,",
                                       style: GoogleFonts.poppins(
                                           color:Color(0xff0873C4),
                                           fontSize: 22,
                                           fontWeight:
                                           FontWeight.w700),
                                     ),
                                   ),

                                   Padding(
                                     padding:  EdgeInsets.only(top: height/37.8),
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
                                               Icon(Icons.calendar_month_outlined,color:Color(0xff609F00),size: width/12,),
                                               Padding(
                                                 padding:  EdgeInsets.only(left: width/45,right: width/45,
                                                 top: height/94.5, bottom: height/94.5),
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

                                               Icon(Icons.note_alt_sharp,color:Color(0xffFECE3E),size: width/12),

                                               Padding(
                                                 padding:  EdgeInsets.only(left: width/45,right: width/45,
                                                     top: height/94.5,bottom: height/94.5),
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
                                               Icon(Icons.person_outline,color:Color(0xffA021FF),size: width/12),
                                               Padding(
                                                 padding:  EdgeInsets.only(left: width/45,right: width/45,
                                                     top: height/94.5,bottom: height/94.5),
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

                                   SizedBox(height:height/18.9),

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
                                             Icon(Icons.note_alt_outlined,color:Color(0xffFECE3E),size: width/12),
                                             Padding(
                                               padding:  EdgeInsets.only(left: width/45,right: width/45,
                                                   top: height/94.5,bottom: height/94.5),
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
                                             Icon(Icons.timer_outlined,color:Color(0xff224FFF),size: width/12),
                                             Padding(
                                               padding:  EdgeInsets.only(left: width/45,right: width/45,
                                                   top: height/94.5,bottom: height/94.5),
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
                                             Icon(Icons.mail_outline_outlined,color:Color(0xff609F00),size: width/12),
                                             Padding(
                                               padding:  EdgeInsets.only(left: width/45,right: width/45,
                                                   top: height/94.5,bottom: height/94.5),
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
                                    padding:  EdgeInsets.only(
                                        left: width/36, right:  width/36, top: height/12.6),
                                    child: SingleChildScrollView(
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
                                                  color:Color(0xff0873C4),
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
                                          SizedBox(height: height / 184.25),
                                          Divider(
                                            color: Colors.grey.shade400,
                                            thickness: 1,
                                          ),
                                          SizedBox(height: height / 184.25),

                                          StreamBuilder(
                                                stream: FirebaseFirestore.instance.collection("Circulars").snapshots(),

                                                builder: (context , snapshot) {
                                                  if(snapshot.hasData==null){
                                                    return Center(child: CircularProgressIndicator(
                                                      color: Color(0xff0873c4),
                                                    ));
                                                  }
                                                  if(!snapshot.hasData){
                                                    return Center(child: CircularProgressIndicator(
                                                      color: Color(0xff0873c4),
                                                    ));
                                                  }
                                                  return ListView.builder(
                                                      shrinkWrap: true,
                                                      physics: const ScrollPhysics(),
                                                      itemCount: snapshot.data!.docs.length,
                                                      itemBuilder: (context , index) {
                                                        return Container(
                                                          height: height / 4.60625,
                                                          width: width / 1.0714,
                                                          margin: EdgeInsets.only(bottom: height/30.24),
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius:
                                                              BorderRadius.circular(12),
                                                              border: Border.all(
                                                                  color: Colors.black)),
                                                          child: Padding(
                                                            padding:  EdgeInsets.only(left: width/45,right: width/45,
                                                                top: height/94.5,bottom: height/94.5),
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
                                                                          fontSize:width/22.5,
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
                                                                      snapshot.data!.docs[index]["From"],

                                                                      style:
                                                                      GoogleFonts.poppins(
                                                                          color:
                                                                          Colors.green,
                                                                          fontSize:width/22.5,
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

                                          SizedBox(height:height/5.0),

                                         

                                        ],
                                      ),
                                    ),
                                  )
                                : page == "Home Works"
                                    ? Padding(
                                        padding:  EdgeInsets.only(
                                            left: width/36, right: width/36, top: height/15.12),
                                        child: SingleChildScrollView(
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
                                                      color:Color(0xff0873C4),
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

                                              Column(


                                                  children: [
                                                    SizedBox(height: height / 773.7),


                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [

                                                        Container(
                                                          padding: EdgeInsets.only(left: width/36,right:  width/36),
                                                          height: height / 14.74,
                                                          width: width / 2.363,
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              border: Border.all(
                                                                  color: Colors.grey.shade300),
                                                              borderRadius:
                                                              BorderRadius.circular(10)),
                                                          child:
                                                          DropdownButton2<String>(
                                                            value: dropdownValue4,
                                                            isExpanded: true,
                                                            style: TextStyle(
                                                                color: Color(0xff3D8CF8),
                                                                fontSize: 17,fontWeight: FontWeight.w700),
                                                            underline: Container(
                                                              color: Colors.deepPurpleAccent,
                                                            ),
                                                            onChanged: (String? value) {
                                                              // This is called when the user selects an item.
                                                              setState(() {
                                                                dropdownValue4 = value!;
                                                                _typeAheadControllerclass.text = value;
                                                              });
                                                            },
                                                            items:
                                                            classes.map<DropdownMenuItem<String>>(
                                                                    (String value) {
                                                                  return DropdownMenuItem<String>(
                                                                    value: value,
                                                                    child: Text(value),
                                                                  );
                                                                }).toList(),
                                                          ),

                                                          /*
                                                          TypeAheadFormField(


                                                            suggestionsBoxDecoration: SuggestionsBoxDecoration(

                                                                borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius.circular(5),
                                                                  bottomRight: Radius.circular(5),
                                                                )
                                                            ),

                                                            textFieldConfiguration: TextFieldConfiguration(
                                                              style:   GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                              decoration: InputDecoration(
                                                                hintText: "Class",
                                                                hintStyle: GoogleFonts.poppins(

                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                                contentPadding: EdgeInsets.only(left:  width/36,top: height/151.2),
                                                                border: InputBorder.none,
                                                              ),
                                                              controller: this._typeAheadControllerclass,
                                                            ),
                                                            suggestionsCallback: (pattern) {
                                                              return getSuggestionsclass(pattern);
                                                            },
                                                            itemBuilder: (context, String suggestion) {
                                                              return ListTile(
                                                                title: Text(suggestion),
                                                              );
                                                            },

                                                            transitionBuilder: (context, suggestionsBox, controller) {
                                                              return suggestionsBox;
                                                            },
                                                            onSuggestionSelected: (String suggestion) {

                                                              this._typeAheadControllerclass.text = suggestion;


                                                            },
                                                            suggestionsBoxController: suggestionBoxController,
                                                            validator: (value) =>
                                                            value!.isEmpty ? 'Please select a class' : null,
                                                            onSaved: (value) => this._selectedCity = value,
                                                          ),*/

                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(left: width/36,right: width/36),
                                                          height: height / 14.74,
                                                          width: width / 2.363,
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              border: Border.all(
                                                                  color: Colors.grey.shade300),
                                                              borderRadius:
                                                              BorderRadius.circular(10)),
                                                          child:
                                                          DropdownButton2<String>(
                                                            value: dropdownValue5,
                                                            isExpanded: true,
                                                            style: TextStyle(
                                                                color: Color(0xff3D8CF8),
                                                                fontSize: 17,fontWeight: FontWeight.w700),
                                                            underline: Container(
                                                              color: Colors.deepPurpleAccent,
                                                            ),
                                                            onChanged: (String? value) {
                                                              // This is called when the user selects an item.
                                                              setState(() {
                                                                dropdownValue5 = value!;
                                                                _typeAheadControllersection.text = value;
                                                              });
                                                            },
                                                            items:
                                                            section.map<DropdownMenuItem<String>>(
                                                                    (String value) {
                                                                  return DropdownMenuItem<String>(
                                                                    value: value,
                                                                    child: Text(value),
                                                                  );
                                                                }).toList(),
                                                          ),
                                                         /* TypeAheadFormField(

                                                            suggestionsBoxDecoration: SuggestionsBoxDecoration(

                                                                borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius.circular(5),
                                                                  bottomRight: Radius.circular(5),
                                                                )
                                                            ),

                                                            textFieldConfiguration: TextFieldConfiguration(
                                                              style:   GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                              decoration: InputDecoration(
                                                                hintText: "Section",
                                                                hintStyle: GoogleFonts.poppins(

                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                                contentPadding: EdgeInsets.only(left: width/36,top: height/151.2),
                                                                border: InputBorder.none,
                                                              ),
                                                              controller: this._typeAheadControllersection,
                                                            ),
                                                            suggestionsCallback: (pattern) {
                                                              return getSuggestionssection(pattern);
                                                            },
                                                            itemBuilder: (context, String suggestion) {
                                                              return ListTile(
                                                                title: Text(suggestion),
                                                              );
                                                            },

                                                            transitionBuilder: (context, suggestionsBox, controller) {
                                                              return suggestionsBox;
                                                            },
                                                            onSuggestionSelected: (String suggestion) {
                                                              this._typeAheadControllersection.text = suggestion;
                                                              checkattendance();
                                                            },
                                                            suggestionsBoxController: suggestionBoxController,
                                                            validator: (value) =>
                                                            value!.isEmpty ? 'Please select a section' : null,
                                                            onSaved: (value) => this._selectedCity = value,
                                                          ),*/
                                                        ),

                                                      ],
                                                    ),

                                                    /// Center Container

                                                    SizedBox(height: height / 43.7),

                                                    Divider(
                                                      color: Colors.grey.shade400,
                                                      thickness: 1.5,
                                                    ),

                                                    SizedBox(height: height / 36.85),

                                                    Center(
                                                      child: Text(
                                                        "Type Todays Home Work",
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
                                                            top: height/37.8, left: width/20),
                                                        height: height / 4.685,
                                                        width: width / 1.0636,
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
                                                          SuccessHomeworkdialog();
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
                                                                    fontSize:width/22.5,
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

                                                    SizedBox(height:height/8.2125),

                                                    ]),
                                              SizedBox(height:height/5.0),

                                            ],
                                          ),
                                        ),
                                      )
                                    : page == "Attendance"
                                        ? Padding (
                                            padding:  EdgeInsets.only(
                                                top: height/25.2),
                                            child: Container(
                                              height: height / 32.48,
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
                                                padding:  EdgeInsets.only(
                                                    left: width/36,
                                                    right: width/36,
                                                    top: height/192),
                                                child:SingleChildScrollView(
                                                  physics: ScrollPhysics(),
                                                  child: Column(                                                       crossAxisAlignment:CrossAxisAlignment.start,

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

                                                      Column(
                                                        children: [

                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [

                                                              Container(
                                                                padding: EdgeInsets.only(left: width/36,right:  width/36),
                                                                height: height / 14.74,
                                                                width: width / 2.363,
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    border: Border.all(
                                                                        color: Colors.grey.shade300),
                                                                    borderRadius:
                                                                    BorderRadius.circular(10)),
                                                                child:
                                                                DropdownButton2<String>(
                                                                  value: dropdownValue4,
                                                                  isExpanded: true,
                                                                  style: TextStyle(
                                                                      color: Color(0xff3D8CF8),
                                                                      fontSize: 17,fontWeight: FontWeight.w700),
                                                                  underline: Container(
                                                                    color: Colors.deepPurpleAccent,
                                                                  ),
                                                                  onChanged: (String? value) {
                                                                    // This is called when the user selects an item.
                                                                    setState(() {
                                                                      dropdownValue4 = value!;
                                                                      _typeAheadControllerclass.text = value;
                                                                    });
                                                                  },
                                                                  items:
                                                                  classes.map<DropdownMenuItem<String>>(
                                                                          (String value) {
                                                                        return DropdownMenuItem<String>(
                                                                          value: value,
                                                                          child: Text(value),
                                                                        );
                                                                      }).toList(),
                                                                ),

                                                                /*
                                                          TypeAheadFormField(


                                                            suggestionsBoxDecoration: SuggestionsBoxDecoration(

                                                                borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius.circular(5),
                                                                  bottomRight: Radius.circular(5),
                                                                )
                                                            ),

                                                            textFieldConfiguration: TextFieldConfiguration(
                                                              style:   GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                              decoration: InputDecoration(
                                                                hintText: "Class",
                                                                hintStyle: GoogleFonts.poppins(

                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                                contentPadding: EdgeInsets.only(left:  width/36,top: height/151.2),
                                                                border: InputBorder.none,
                                                              ),
                                                              controller: this._typeAheadControllerclass,
                                                            ),
                                                            suggestionsCallback: (pattern) {
                                                              return getSuggestionsclass(pattern);
                                                            },
                                                            itemBuilder: (context, String suggestion) {
                                                              return ListTile(
                                                                title: Text(suggestion),
                                                              );
                                                            },

                                                            transitionBuilder: (context, suggestionsBox, controller) {
                                                              return suggestionsBox;
                                                            },
                                                            onSuggestionSelected: (String suggestion) {

                                                              this._typeAheadControllerclass.text = suggestion;


                                                            },
                                                            suggestionsBoxController: suggestionBoxController,
                                                            validator: (value) =>
                                                            value!.isEmpty ? 'Please select a class' : null,
                                                            onSaved: (value) => this._selectedCity = value,
                                                          ),*/

                                                              ),

                                                              Container(
                                                                padding: EdgeInsets.only(left: width/36,right: width/36),
                                                                height: height / 14.74,
                                                                width: width / 2.363,
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    border: Border.all(
                                                                        color: Colors.grey.shade300),
                                                                    borderRadius:
                                                                    BorderRadius.circular(10)),
                                                                child:
                                                                DropdownButton2<String>(
                                                                  value: dropdownValue5,
                                                                  isExpanded: true,
                                                                  style: TextStyle(
                                                                      color: Color(0xff3D8CF8),
                                                                      fontSize: 17,fontWeight: FontWeight.w700),
                                                                  underline: Container(
                                                                    color: Colors.deepPurpleAccent,
                                                                  ),
                                                                  onChanged: (String? value) {
                                                                    // This is called when the user selects an item.
                                                                    setState(() {
                                                                      dropdownValue5 = value!;
                                                                      _typeAheadControllersection.text = value;
                                                                    });
                                                                  },
                                                                  items:
                                                                  section.map<DropdownMenuItem<String>>(
                                                                          (String value) {
                                                                        return DropdownMenuItem<String>(
                                                                          value: value,
                                                                          child: Text(value),
                                                                        );
                                                                      }).toList(),
                                                                ),
                                                                /* TypeAheadFormField(

                                                            suggestionsBoxDecoration: SuggestionsBoxDecoration(

                                                                borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius.circular(5),
                                                                  bottomRight: Radius.circular(5),
                                                                )
                                                            ),

                                                            textFieldConfiguration: TextFieldConfiguration(
                                                              style:   GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                              decoration: InputDecoration(
                                                                hintText: "Section",
                                                                hintStyle: GoogleFonts.poppins(

                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                                contentPadding: EdgeInsets.only(left: width/36,top: height/151.2),
                                                                border: InputBorder.none,
                                                              ),
                                                              controller: this._typeAheadControllersection,
                                                            ),
                                                            suggestionsCallback: (pattern) {
                                                              return getSuggestionssection(pattern);
                                                            },
                                                            itemBuilder: (context, String suggestion) {
                                                              return ListTile(
                                                                title: Text(suggestion),
                                                              );
                                                            },

                                                            transitionBuilder: (context, suggestionsBox, controller) {
                                                              return suggestionsBox;
                                                            },
                                                            onSuggestionSelected: (String suggestion) {
                                                              this._typeAheadControllersection.text = suggestion;
                                                              checkattendance();
                                                            },
                                                            suggestionsBoxController: suggestionBoxController,
                                                            validator: (value) =>
                                                            value!.isEmpty ? 'Please select a section' : null,
                                                            onSaved: (value) => this._selectedCity = value,
                                                          ),*/
                                                              ),

                                                            ],
                                                          ),

                                                          /// Grade Container

                                                          marked==false?  SizedBox(
                                                            height: height / 49.13,
                                                          ) : SizedBox(),

                                                      marked==false? Column(
                                                            children: [
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



                                                              StreamBuilder<QuerySnapshot>(
                                                                  stream: FirebaseFirestore.instance.collection("Students").
                                                                  orderBy("timestamp").snapshots(),
                                                                  builder: (context, snapshot) {

                                                                    if(snapshot.hasData==null){
                                                                      return Center(child: CircularProgressIndicator(
                                                                        color: Color(0xff0873c4),
                                                                      ));
                                                                    }
                                                                    if(!snapshot.hasData){
                                                                      return Center(child: CircularProgressIndicator(
                                                                        color: Color(0xff0873c4),
                                                                      ));
                                                                    }
                                                                    return ListView.builder(
                                                                        itemCount: snapshot.data!.docs.length,
                                                                        physics: NeverScrollableScrollPhysics(),
                                                                        shrinkWrap: true,
                                                                        itemBuilder:(BuildContext context, index) {
                                                                          return
                                                                            snapshot.data!.docs[index]["admitclass"]==_typeAheadControllerclass.text &&
                                                                                snapshot.data!.docs[index]["section"]==_typeAheadControllersection.text ?
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                Padding(
                                                                                  padding:  EdgeInsets.only(bottom: width/50.4),
                                                                                  child: Container(

                                                                                    width: width / 3.5,
                                                                                    child: Text(
                                                                                      snapshot.data!.docs[index]["stname"],
                                                                                      style: GoogleFonts.poppins(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding:  EdgeInsets.only(
                                                                                      bottom: height/37.8,
                                                                                      left: width/45),
                                                                                  child:
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        present[index]=true;
                                                                                      });

                                                                                    },
                                                                                    child: Container(
                                                                                      height:
                                                                                      height / 29.48,
                                                                                      width:
                                                                                      width / 10,
                                                                                      decoration:
                                                                                      BoxDecoration(shape: BoxShape.circle, border: Border.all(color:Color(0xff0873C4))),
                                                                                      child: Container(
                                                                                        child: Icon(
                                                                                          present[index] == true ? Icons.check : null,
                                                                                          color:Color(0xff0873C4),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding:
                                                                                   EdgeInsets.only(bottom: height/37.8),
                                                                                  child:
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        present[index]=false;
                                                                                      });
                                                                                    },
                                                                                    child: Container(
                                                                                      height:
                                                                                      height / 29.48,
                                                                                      width:
                                                                                      width / 10,
                                                                                      decoration:
                                                                                      BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.red)),
                                                                                      child:
                                                                                      Container(
                                                                                        child: Icon(
                                                                                          present[index] == false ? Icons.clear : null,
                                                                                          color: Colors.red,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                 ),
                                                                                ),


                                                                              ],
                                                                            ) : SizedBox();
                                                                        });
                                                                  }),
                                                              SizedBox(height: height/25.2,),
                                                              Center(
                                                                child: GestureDetector(
                                                                  onTap: (){
                                                                    attendaceupload();
                                                                    checkattendance();
                                                                    Successdialog();
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
                                                                          .center,
                                                                      children: [
                                                                        Text(
                                                                          "Submit",
                                                                          style:
                                                                          GoogleFonts.poppins(
                                                                              color: Colors.white, fontSize:width/22.5, fontWeight: FontWeight
                                                                              .w500),
                                                                        ),
                                                                        Padding(
                                                                          padding:  EdgeInsets.only(left:width/45),
                                                                          child: Icon(Icons.done_all,color:Colors.white),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(height: height/8.2,),
                                                            ],
                                                          ) :
                                                      Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                width:width/1.2,
                                                              height: height/3.78,
                                                              child: Lottie.asset("assets/completed.json")
                                                      ),
                                                              Text(
                                                                "Attendance Marked for Today",
                                                                style:
                                                                GoogleFonts.poppins(
                                                                    color: Colors
                                                                        .blueAccent,
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                              ),

                                                            ],
                                                          ),



                                                        ]
                                                      ),

                                                      SizedBox(height:height/5.0),



                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : page == "Behaviour"
                                            ? Padding(
                                                padding:  EdgeInsets.only(
                                                    top: height/25.2),
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
                                                         EdgeInsets.only(
                                                            left: width/36,
                                                            right: width/36,
                                                            top: height/94.5),
                                                    child: SingleChildScrollView(
                                                      physics: NeverScrollableScrollPhysics(),
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

                                                          SizedBox(
                                                              height: height /
                                                                  42.642),
                                                          Column(
                                                            children: [



                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [

                                                                  Container(
                                                                    padding: EdgeInsets.only(left: width/36,right:  width/36),
                                                                    height: height / 14.74,
                                                                    width: width / 2.363,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        border: Border.all(
                                                                            color: Colors.grey.shade300),
                                                                        borderRadius:
                                                                        BorderRadius.circular(10)),
                                                                    child:
                                                                    DropdownButton2<String>(
                                                                      value: dropdownValue4,
                                                                      isExpanded: true,
                                                                      style: TextStyle(
                                                                          color: Color(0xff3D8CF8),
                                                                          fontSize: 17,fontWeight: FontWeight.w700),
                                                                      underline: Container(
                                                                        color: Colors.deepPurpleAccent,
                                                                      ),
                                                                      onChanged: (String? value) {
                                                                        // This is called when the user selects an item.
                                                                        setState(() {
                                                                          dropdownValue4 = value!;
                                                                          _typeAheadControllerclass.text = value;
                                                                        });
                                                                      },
                                                                      items:
                                                                      classes.map<DropdownMenuItem<String>>(
                                                                              (String value) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: value,
                                                                              child: Text(value),
                                                                            );
                                                                          }).toList(),
                                                                    ),

                                                                    /*
                                                          TypeAheadFormField(


                                                            suggestionsBoxDecoration: SuggestionsBoxDecoration(

                                                                borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius.circular(5),
                                                                  bottomRight: Radius.circular(5),
                                                                )
                                                            ),

                                                            textFieldConfiguration: TextFieldConfiguration(
                                                              style:   GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                              decoration: InputDecoration(
                                                                hintText: "Class",
                                                                hintStyle: GoogleFonts.poppins(

                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                                contentPadding: EdgeInsets.only(left:  width/36,top: height/151.2),
                                                                border: InputBorder.none,
                                                              ),
                                                              controller: this._typeAheadControllerclass,
                                                            ),
                                                            suggestionsCallback: (pattern) {
                                                              return getSuggestionsclass(pattern);
                                                            },
                                                            itemBuilder: (context, String suggestion) {
                                                              return ListTile(
                                                                title: Text(suggestion),
                                                              );
                                                            },

                                                            transitionBuilder: (context, suggestionsBox, controller) {
                                                              return suggestionsBox;
                                                            },
                                                            onSuggestionSelected: (String suggestion) {

                                                              this._typeAheadControllerclass.text = suggestion;


                                                            },
                                                            suggestionsBoxController: suggestionBoxController,
                                                            validator: (value) =>
                                                            value!.isEmpty ? 'Please select a class' : null,
                                                            onSaved: (value) => this._selectedCity = value,
                                                          ),*/

                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.only(left: width/36,right: width/36),
                                                                    height: height / 14.74,
                                                                    width: width / 2.363,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        border: Border.all(
                                                                            color: Colors.grey.shade300),
                                                                        borderRadius:
                                                                        BorderRadius.circular(10)),
                                                                    child:
                                                                    DropdownButton2<String>(
                                                                      value: dropdownValue5,
                                                                      isExpanded: true,
                                                                      style: TextStyle(
                                                                          color: Color(0xff3D8CF8),
                                                                          fontSize: 17,fontWeight: FontWeight.w700),
                                                                      underline: Container(
                                                                        color: Colors.deepPurpleAccent,
                                                                      ),
                                                                      onChanged: (String? value) {
                                                                        // This is called when the user selects an item.
                                                                        setState(() {
                                                                          dropdownValue5 = value!;
                                                                          _typeAheadControllersection.text = value;
                                                                        });
                                                                      },
                                                                      items:
                                                                      section.map<DropdownMenuItem<String>>(
                                                                              (String value) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: value,
                                                                              child: Text(value),
                                                                            );
                                                                          }).toList(),
                                                                    ),
                                                                    /* TypeAheadFormField(

                                                            suggestionsBoxDecoration: SuggestionsBoxDecoration(

                                                                borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius.circular(5),
                                                                  bottomRight: Radius.circular(5),
                                                                )
                                                            ),

                                                            textFieldConfiguration: TextFieldConfiguration(
                                                              style:   GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                              decoration: InputDecoration(
                                                                hintText: "Section",
                                                                hintStyle: GoogleFonts.poppins(

                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                                contentPadding: EdgeInsets.only(left: width/36,top: height/151.2),
                                                                border: InputBorder.none,
                                                              ),
                                                              controller: this._typeAheadControllersection,
                                                            ),
                                                            suggestionsCallback: (pattern) {
                                                              return getSuggestionssection(pattern);
                                                            },
                                                            itemBuilder: (context, String suggestion) {
                                                              return ListTile(
                                                                title: Text(suggestion),
                                                              );
                                                            },

                                                            transitionBuilder: (context, suggestionsBox, controller) {
                                                              return suggestionsBox;
                                                            },
                                                            onSuggestionSelected: (String suggestion) {
                                                              this._typeAheadControllersection.text = suggestion;
                                                              checkattendance();
                                                            },
                                                            suggestionsBoxController: suggestionBoxController,
                                                            validator: (value) =>
                                                            value!.isEmpty ? 'Please select a section' : null,
                                                            onSaved: (value) => this._selectedCity = value,
                                                          ),*/
                                                                  ),

                                                                ],
                                                              ),



                                                              /// Center Container

                                                              SizedBox(
                                                                  height: height /
                                                                      42.642),

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
                                                                    left: width/18,
                                                                    right:  width/14.4,
                                                                    top: height/50.4),
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

                                                              SizedBox(
                                                                  height:height/0.8,
                                                                child: StreamBuilder(
                                                                    stream: FirebaseFirestore.instance.collection("Students").snapshots(),
                                                                    builder: (context , snapshot) {

                                                                      if(snapshot.hasData==null){
                                                                        return Center(child: CircularProgressIndicator(
                                                                          color: Color(0xff0873c4),
                                                                        ));
                                                                      }
                                                                      if(!snapshot.hasData){
                                                                        return Center(child: CircularProgressIndicator(
                                                                          color: Color(0xff0873c4),
                                                                        ));
                                                                      }
                                                                      return ListView.builder (
                                                                          shrinkWrap: true,
                                                                          physics:  ClampingScrollPhysics(),
                                                                          itemCount: snapshot.data!.docs.length,
                                                                          itemBuilder: (context , index) {
                                                                            return Container(
                                                                              padding:
                                                                              EdgeInsets.only(
                                                                                  left: width/18,
                                                                                  right:  width/14.4,
                                                                                  top: height/50.4,),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  SizedBox(
                                                                                   width:width/2.25,

                                                                                    child: Text(
                                                                                      snapshot.data!.docs[index]["stname"],
                                                                                      style: GoogleFonts.poppins(
                                                                                          color: Colors
                                                                                              .black,
                                                                                          fontSize:
                                                                                          15,
                                                                                          fontWeight:
                                                                                          FontWeight
                                                                                              .w600),
                                                                                    ),
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
                                                              ),
                                                              ///  good

                                                              SizedBox(height: height/5.04,),



                                                            ]
                                                          ),
                                                          SizedBox(height:height/5.0),

                                                         



                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : page == "Time Table"
                                                ? Padding(
                                                    padding:
                                                         EdgeInsets.only(
                                                            top: height/25.2),
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
                                                        padding:  EdgeInsets.only(left: width/36, right:width/36,top: width/75.6),
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
                                                            SizedBox(height: height/50.04,),
                                                            Container(
                                                              margin: EdgeInsets.only(bottom:height/75.6),
                                                              padding:EdgeInsets.only(bottom:height/80.6),
                                                              height: height /1.8425,
                                                              width: width / 1,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xff3D8CF8),
                                                                  borderRadius: BorderRadius.circular(12)),
                                                              child:  StreamBuilder<QuerySnapshot>(
                                                                stream: FirebaseFirestore.instance.collection("Staffs").
                                                                doc(staffid).collection('Timetable').
                                                                where("day",isEqualTo:day).snapshots(),
                                                                builder: (context, snapshot) {
                                                                  if(snapshot.hasData==null){
                                                                    return Center(child: CircularProgressIndicator(
                                                                      color: Color(0xff0873c4),
                                                                    ));
                                                                  }
                                                                  if(!snapshot.hasData){
                                                                    return Center(child: CircularProgressIndicator(
                                                                      color: Color(0xff0873c4),
                                                                    ));
                                                                  }

                                                                  return ListView.builder(
                                                                    physics: ClampingScrollPhysics(),
                                                                    itemCount: snapshot.data!.docs.length,
                                                                    itemBuilder: (context, index) {

                                                                      var values=snapshot.data!.docs[index];

                                                                      if(Period.isNotEmpty&&Period.contains(values['period'])){
                                                                        return Padding(
                                                                          padding: const EdgeInsets.only(top:8.0),
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: [
                                                                              Stack(
                                                                                  children: [
                                                                                    Container(
                                                                                      height: height / 18.425,
                                                                                      width: width / 1.2,
                                                                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                                                                                      child:
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [

                                                                                          Container(
                                                                                          margin: EdgeInsets.only(left:width/360,right:width/360),
                                                                                            height:height/504,
                                                                                            width:width/4,
                                                                                          color:Colors.grey.shade300,
                                                                                          ),
                                                                                          Text(
                                                                                            "Free Hour",
                                                                                            style: GoogleFonts.poppins(color:Color(0xff0873C4), fontSize: 20, fontWeight: FontWeight.w600),
                                                                                          ),
                                                                                          Container(
                                                                                            margin: EdgeInsets.only(left:width/360,right:width/360),
                                                                                            height:height/504,
                                                                                            width:width/4,
                                                                                            color:Colors.grey.shade300,
                                                                                          ),

                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ]),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }

                                                                      return
                                                                        Padding(
                                                                        padding: const EdgeInsets.only(top:8.0),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Stack(
                                                                                children: [
                                                                                  Container(
                                                                                    height: height / 18.425,
                                                                                    width: width / 1.2,
                                                                                    decoration: BoxDecoration(color: Color(0xffECECEC), borderRadius: BorderRadius.circular(18)),
                                                                                    child:
                                                                                    Padding(
                                                                                      padding: EdgeInsets.only(left: width/4.0),
                                                                                      child: Text(
                                                                                        "${values['class']}-${values['section']} Section",
                                                                                        style: GoogleFonts.poppins(color:Color(0xff0873C4), fontSize: 20, fontWeight: FontWeight.w600),
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
                                                                                        values['period']==0? "1 HR":
                                                                                        values['period']==1? "2 HR":
                                                                                        values['period']==2? "3 HR":
                                                                                        values['period']==3? "4 HR":
                                                                                        values['period']==4? "5 HR":
                                                                                        values['period']==5? "6 HR":
                                                                                        values['period']==6? "7 HR":
                                                                                        values['period']==7? "8 HR":
                                                                                        values['period']==8? "1 HR":
                                                                                        values['period']==9? "2 HR":
                                                                                        values['period']==10? "3 HR":
                                                                                        values['period']==11? "4 HR":
                                                                                        values['period']==12? "5 HR":
                                                                                        values['period']==13? "6 HR":
                                                                                        values['period']==14? "7 HR":
                                                                                        values['period']==15? "8 HR":
                                                                                        values['period']==16? "1 HR":
                                                                                        values['period']==17? "2 HR":
                                                                                        values['period']==18? "3 HR":
                                                                                        values['period']==19? "4 HR":
                                                                                        values['period']==20? "5 HR":
                                                                                        values['period']==21? "6 HR":
                                                                                        values['period']==22? "7 HR":
                                                                                        values['period']==23? "8 HR":
                                                                                        values['period']==24? "1 HR":
                                                                                        values['period']==25? "2 HR":
                                                                                        values['period']==26? "3 HR":
                                                                                        values['period']==27? "4 HR":
                                                                                        values['period']==28? "5 HR":
                                                                                        values['period']==29? "6 HR":
                                                                                        values['period']==30? "7 HR":
                                                                                        values['period']==31? "8 HR":
                                                                                        values['period']==32? "1 HR":
                                                                                        values['period']==33? "2 HR":
                                                                                        values['period']==34? "3 HR":
                                                                                        values['period']==35? "4 HR":
                                                                                        values['period']==36? "5 HR":
                                                                                        values['period']==37? "6 HR":
                                                                                        values['period']==38? "7 HR":
                                                                                        values['period']==39? "8 HR":
                                                                                        values['period']==40? "1 HR":
                                                                                        values['period']==41? "2 HR":
                                                                                        values['period']==42? "3 HR":
                                                                                        values['period']==43? "4 HR":
                                                                                        values['period']==44? "5 HR":
                                                                                        values['period']==45? "6 HR":
                                                                                        values['period']==46? "7 HR":
                                                                                        values['period']==47? "8 HR":"",
                                                                                        style: GoogleFonts.poppins(color:Color(0xff0873C4), fontSize: 20, fontWeight: FontWeight.w600),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ]),
                                                                          ],
                                                                        ),
                                                                      );

                                                                    },);
                                                                },),

                                                              /* Column(
                                                                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                                                      children: [

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
                                                                                  padding: EdgeInsets.only(left: width/4.5),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "7th Grade C Section",
                                                                                      style: GoogleFonts.poppins(color:Color(0xff0873C4), fontSize: 20, fontWeight: FontWeight.w600),
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
                                                                                    style: GoogleFonts.poppins(color:Color(0xff0873C4), fontSize: 20, fontWeight: FontWeight.w600),
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
                                                                                  padding: EdgeInsets.only(left: width/4.5),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "6th Grade A Section",
                                                                                      style: GoogleFonts.poppins(color:Color(0xff0873C4), fontSize: 20, fontWeight: FontWeight.w600),
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
                                                                                    style: GoogleFonts.poppins(color:Color(0xff0873C4), fontSize: 20, fontWeight: FontWeight.w600),
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
                                                                                  padding: EdgeInsets.only(left: width/4.5),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "6th Grade B Section",
                                                                                      style: GoogleFonts.poppins(color:Color(0xff0873C4), fontSize: 20, fontWeight: FontWeight.w600),
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
                                                                                    style: GoogleFonts.poppins(color:Color(0xff0873C4), fontSize: 20, fontWeight: FontWeight.w600),
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
                                                                                  padding: EdgeInsets.only(left: width/4.5),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "10th Grade D Section",
                                                                                      style: GoogleFonts.poppins(color:Color(0xff0873C4), fontSize: 20, fontWeight: FontWeight.w600),
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
                                                                                    style: GoogleFonts.poppins(color:Color(0xff0873C4), fontSize: 20, fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ])
                                                                      ],
                                                                    ),*/
                                                            ),
                                                            SizedBox(height:height/5.0),

                                                            /*Flexible(
                                                              child: ListView(
                                                                shrinkWrap: true,
                                                                physics: NeverScrollableScrollPhysics(),
                                                                children: [
                                                                  // SizedBox(
                                                                  //     height: height /
                                                                  //         49.133),






                                                                  SizedBox(height: height/5.04,)
                                                                ],
                                                              ),
                                                            ),*/

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container()
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: width/13.33, bottom: height/1.26,right: width/13.333),
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
                        padding:  EdgeInsets.only(top:height/94.5,bottom: height/189),
                        child: TextField(

                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: height/50.4),
                              enabledBorder:
                                  OutlineInputBorder(borderSide: BorderSide.none),
                              focusedBorder:
                                  OutlineInputBorder(borderSide: BorderSide.none),
                              prefixIcon: Icon(Icons.search_rounded
                              ),
                              hintText: "Search",
                              hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey.shade900, fontSize:width/22.5)),
                        onSubmitted: (_){
                            if(Searchcontroller.text=="Attendance"){
                              setState(() {
                                page = "Attendance";
                              });
                            }
                            if(Searchcontroller.text=="Attendance"){
                              setState(() {
                                page = "Attendance";
                              });
                            }
                            if(Searchcontroller.text=="Home Works"){
                              setState(() {
                                page = "Home Works";
                              });
                            }
                            if(Searchcontroller.text=="Behaviour"){
                              setState(() {
                                page = "Behaviour";
                              });
                            }
                            if(Searchcontroller.text=="Circulars"){
                              setState(() {
                                page = "Circulars";
                              });
                            }
                            if(Searchcontroller.text=="Time Table"){
                              setState(() {
                                page = "Time Table";
                              });
                            }
                            if(Searchcontroller.text=="Messages"){
                              setState(() {
                                page = "Messages";
                              });
                            }
                            if(Searchcontroller.text.contains('Home')){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>Root_Page() ,));
                            }
                            if(Searchcontroller.text.contains('Message')){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>Root_Page() ,));
                            }
                            if(Searchcontroller.text.contains('Exams')){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>Root_Page() ,));
                            }
                            if(Searchcontroller.text.contains('Profile')){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>Root_Page() ,));
                            }


                        },
                        controller: Searchcontroller,
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

  List  months =[
    "january","february","march","april","may","june","july","august","september","october","november","december"
  ];

  monthfun(){
   if (months == "january" || months == "march" ||
       months == "may" || months == "july"
       || months == "september" || months == "november") {
     for (int day = 1; day <= 31; day++) {
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
   }
   else if (months =="february" || months =="april" ||
       months == "june" || months =="august"
       || months =="october" || months == "december") {
     for (int day = 1; day <= 30; day++) {
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
   }
 }

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

  attendaceupload() async {
    var document= await FirebaseFirestore.instance.collection("Students").orderBy("timestamp").get();
    for(int i=0;i<document.docs.length;i++){
      if(document.docs[i]["admitclass"]==_typeAheadControllerclass.text && document.docs[i]["section"]==_typeAheadControllersection.text){
        FirebaseFirestore.instance.collection("Attendance").doc("${_typeAheadControllerclass.text}${_typeAheadControllersection.text}").
        collection("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}").doc().set({
          "stname":document.docs[i]["stname"],
          "regno":document.docs[i]["regno"],
          "stdocid":document.docs[i].id,
          "present":present[i],
          "order":i
        });
        if(present[i]==true){
          FirebaseFirestore.instance.collection("Students").doc(document.docs[i].id).collection("Attendance").
          doc("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}").set({
            "Attendance":"Present",
            "Date":"${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
            "timesatmp":DateTime.now().millisecondsSinceEpoch,
          });
        }
        if(present[i]==false){
          FirebaseFirestore.instance.collection("Students").doc(document.docs[i].id).collection("Attendance").
          doc("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}").set({
            "Attendance":"Absent",
            "Date":"${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
            "timesatmp":DateTime.now().millisecondsSinceEpoch,
          });
          FirebaseFirestore.instance.collection("Students").doc(document.docs[i].id).update({
            "absentdays":FieldValue.increment(1),
          });

        }

      }
    }

  }

  Successdialog(){
    return AwesomeDialog(
      width: 450,
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Attendance Submitted Successfully',
      desc: 'Attendance Submitted for - ${_typeAheadControllerclass.text} ${_typeAheadControllersection.text}',

      btnCancelOnPress: () {

      },
      btnOkOnPress: () {


      },
    )..show();
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

  bool marked= false;

  checkattendance() async {
    setState(() {
      marked= false;
    });
    var document = await FirebaseFirestore.instance.collection("Attendance").doc("${_typeAheadControllerclass.text}${_typeAheadControllersection.text}").collection("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}").get();
    if(document.docs.length>=1){
      setState(() {
        marked= true;
      });
      print(marked);
    }
    print("sddddddddddddddddddddddddf");
  }

  TextEditingController homecoller=TextEditingController();
  dynamic formatterDate = DateFormat('dd');
  dynamic currentTime = DateFormat.jm().format(DateTime.now());

  SuccessHomeworkdialog(){
    return AwesomeDialog(
      width: 450,
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Homework Submitted Successfully',
      desc: 'Homework Submitted for - ${_typeAheadControllerclass.text} ${_typeAheadControllersection.text}',

      btnCancelOnPress: () {

      },
      btnOkOnPress: () {


      },
    )..show();
  }

   add () {
     FirebaseFirestore.instance.collection("homeworks").
     doc("${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}").
     collection(_typeAheadControllerclass.text).doc(_typeAheadControllersection.text).collection("class HomeWorks")
         .doc().set({
       "class"  : _typeAheadControllerclass.text,
       "section"  : _typeAheadControllersection.text,
       "date"   : "${ DateTime.now().day}/${ DateTime.now().month}/${ DateTime.now().year}",
       "des"    : homecoller.text,
       "timestamp":DateTime.now().millisecondsSinceEpoch,
       "Time":DateFormat.yMMMd().format(DateTime.now()),
       "statffname":staffname,
       "statffregno":staffregno,
       "statffid":staffid,
     });
     _typeAheadControllerclass.clear();
     _typeAheadControllersection.clear();
     homecoller.clear();
     setState(() {
        dropdownValue4="Class";
        dropdownValue5="Section";
     });
   }
   
   value (id){
     FirebaseFirestore.instance.collection("Students").doc(id).update({

       "value" : "Good"

     });
   }

}
