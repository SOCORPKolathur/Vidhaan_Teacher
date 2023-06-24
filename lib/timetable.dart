import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Timetable extends StatefulWidget {
  const Timetable({Key? key}) : super(key: key);

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {


  int currentDate =0;
  int cyear =0;
  String day ="";
  String month ="";

  Date(){
    setState(() {
      day = DateFormat('EEEE').format(DateTime.now());

      cyear =DateTime.now().year;

      currentDate = DateTime.now().day;
    });

    print(day);
    print(currentDate);

  }
  @override

  void initState() {
    Date();
    dayfun();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xff3D8CF8),

      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(


          children: [
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top:15),
              child: Row(
                children: [
                  Text("Select Date",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),),

                  SizedBox(
                      width: 5
                  ),

                  Icon(Icons.info_outline_rounded,color: Colors.white, size: 22,),


                  SizedBox(
                      width: MediaQuery.of(context).size.width*24/100
                  ),


                  Container(
                      height: 28,width: 28,
                      child: Image.asset("assets/Date.png",fit: BoxFit.cover,
                        color: Colors.white,)),

                  SizedBox(
                      width: 5
                  ),

                  Text("June ${cyear.toString()}",

                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 19
                    ),),


                ],
              ),
            ),

            SizedBox(height: 18),/// Select Date


            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Container(
                    width : 46,
                    decoration: BoxDecoration(
                        color: day == "Monday"? Colors.white:Colors.transparent,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(

                      children: [
                        Text("Mo",style: GoogleFonts.poppins(
                            color: day == "Monday"? Colors.blue:Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),

                        SizedBox(height: 15),

                        Text(Day1.toString(),style: GoogleFonts.poppins(
                            color: day == "Monday"? Colors.blue:Colors.white,

                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),

                      ],
                    ),
                  ),


                  Container(
                    width : 46,
                    decoration: BoxDecoration(
                        color: day == "Tuesday"? Colors.white:Colors.transparent,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      children: [
                        Text("Tu",style: GoogleFonts.poppins(
                            color: day == "Tuesday"? Colors.blue:Colors.white,

                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),

                        SizedBox(height: 15),

                        Text(Day2.toString(),style: GoogleFonts.poppins(
                            color: day == "Tuesday"? Colors.blue:Colors.white,

                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),


                  Container(
                    width : 46,
                    decoration: BoxDecoration(
                        color: day == "Wednesday"? Colors.white:Colors.transparent,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      children: [
                        Text("We",style: GoogleFonts.poppins(
                            color: day == "Wednesday"? Colors.blue:Colors.white,

                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),

                        SizedBox(height: 15),


                        Text(Day3.toString(),style: GoogleFonts.poppins(
                            color: day == "Wednesday"? Colors.blue:Colors.white,

                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),


                  Container(
                    width : 46,
                    decoration: BoxDecoration(
                        color: day == "Thusday"? Colors.white:Colors.transparent,
                        borderRadius: BorderRadius.circular(8)
                    ),

                    child: Column(
                      children: [
                        Text("Th",style: GoogleFonts.poppins(
                            color: day == "Thusday"? Colors.blue:Colors.white,

                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),

                        SizedBox(height: 15),


                        Text(Day4.toString(),style: GoogleFonts.poppins(
                            color: day == "Thusday"? Colors.blue:Colors.white,

                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),


                  Container(
                    width : 46,
                    decoration: BoxDecoration(
                        color: day == "Friday"? Colors.white:Colors.transparent,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      children: [
                        Text("Fr",style: GoogleFonts.poppins(
                            color: day == "Friday"? Colors.blue:Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),

                        SizedBox(height: 15),

                        Text(Day5.toString(),style: GoogleFonts.poppins(
                            color: day == "Friday"? Colors.blue:Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),

                  Container(
                    width : 46,
                    decoration: BoxDecoration(
                        color: day == "Saturday"? Colors.white:Colors.transparent,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      children: [
                        Text("Sa",style: GoogleFonts.poppins(
                            color: day == "Saturday"? Colors.blue:Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),

                        SizedBox(
                            height: height/49.133,
                        ),


                        GestureDetector(
                          onTap: (){
                            print(MediaQuery.of(context).size.height);
                          },
                          child: Text(Day6.toString(),style: GoogleFonts.poppins(
                              color: day == "Saturday"? Colors.blue:Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),),
                        ),
                      ],
                    ),
                  ),


                  Container(
                    width : 46,
                    decoration: BoxDecoration(
                        color: day == "Sunday"? Colors.white:Colors.transparent,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      children: [
                        Text("Su",style: GoogleFonts.poppins(
                            color: day == "Sunday"? Colors.blue:Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),

                        SizedBox(height: 15),

                        Text(Day7.toString(),style: GoogleFonts.poppins(
                            color: day == "Sunday"? Colors.blue:Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),)
                      ],
                    ),
                  ),


                ],
              ),
            )  ,// Dasy


            SizedBox(height: 28),

            Divider(
              color: Colors.white,
              thickness: 1.5,
              endIndent: 10,
              indent: 10,
            ),

            SizedBox(height: 10),


            Stack(
              children: [
                Container(height: 700,width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35)
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Time Table",style: GoogleFonts.poppins(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),),

                          SizedBox(height: 8,),

                          Row(
                            children: [
                              Text("14-06-2023",style: GoogleFonts.poppins(
                                  color: Colors.grey.shade700,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              ),),

                              SizedBox(width: 9,),

                              Container(
                                height: 15,
                                width: 2,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 9,),

                              Text("Wednesday",style: GoogleFonts.poppins(
                                  color: Colors.grey.shade700,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              ),),

                            ],
                          ) ,/// date/day


                          SizedBox(height: 20),

                          Divider(
                            color: Colors.black,
                            thickness: 0.5,

                          ),

                          SizedBox(height: 15),

                          Center(
                            child: Container(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              height: MediaQuery.of(context).size.height*6/100,
                              width: MediaQuery.of(context).size.width*80/100,

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text("6th Grade B Section",
                                    style: GoogleFonts.poppins(
                                        color: Colors.blueAccent,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),),

                                  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)
                                ],
                              ),
                            ),
                          ),  /// Center Container

                          SizedBox(height: 15),

                          Divider(
                            color: Colors.black,
                            thickness: 0.5,

                          ),

                          SizedBox(height: 6),

                          Expanded(

                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: MediaQuery.of(context).size.height*40/100,
                              width: MediaQuery.of(context).size.width*100/100,
                              decoration: BoxDecoration(
                                
                                color:  Color(0xff3D8CF8),
                                borderRadius: BorderRadius.circular(12)

                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [


                                  Stack(
                                    children: [

                                      Container(
                                      height: MediaQuery.of(context).size.height*5/100,
                                      width: MediaQuery.of(context).size.width*86/100,

                                      decoration: BoxDecoration(

                                          color:  Color(0xffECECEC),
                                          borderRadius: BorderRadius.circular(18)

                                      ),
                                        child:  Padding(

                                          padding: EdgeInsets.only(left: 80),

                                          child: Center(
                                            child: Text("6th Grade B Section",

                                              style: GoogleFonts.poppins(
                                                  color: Colors.blueAccent,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600
                                              ),),
                                          ),
                                        ),
                                    ),

                                      Container(
                                        height: MediaQuery.of(context).size.height*5/100,
                                        width: MediaQuery.of(context).size.width*25/100,

                                        decoration: BoxDecoration(

                                            color:  Colors.white,
                                            borderRadius: BorderRadius.circular(18)

                                        ),
                                        child:  Center(
                                          child: Text(" 1 HR",
                                            style: GoogleFonts.poppins(
                                                color: Colors.blueAccent,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600
                                            ),),
                                        ),
                                      ),


                                    ]
                                  ),

                                  Stack(
                                      children: [

                                        Container(
                                          height: MediaQuery.of(context).size.height*5/100,
                                          width: MediaQuery.of(context).size.width*86/100,

                                          decoration: BoxDecoration(

                                              color:  Color(0xffECECEC),
                                              borderRadius: BorderRadius.circular(18)

                                          ),
                                          child:  Padding(

                                            padding: EdgeInsets.only(left: 80),

                                            child: Center(
                                              child: Text("7th Grade C Section",

                                                style: GoogleFonts.poppins(
                                                    color: Colors.blueAccent,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600
                                                ),),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          height: MediaQuery.of(context).size.height*5/100,
                                          width: MediaQuery.of(context).size.width*25/100,

                                          decoration: BoxDecoration(

                                              color:  Colors.white,
                                              borderRadius: BorderRadius.circular(18)

                                          ),
                                          child:  Center(
                                            child: Text(" 2 HR",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.blueAccent,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600
                                              ),),
                                          ),
                                        ),


                                      ]
                                  ),

                                  Stack(
                                      children: [

                                        Container(
                                          height: MediaQuery.of(context).size.height*5/100,
                                          width: MediaQuery.of(context).size.width*86/100,

                                          decoration: BoxDecoration(

                                              color:  Color(0xffECECEC),
                                              borderRadius: BorderRadius.circular(18)

                                          ),
                                          child:  Padding(

                                            padding: EdgeInsets.only(left: 80),

                                            child: Center(
                                              child: Text("6th Grade A Section",

                                                style: GoogleFonts.poppins(
                                                    color: Colors.blueAccent,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600
                                                ),),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          height: MediaQuery.of(context).size.height*5/100,
                                          width: MediaQuery.of(context).size.width*25/100,

                                          decoration: BoxDecoration(

                                              color:  Colors.white,
                                              borderRadius: BorderRadius.circular(18)

                                          ),
                                          child:  Center(
                                            child: Text(" 3 HR",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.blueAccent,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600
                                              ),),
                                          ),
                                        ),


                                      ]
                                  ),

                                  Stack(
                                      children: [

                                        Container(
                                          height: MediaQuery.of(context).size.height*5/100,
                                          width: MediaQuery.of(context).size.width*86/100,

                                          decoration: BoxDecoration(

                                              color:  Color(0xffECECEC),
                                              borderRadius: BorderRadius.circular(18)

                                          ),
                                          child:  Padding(

                                            padding: EdgeInsets.only(left: 80),

                                            child: Center(
                                              child: Text("6th Grade B Section",

                                                style: GoogleFonts.poppins(
                                                    color: Colors.blueAccent,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600
                                                ),),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          height: MediaQuery.of(context).size.height*5/100,
                                          width: MediaQuery.of(context).size.width*25/100,

                                          decoration: BoxDecoration(

                                              color:  Colors.white,
                                              borderRadius: BorderRadius.circular(18)

                                          ),
                                          child:  Center(
                                            child: Text(" 4 HR",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.blueAccent,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600
                                              ),),
                                          ),
                                        ),


                                      ]
                                  ),

                                  Stack(
                                      children: [

                                        Container(
                                          height: MediaQuery.of(context).size.height*5/100,
                                          width: MediaQuery.of(context).size.width*86/100,

                                          decoration: BoxDecoration(

                                              color:  Color(0xffECECEC),
                                              borderRadius: BorderRadius.circular(18)

                                          ),
                                          child:  Padding(

                                            padding: EdgeInsets.only(left: 80),

                                            child: Center(
                                              child: Text("10th Grade D Section",

                                                style: GoogleFonts.poppins(
                                                    color: Colors.blueAccent,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600
                                                ),),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          height: MediaQuery.of(context).size.height*5/100,
                                          width: MediaQuery.of(context).size.width*25/100,

                                          decoration: BoxDecoration(

                                              color:  Colors.white,
                                              borderRadius: BorderRadius.circular(18)

                                          ),
                                          child:  Center(
                                            child: Text(" 5 HR",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.blueAccent,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600
                                              ),),
                                          ),
                                        ),


                                      ]
                                  )
                                ],
                              ),
                            ),
                          )





















                        ],
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 40,bottom: 600),
                  child: Container(
                    height: MediaQuery.of(context).size.height*8.5/100,
                    width: MediaQuery.of(context).size.width*80/100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                        ],
                        borderRadius: BorderRadius.circular(12)
                    ),

                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          prefix: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Image.asset("assets/search.png",color: Colors.grey.shade900,),
                          ),


                          hintText: "Search",
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.grey.shade900,
                              fontSize: 18
                          )
                      ),
                    ),
                  ),
                ),

                // textfield

              ],
            ),
          ],
        ),
      )


    );
  }




  int Day1=0;
  int Day2=0;
  int Day3=0;
  int Day4=0;
  int Day5=0;
  int Day6=0;
  int Day7=0;
  dayfun() {

    if(day == "Monday"){
      setState(() {
        Day1  =   currentDate+0;
        Day2  =   currentDate+1;
        Day3  =   currentDate +2;
        Day4  =   currentDate+3;
        Day5  =   currentDate +4;
        Day6  =   currentDate+5;
        Day7  =   currentDate+6;
      });


    } else if (day == "Tuesday"){
      setState(() {
        Day1  =   currentDate-1;
        Day2  =   currentDate+0;
        Day3  =   currentDate +1;
        Day4  =   currentDate+2;
        Day5  =   currentDate +3;
        Day6  =   currentDate+4;
        Day7  =   currentDate+5;
      });
    }

  }
}
