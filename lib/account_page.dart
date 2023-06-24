import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidhaan_teacher_dart/otp_page.dart';

class Accountpage extends StatefulWidget {
  const Accountpage({Key? key}) : super(key: key);

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  bool isSelected = false;




  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height:height*6/122.83),

              Stack(
                children: [


                  Container(
                    height: height*24 /73.7,
                      width: width*24/30,

                      padding: EdgeInsets.only(left: 50),
                      child: Image.asset("assets/account.png",fit: BoxFit.cover,)),

                  Positioned(
                    bottom: 85,
                    left: 50,

                    child: Text("Get Started",


                      style: GoogleFonts.montserrat(

                          color: Colors.black,
                          fontWeight: FontWeight.w500,fontSize: 38


                      ),),
                  ),

                  Positioned(
                    bottom: 65,
                    left: 10,

                    child: Text("by logging to your account",


                      style: GoogleFonts.montserrat(

                          color: Colors.grey,
                          fontWeight: FontWeight.w500,fontSize: 15


                      ),),
                  ),





                ],
              ) ,   /// image


              Container(

                height: height*8/92.125,
                width: width*16/18.75,

                decoration: BoxDecoration(
                    color: Colors.grey.shade200 ,
                  borderRadius: BorderRadius.circular(15)
                ),

                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none

                      ),
                    hintText: "Full name",
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 20,


                    ),
                    suffixIcon: Icon(Icons.person_outline,color: Colors.grey.shade400,size: 30,)
                  ),
                ),
              ),   /// textfield

              SizedBox(height:height*4/122.83),





              Container(

                height: height*8/92.125,
                width: width*16/18.75,

                decoration: BoxDecoration(
                    color: Colors.grey.shade200 ,
                    borderRadius: BorderRadius.circular(15)
                ),

                child: TextField(
                   controller: phoneController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none

                      ),
                      hintText: "Phone Number",
                      hintStyle: GoogleFonts.montserrat(
                        color: Colors.grey,
                        fontSize: 20,

                      ),
                      suffixIcon: Icon(Icons.phone_android_sharp,color: Colors.grey.shade400,size: 30,)
                  ),
                ),
              ),      /// textfield


              Padding(
                padding: const EdgeInsets.only(left: 15,right: 10,top: 10),
                child: Row(
                  children: [
                    Checkbox(
                        value: isSelected,
                        onChanged: (value){
                          setState(() {
                            isSelected = value!;

                          });
                        }),

                    Expanded(
                      child: RichText(
                          text: TextSpan(

                              text:"By checking The Box You agree ",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 12

                          ),
                            children: <TextSpan>[

                              TextSpan(text: "Terms and Condition",style: GoogleFonts.montserrat(color: Colors.blue,
                              fontSize: 12
                              )),




                            ]


                          ),


                      ),
                    )
                  ],
                ),
              ),
              /// checkbox
              SizedBox(height:height*6/122.83),

              GestureDetector(
                onTap: ()async{

                  updatestaff();

                },
                child: Container(
                  height: height*8/92.125,
                  width: width*18/23.75,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff196EEF),
                            Color(0xff3786F7),
                          ]
                      ),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text("Get OTP",


                      style: GoogleFonts.montserrat(

                          color: Colors.white,
                          fontWeight: FontWeight.w500,fontSize:23


                      ),),
                  ),
                ),
              ),     ///  get otp

              SizedBox(height:height*3/222.83),


              RichText(
                text: TextSpan(

                    text:"Already Have a member ",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 12,
                      fontWeight: FontWeight.w500

                    ),
                    children: <TextSpan>[

                      TextSpan(text: "Log in",style: GoogleFonts.montserrat(color: Colors.blue,
                          fontSize: 12,
                        fontWeight: FontWeight.bold
                      )),




                    ]


                ),


              ),
            ],
          ),
        ),
      ),





    );
  }
  String staffid="";
  int staffidlength=0;
  updatestaff() async {
    var document = await FirebaseFirestore.instance.collection("Staffs").get();
    for(int i=0;i<document.docs.length;i++){
      if(document.docs[i]["mobile"]==phoneController.text){
        setState(() {
          staffid=document.docs[i].id;
          staffidlength=staffidlength+1;
        });
      }
    };
    if(staffidlength<1){
      print("error phone number");
    }
    else{
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Otppage(
        phoneController.text,
        nameController.text,
        staffid,
      )));
    }



  }
}

