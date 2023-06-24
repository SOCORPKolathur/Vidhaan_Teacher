import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Behaviour extends StatefulWidget {
  const Behaviour({Key? key}) : super(key: key);

  @override
  State<Behaviour> createState() => _BehaviourState();
}

class _BehaviourState extends State<Behaviour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff3D8CF8),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*10/100),

            Stack(
              children: [
                Container(height: 800,width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    height: 900,
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

                          Text("Behaviour",style: GoogleFonts.poppins(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),),

                            SizedBox(height: 8,),

                          Text("Student report",style: GoogleFonts.poppins(
                              color: Colors.grey.shade700,
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                          ),),




                          SizedBox(height: 20),

                          Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,

                          ),

                          SizedBox(height: 14),

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

                          SizedBox(height: 14),

                          Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,

                          ),

                          SizedBox(height: 10),


                          Center(
                            child: Text("Click the Student to change their value",
                              style: GoogleFonts.poppins(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),),
                          ), /// today homework


                          Container(
                            padding: EdgeInsets.only(left: 20,right: 25,top: 15),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Name",style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),

                                Text("Value",style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline
                                ),),

                              ],
                            ),
                          ),  /// Name


                          Container(
                            padding: EdgeInsets.only(left: 20,right: 25,top: 15),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ArunKumar",style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),
                                  Container(
                                    height: 25,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset("assets/thumup.png"),
                                        Text("Good",style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600
                                        ),),

                                      ],
                                    ),


                                  ),
                              ],
                            ),
                          ),   ///  good


                          Container(
                            padding: EdgeInsets.only(left: 20,right: 25,top: 15),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Danial",style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),
                                Container(
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset("assets/awar.png"),
                                      Text("Average",style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600
                                      ),),
                                    ],
                                  ),


                                ),
                              ],
                            ),
                          ),   /// average


                          Container(
                            padding: EdgeInsets.only(left: 20,right: 25,top: 15),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Jackson",style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),
                                Container(
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset("assets/thumup.png"),
                                      Text("Good",style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600
                                      ),),

                                    ],
                                  ),


                                ),
                              ],
                            ),
                          ),


                          Container(
                            padding: EdgeInsets.only(left: 20,right: 25,top: 15),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Swetha",style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),
                                Container(
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Bad",style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600
                                      ),),
                                      Image.asset("assets/thumsdown.png"),

                                    ],
                                  ),


                                ),
                              ],
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
      )

    );
  }
}
