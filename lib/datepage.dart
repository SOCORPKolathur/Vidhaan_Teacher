import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class Datepage extends StatefulWidget {
  const Datepage({Key? key}) : super(key: key);

  @override
  State<Datepage> createState() => _DatepageState();
}

class _DatepageState extends State<Datepage> {


  int currentDate =0;
  int cyear =0;
  String day ="";
  String month ="";
  String page ="";

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



  bool isSelected = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelectedb = false;
  bool isSelectedb2 = false;
  bool isSelectedb3 = false;
  bool isSelectedb4 = false;

  @override
  Widget build(BuildContext context) {


    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: Color(0xff3D8CF8),


      body: SingleChildScrollView(
        child: Column(
          children:   [

            SizedBox(height: height/122.83),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top:15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Select Date",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                        ),),

                      SizedBox(
                          width: width*2/368.5
                      ),
                      Icon(Icons.info_outline_rounded,color: Colors.white, size: 22,),

                    ],
                  ),   /// select Date





                  Row(
                    children: [
                      Container(
                          height: 28,width: 28,
                          child: Image.asset("assets/Date.png",fit: BoxFit.cover,
                            color: Colors.white,)),



                      SizedBox(
                          width: width*4/184.25
                      ),

                      Text("June ${cyear.toString()}",

                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 19
                        ),),

                    ],
                  ),    /// current year


                ],
              ),
            ),

            SizedBox(height: height/81.888),


            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Container(
                    width : width*6/50,
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
                    width : width*6/50,
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
                    width : width*6/50,
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
                    width : width*6/50,
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
                    width : width*6/50,
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
                    width : width*6/50,
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

                        SizedBox(height: 15),


                        Text(Day6.toString(),style: GoogleFonts.poppins(
                            color: day == "Saturday"? Colors.blue:Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),


                  Container(
                    width : width*6/50,
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


            SizedBox(height: height/122.83),

            Divider(
              color: Colors.white,
              thickness: 1.5,
              endIndent: 10,
              indent: 10,
            ),

            SizedBox(height:height/147.4),

            Stack(
              children: [
                Container(height: height/24.566,width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    height:height/29.48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35)
                        )
                    ),
                    child:Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 60),
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Attendance",style: GoogleFonts.poppins(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),),

                          Row(
                            children: [
                              Text("14-06-2023",style: GoogleFonts.poppins(
                                  color: Colors.grey.shade700,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              ),),

                              SizedBox(width: width/150,),


                              Container(
                                height: 15,
                                width: 2,
                                color: Colors.grey,
                              ),
                              SizedBox(width: width/150,),

                              Text("Wednesday",style: GoogleFonts.poppins(
                                  color: Colors.grey.shade700,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              ),),

                            ],
                          ) ,/// date/day


                          SizedBox(height: height/245.66),

                          Divider(
                            color: Colors.grey.shade400,
                            thickness: 1.5,

                          ),

                          SizedBox(height: height/245.66),


                          Center(
                            child: Container(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              height: height/122.83,
                              width: width/15,

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


                          SizedBox(height: height/245.66),

                          Divider(
                            color: Colors.grey.shade400,
                            thickness: 1.5,

                          ),

                          Row(
                            children: [

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/4.6875
                              ),

                              Text("Name",style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                              ),),

                              SizedBox(
                                  width:width/33.333
                              ),

                              Text("Present",style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                              ),),
                              SizedBox(
                                  width:width/33.333
                              ),

                              Text("Absent",style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                              ),),



                            ],
                          ),     ///  title


                          SizedBox(height:height/147.4),


                          Row(
                            children: [

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/4.6875
                              ),

                              Text("Arun Kumar",style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                              ),),

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/100
                              ),



                              Container(

                                  height: 25,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.blueAccent.shade700)
                                  ),
                                child: InkWell(

                                  onTap: (){
                                    setState(() {
                                      isSelected = !isSelected;

                                    });
                                  },

                                    child: Icon(isSelected?Icons.check:null ,color: Colors.blueAccent.shade700,)),
                                  ),

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/100
                              ),

                              Container(
                                height: 25,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.red)
                                ),
                                 child: InkWell(
                                   onTap: (){
                                     setState(() {
                                       isSelectedb =!isSelectedb;

                                     });
                                   },

                                   child: Icon(isSelectedb?Icons.clear:null ,color: Colors.red,),
                                 ),
                              ),



                            ],
                          ),

                          SizedBox(height:height/147.4),



                          Row(
                            children: [

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/4.6875
                              ),

                              Container(
                                height: 20,
                                width: 90,
                                child: Text("Daneial",style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),
                              ),

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/100
                              ),



                              Container(
                                height: 25,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.blue)
                                ),
                                child: InkWell(
                                  onTap: (){
                                    isSelected2 = !isSelected2;
                                  },

                                  child: Icon(isSelected2?Icons.check:null ,color: Colors.blue,),
                                ),

                              ),

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/100
                              ),

                              Container(
                                height: 25,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.red)
                                ),
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      isSelectedb2 = !isSelectedb2;

                                    });
                                  },
                                  child: Icon(isSelectedb2?Icons.clear:null ,color: Colors.red,),
                                ),
                              ),



                            ],
                          ),

                          SizedBox(height:height/147.4),




                          Row(
                            children: [

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/4.6875
                              ),

                              Container(
                                height: 20,
                                width: 90,
                                child: Text("Jackson",style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),
                              ),

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/100
                              ),



                              Container(

                                height: 25,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.blueAccent.shade700)
                                ),
                                child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        isSelected3 = !isSelected3;

                                      });
                                    },

                                    child: Icon(isSelected3?Icons.check :null ,color: Colors.blueAccent.shade700,)),
                              ),

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/100
                              ),

                              Container(
                                height: 25,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.red)
                                ),
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        isSelectedb3 = !isSelectedb3;

                                      });
                                    },
                                    child: Icon(isSelectedb3?Icons.clear:null ,color: Colors.red,),
                                  ),
                              ),



                            ],
                          ),

                          SizedBox(height:height/147.4),



                          Row(
                            children: [

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/4.6875
                              ),

                              Container(
                                height: 20,
                                width: 90,
                                child: Text("Swetha",style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),
                              ),

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/100
                              ),



                              Container(

                                height: 25,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.blueAccent.shade700)
                                ),
                                   child: InkWell(
                                       onTap: (){
                                         setState(() {
                                           isSelected4 = !isSelected4;

                                         });
                                       },
                                       child: Icon(isSelected4?Icons.check:null ,color: Colors.blueAccent.shade700,)),
                              ),

                              SizedBox(
                                  width: MediaQuery.of(context).size.width/100
                              ),

                              Container(
                                height: 25,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.red)
                                ),
                                 child: InkWell(
                                   onTap: (){
                                     setState(() {
                                       isSelectedb4 = !isSelectedb4;

                                     });
                                   },
                                   child: Icon(isSelectedb4?Icons.clear:null ,color: Colors.red,),
                                 ),
                              ),



                            ],
                          ),


                        ],
                      ),
                    ),

                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 40,bottom: 600),
                  child: Container(
                    height: height/46.06,
                    width:  width/19.354,
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
      ),

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


    }

    else if (day == "Tuesday"){
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

    else if (day == "Wednesday"){
      setState(() {
        Day1  =   currentDate-1;
        Day2  =   currentDate-2;
        Day3  =   currentDate +0;
        Day4  =   currentDate+1;
        Day5  =   currentDate +2;
        Day6  =   currentDate+3;
        Day7  =   currentDate+4;
      });
    }

    else if (day == "Thusday"){
      setState(() {
        Day1  =   currentDate-1;
        Day2  =   currentDate-2;
        Day3  =   currentDate -3;
        Day4  =   currentDate+0;
        Day5  =   currentDate +1;
        Day6  =   currentDate+2;
        Day7  =   currentDate+3;
      });
    }

    else if (day == "Friday"){
      setState(() {
        Day1  =   currentDate-1;
        Day2  =   currentDate-2;
        Day3  =   currentDate -3;
        Day4  =   currentDate-4;
        Day5  =   currentDate +0;
        Day6  =   currentDate+1;
        Day7  =   currentDate+2;
      });
    }

    else if (day == "Saturday"){
      setState(() {
        Day1  =   currentDate-1;
        Day2  =   currentDate-2;
        Day3  =   currentDate -3;
        Day4  =   currentDate-4;
        Day5  =   currentDate -5;
        Day6  =   currentDate+0;
        Day7  =   currentDate+1;
      });
    }

    else if (day == "Sunday"){
      setState(() {
        Day1  =   currentDate-1;
        Day2  =   currentDate-2;
        Day3  =   currentDate -3;
        Day4  =   currentDate-4;
        Day5  =   currentDate -5;
        Day6  =   currentDate-6;
        Day7  =   currentDate+0;
      });
    }




  }
}





