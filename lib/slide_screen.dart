import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidhaan_teacher_dart/account_page.dart';
class Slidepage extends StatefulWidget {
  const Slidepage({Key? key}) : super(key: key);

  @override
  State<Slidepage> createState() => _SlidepageState();
}

class _SlidepageState extends State<Slidepage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;


    return Scaffold(
       backgroundColor: Colors.white,

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            SizedBox(height:height*14/59.133 ),

            Image.asset("assets/slide_image.png"),

            SizedBox(height:height*9/81.881 ),

            Text("VIDHAAN\nTEACHERS APP",


              style: GoogleFonts.montserrat(

              color: Colors.black,
              fontWeight: FontWeight.bold,fontSize: 34


            ),),


            Text("To Your Desire",style: GoogleFonts.montserrat(

                color: Colors.grey,
                fontWeight: FontWeight.w500,fontSize: 20


            ),),

          ],
        ),
      ),


      floatingActionButton:  FloatingActionButton(
          backgroundColor: Color(0xff196EEF),
          onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Accountpage()));
          },
          child:Icon(Icons.arrow_forward_ios, size: 20,)



      ),

    );


  }
}
