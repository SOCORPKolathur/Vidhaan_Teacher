import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homework extends StatefulWidget {
  const Homework({Key? key}) : super(key: key);

  @override
  State<Homework> createState() => _HomeworkState();
}

class _HomeworkState extends State<Homework> {

  String? _chosenValue;
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;


    return Scaffold(

      backgroundColor: Color(0xff3D8CF8),


      body: SingleChildScrollView (

        child: Column(
          children: [
            SizedBox(height: height/73.7),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Date",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),),

                  SizedBox(
                      width: width/60
                  ),

                  Icon(Icons.info_outline_rounded,color: Colors.white, size: 22,),



                  Row(
                    children: [
                      Container(
                          height: 28,width: 28,
                          child: Image.asset("assets/Date.png",fit: BoxFit.cover,
                            color: Colors.white,)),


                      SizedBox(
                          width: width/60
                      ),

                      Text("June 2002",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 19
                        ),),
                    ],
                  ),



                ],
              ),
            ),

            SizedBox(height: height/73.7),/// Select Date


            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mo",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("Tu",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("We",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("Th",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("Fr",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("Sa",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("Su",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),)

                ],
              ),
            )  ,// Dasy

            SizedBox(
                height: MediaQuery.of(context).size.height*2/100
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("12",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("12",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("14",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("14",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("15",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("15",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("14",style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),)

                ],
              ),
            ),  // date

            SizedBox(height: height/36.85 ),

            Divider(
              color: Colors.white,
              thickness: 1.5,
              endIndent: 10,
              indent: 10,
            ),


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

                          Text("HomeWork",style: GoogleFonts.poppins(
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
                            color: Colors.grey.shade400,
                            thickness: 1.5,

                          ),

                          SizedBox(height: 10),

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
                              child: DropdownButton<String>(
                                focusColor:Colors.white,
                                value: _chosenValue,
                                style: TextStyle(color: Colors.white),
                                iconEnabledColor:Colors.black,
                                items: <String>[
                                  'Android',
                                  'IOS',
                                  'Flutter',
                                  'Node',
                                  'Java',
                                  'Python',
                                  'PHP',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,style:TextStyle(color:Colors.black),),
                                  );
                                }).toList(),
                                hint:Text(
                                  "Please choose a langauage",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _chosenValue = value;
                                  });
                                },
                              ),

                              // child: Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //
                              //     Text("6th Grade B Section",
                              //       style: GoogleFonts.poppins(
                              //           color: Colors.blueAccent,
                              //           fontSize: 18,
                              //           fontWeight: FontWeight.w600
                              //       ),),
                              //
                              //     Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)
                              //   ],
                              // ),
                            ),
                          ),  /// Center Container

                          SizedBox(height: 10),

                          Divider(
                            color: Colors.grey.shade400,
                            thickness: 1.5,

                          ),

                          SizedBox(height: 20),


                          Center(
                            child: Text("Type todays Home Work",style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),),
                          ), /// today homework

                          SizedBox(height: 20),

                          Center(
                            child: Container(

                              padding: EdgeInsets.only(top: 20,left: 18),
                              height: MediaQuery.of(context).size.height*18/100,

                                width: MediaQuery.of(context).size.width*80/100,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(12)
                              ),
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  decoration: InputDecoration(

                                    hintText:   "English - Read Lessons Fully",
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.grey.shade700,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,

                                  ),
                                  border: InputBorder.none

                                ),),
                            ),
                          ),    /// center container


                          SizedBox(height: 15),


                          Center(
                            child: Container(


                              height: MediaQuery.of(context).size.height*5/100,

                              width: MediaQuery.of(context).size.width*44/100,

                              decoration: BoxDecoration(
                                  color: Color(0xff609F00),
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(7)
                              ),
                              child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Assign Now",style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  ),),

                                  Image.asset("assets/notes.png")
                                ],
                              ),
                            ),
                          ),




















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
      ),

    );
  }
}
