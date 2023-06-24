import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Circulars extends StatefulWidget {
  const Circulars({Key? key}) : super(key: key);

  @override
  State<Circulars> createState() => _CircularsState();
}

class _CircularsState extends State<Circulars> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff3D8CF8),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:height*12/61.41),

            Stack(
              children: [
                Container(height: height*36/20.472,width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    height: height*30/24.566,
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

                          Text("Circulars",style: GoogleFonts.poppins(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),),

                          SizedBox(height: height*2/368.5,),

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
                          ) ,  /// date/day





                          SizedBox(height: height*4/184.25),

                          Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,

                          ),


                          SizedBox(height: height*4/184.25),


                         Container(
                           height: height*12/61.416,
                           width: width*20/15,

                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(12),
                             border: Border.all(color: Colors.black)
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(10),
                             child: Column (
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [


                                 Row(
                                   children: [
                                     Image.asset("assets/Exlmtry.png"),

                                     SizedBox(width: 8,),

                                     Text("School Will Be Holidays Tomorrow",
                                       style: GoogleFonts.poppins(
                                         color: Colors.black,
                                         fontSize: 18,
                                         fontWeight: FontWeight.w600
                                     ),),
                                   ],
                                 ) ,

                                 SizedBox(height: 10,),

                                 Expanded(
                                   child: Text("Due to heavy rain the school will be leave tomorrow",
                                     style: GoogleFonts.poppins(
                                         color: Colors.black,
                                         fontSize: 15,
                                         fontWeight: FontWeight.w500
                                     ),),
                                 ),


                                 Row(
                                   children: [


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

                                         Text("12.30am",style: GoogleFonts.poppins(
                                             color: Colors.grey.shade700,
                                             fontSize: 15,
                                             fontWeight: FontWeight.w500
                                         ),),

                                       ],
                                     ) ,

                                     SizedBox(
                                       width: width*8/37.5,
                                     ),
                                     Text(" Principal",
                                       style: GoogleFonts.poppins(
                                           color: Colors.green,
                                           fontSize: 20,
                                           fontWeight: FontWeight.w600
                                       ),),
                                   ],
                                 ) ,

                               ],
                             ),
                           ),
                         ), ///   circular container

                          SizedBox(height: 20),


                          Container(
                            height: height*12/61.416,
                            width: width*20/15,

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column (
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [


                                  Row(
                                    children: [
                                      Image.asset("assets/Exlmtry.png"),

                                      SizedBox(width: 8,),

                                      Text("School Will Be Holidays Tomorrow",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600
                                        ),),
                                    ],
                                  ) ,

                                  SizedBox(height: 10,),

                                  Expanded(
                                    child: Text("Due to heavy rain the school will be leave tomorrow",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                      ),),
                                  ),


                                  Row(
                                    children: [


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

                                          Text("12.30am",style: GoogleFonts.poppins(
                                              color: Colors.grey.shade700,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500
                                          ),),

                                        ],
                                      ) ,

                                      SizedBox(
                                        width: width*8/37.5,
                                      ),

                                      Text(" Principal",
                                        style: GoogleFonts.poppins(
                                            color: Colors.green,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600
                                        ),),
                                    ],
                                  ) ,

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
                    height: height*4/46.06,
                    width:  width*15.5/19.354,
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
