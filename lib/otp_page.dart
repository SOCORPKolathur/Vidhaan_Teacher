import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';




import 'LandiongScreen_Page.dart';
import 'RiveFilr.dart';
import 'Student_Landing_Page.dart';
import 'Student_Landing_screen.dart';
import 'homepage.dart';

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



  String _deviceId =" ";
  String _deviceIdorg =" ";

  /*&initPlatformState() async {
    String? deviceId;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _deviceId = deviceId!;
      print("deviceId->$_deviceId");


    });

  }

   */


  @override
  void initState() {
    //initPlatformState();
    print(widget.phoneController);
    print(widget.nameController);
    print(widget.staffid);


    // TODO: implement initState
    super.initState();
    _verifyphone();
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

  bool loading=false;




  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child:SingleChildScrollView(
              child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height:height*6/122.83),

                  SizedBox(
                      height:height/ 2.52,
                      width: width/1.2,
                      child: Rivefile()),

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

/*
                  OtpTextField(
                    numberOfFields: 6,
                    borderColor: Color(0xFF512DA8),
                  ),*/
                  Padding(
                    padding:  EdgeInsets.symmetric(
                      vertical: height/94.5,
                      horizontal: width/45
                    ),
                    child: SizedBox(
                      height:height/15.12,
                      child: Pinput(
                        isCursorAnimationEnabled: true,
                        pinContentAlignment: Alignment.center,
                        animationDuration: Duration(microseconds:300),
                        animationCurve: Curves.easeIn,
                        length: 6,
                        closeKeyboardWhenCompleted: true,
                        autofocus: true,
                        pinAnimationType: PinAnimationType.scale,
                        keyboardAppearance:Brightness.dark,onCompleted: (value){
                        setState(() {
                          otp=value;
                        });
                        print(otp);
                      },
                        onSubmitted: (value){
                          setState(() {
                            otp=value;
                          });
                          print(otp);
                        },

                      ),
                    ),
                  ),

                  SizedBox(height:height*4/122.83),


                  Padding(
                    padding:  EdgeInsets.only(left: width/24,right: width/36,top: height/75.6),
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
                        setState(() {
                          loading=true;
                        });
                        FirebaseAuth.instance.signInWithCredential(
                          PhoneAuthProvider.credential(
                            verificationId: _verificationCode,
                            smsCode: otp)).then((value) => {
                              if(value.user!=null){


                                if(widget.nameController=="Teacher"){
                                  FirebaseFirestore.instance.collection("Staffs").doc(widget.staffid).update({
                                    "userid":FirebaseAuth.instance.currentUser!.uid,
                                  }),
                                  FirebaseFirestore.instance.collection('deviceid').doc(_deviceId).set({
                                                    "id":_deviceId.toString(),
                                                    "type":"Teacher",
                                                    }),
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context)=> Homepage()),(Route<dynamic> route) => false),
                                },
                                if(widget.nameController=="Student"){
                                  FirebaseFirestore.instance.collection("Students").doc(widget.staffid).update({
                                    "studentid":FirebaseAuth.instance.currentUser!.uid,
                                  }),
                                  FirebaseFirestore.instance.collection('deviceid').doc(_deviceId).set({
                                    "id":_deviceId.toString(),
                                    "type":"Student",
                                  }),
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context)=> Student_landing_Page()),(Route<dynamic> route) => false),
                                },


                              }
                            });
                        },

                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Verify",
                            style: GoogleFonts.montserrat(

                                color: Colors.white,
                                fontWeight: FontWeight.w600,fontSize:24


                            ),),

                        ],
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
          loading==true?Container(
            height: 300,
            width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade200
          ),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text("Plaese Wait",style: GoogleFonts.poppins(fontSize: 16),),
                SizedBox(height: 30,),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    color: Color(0xff0873c4),
                    strokeWidth: 4.5,
                  )
                )
              ],
            ),
          ):SizedBox()
        ],
      ),

    );
  }
  
  showpopup(){
    showDialog(context: context, builder: (context) {
      
      return AlertDialog(
        backgroundColor: Colors.white,
        content: SizedBox(
          child: Column(
            children: [
              Text("Please Wait Verifying Your Number",style: GoogleFonts.montserrat(),),

            ],
          ),
        ),
      );
    },);
  }
  
  


}
