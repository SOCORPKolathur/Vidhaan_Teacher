import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidhaan_teacher_dart/homepage.dart';

class Otppage extends StatefulWidget {

  String phoneController;
  String nameController;
  String staffid;

  Otppage(this.phoneController,this.nameController,this.staffid);
  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {

  TextEditingController otpController = TextEditingController();

  bool isSelected = false;
  @override
  void initState() {
    _verifyphone();
    // TODO: implement initState
    super.initState();
  }

  var _verificationCode;

  _verifyphone()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phoneController}" ,
        verificationCompleted:(PhoneAuthCredential credential)async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value)async{
            if(value.user!=null){
              print("Valied Otp");

            }
          });
        },
        verificationFailed:(FirebaseAuthException e){
          print(e.message);

          print("Vaerification failed");
        } ,
        codeSent:(String ?verificationid ,int ?resendtoken ){
          setState(() {
            _verificationCode=verificationid;
          });
        },
        codeAutoRetrievalTimeout:( String verificationid){
          setState(() {
            _verificationCode=verificationid;
          });
        },timeout: Duration(seconds: 120) );


  }
  String otp="";
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Center(
        child:SingleChildScrollView(
          child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height:height*6/122.83),

              Image.asset("assets/otp.png"),

              SizedBox(height:height*4/122.83),


              Text("OTP Verification ",


                style: GoogleFonts.montserrat(

                    color: Colors.black,
                    fontWeight: FontWeight.bold,fontSize: 24


                ),),

              SizedBox(height:height*4/122.83),


              Text("Enter The OTP Sent To + 91",


                style: GoogleFonts.montserrat(

                    color: Colors.grey,
                    fontWeight: FontWeight.w400,fontSize: 18


                ),),

              SizedBox(height:height*3/222.83),


              Text(widget.phoneController,


                style: GoogleFonts.montserrat(

                    color: Colors.black,
                    fontWeight: FontWeight.w600,fontSize: 18


                ),),

              SizedBox(height:height*4/122.83),


              OtpTextField(
                onSubmit: (value){
                  setState(() {
                    otp=value;
                  });
                  print(otp);
                },

                numberOfFields: 6,
                borderColor: Color(0xFF512DA8),
              ),

              SizedBox(height:height*4/122.83),


              Padding(
                padding: const EdgeInsets.only(left: 15,right: 10,top: 10),
                child: Row(
                  children: [


                    Expanded(
                      child: RichText(
                        text: TextSpan(

                            text:"Didn't You receive the OTP? ",
                            style: GoogleFonts.montserrat(
                                color: Colors.grey.shade700,
                                fontSize: 14

                            ),
                            children: <TextSpan>[

                              TextSpan(text: "Resend OTP",
                                  style: GoogleFonts.montserrat(color: Color(0xff1D3BFF),
                                  fontSize: 14
                              )),




                            ]


                        ),


                      ),
                    ),




                  ],
                ),
              ),

              SizedBox(height:height*9/81.881 ),


              Container(
                height: height*7/92.125,
                width: width*14/23.75,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff196EEF),
                      Color(0xff3786F7),
                    ]
                  ),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: GestureDetector(
                  onTap: ()async{

                    FirebaseAuth.instance.signInWithCredential(
                      PhoneAuthProvider.credential(
                        verificationId: _verificationCode,
                        smsCode: otp)).then((value) => {
                          if(value.user!=null){

                        FirebaseFirestore.instance.collection("Staffs").doc(widget.staffid).update({

                          "userid":FirebaseAuth.instance.currentUser!.uid,

                        }),
                    Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context)=> Homepage()),(Route<dynamic> route) => false),


                          }
                        });
                    },

                  child:  Center(
                    child: Text("Verify",
                      style: GoogleFonts.montserrat(

                          color: Colors.white,
                          fontWeight: FontWeight.w600,fontSize:24


                      ),),
                  ),
                ),
              ),

              SizedBox(height:height*3/222.83),


          Container(
            height: height*1/92.125,
            width: width*8/23.75,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(6)
            ),
          )
            ],
          ),
        ),
      ),

    );
  }


}
