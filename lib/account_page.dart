import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vidhaan_teacher_dart/otp_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Accountpage extends StatefulWidget {
  const Accountpage({Key? key}) : super(key: key);

  @override
  State<Accountpage> createState() => _AccountpageState();
}
List<String> mot=<String>["Student","Teacher"];
class _AccountpageState extends State<Accountpage> {
  bool isSelected = false;

  String Dropwdownvalue=mot.first;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  double targetValue = 240;
  bool anim=false;

  @override
  void initState() {
    setState(() {
      anim=true;
      hide=false;
    });

    // TODO: implement initState
    super.initState();
  }
  bool hide=false;


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(

      body:
     /* SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height:height*6/122.83),

                Stack(
                  children: [

                    Container(
                      height: height*24 /73.7,
                        width: width*24/30,
                        padding: EdgeInsets.only(left: width/7.2),
                        child: SvgPicture.asset("assets/undraw_educator_re_ju47.svg")),

                    Positioned(
                      bottom: height/8.894,
                      left: width/7.2,

                      child: Text("Get Started",


                        style: GoogleFonts.montserrat(

                            color: Colors.black,
                            fontWeight: FontWeight.w500,fontSize: 38


                        ),),
                    ),

                    Positioned(
                      bottom: height/11.630,
                      left: width/36,

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

                  child:DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint:  Row(
                        children: [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'Select Item',
                              style: GoogleFonts.poppins(
                                  fontSize: 15
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: mot.map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style:  TextStyle(
                              fontSize: 15
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )).toList(),
                      value:  Dropwdownvalue,
                      onChanged: (String? value) {
                        setState(() {
                          nameController.text = value!;
                          Dropwdownvalue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        width: 160,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),

                          color: Color(0xffDDDEEE),
                        ),

                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffDDDEEE),
                        ),

                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(7),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility: MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),

                 /* TextField(
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
                  ),*/
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
                  padding:  EdgeInsets.only(left: width/24,right: height/36,top: height/75.6),
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
                  onTap: ()
                  async{

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
        ),*/
      Stack(
        children: [
          FlutterLogin(

            loginProviders: [],

            logo: "assets/TextWhitelogo.png",
            logoTag: "Educare",
            titleTag:"",userType: LoginUserType.name,


            onLogin: (LoginData) {
              setState(() {
                phoneController.text=LoginData.password;
                Dropwdownvalue= nameController.text;
              });
              updatestaff();
              print("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
              print(phoneController.text);
              print(nameController.text );
              print(Dropwdownvalue);
              print(LoginData.name);
              print(LoginData.password);
            },
            onRecoverPassword: (String ) {  },
            additionalSignupFields: [

            ],

          ),
          hide==false?
          Padding(
        padding:  EdgeInsets.only(left:width/ 6,top: height/2.7),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.linear,
          height: height/16.434,
          width: anim==true?width/1.5:0,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint:  Row(
                children: [
                  Icon(
                    Icons.list,
                    size: width/22.5,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width:width/ 90,
                  ),
                  Expanded(
                    child: Text(
                      'Select Item',
                      style: GoogleFonts.poppins(
                          fontSize:width/ 24
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              items: mot.map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style:  TextStyle(
                      fontSize:width/ 24
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )).toList(),
              value:  Dropwdownvalue,
              onChanged: (String? value) {
                setState(() {
                  nameController.text = value!;
                  Dropwdownvalue = value;
                });
                print("Dropwdownvalue");
                print(Dropwdownvalue);
                print(nameController.text);
              },
              buttonStyleData: ButtonStyleData(
                height: height/15.12,
                width: width/2.25,
                padding:  EdgeInsets.only(left: width/25.714, right: width/25.714),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),

                  color: Color(0xffebf4fb),
                ),

              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 14,
                iconEnabledColor: Colors.black,
                iconDisabledColor: Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffebf4fb),
                ),

                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(7),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData:  MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: width/25.714, right: width/25.714),
              ),
            ),
          ),
        ),
      ):SizedBox()
        ],
      )



    );
  }


  String studentid="";
  int studentlength=0;

  String staffid="";
  int staffidlength=0;
  updatestaff() async {
    setState(() {
      studentid='';
      staffid='';
      studentlength=0;
      staffidlength=0;
    });
   if(Dropwdownvalue=="Teacher"){
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
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Accountpage()));
       return errordialog();
     }
     else{

       await Future.delayed(Duration(milliseconds: 850),(){
         setState(() {
           hide=true;
         });
       });
       await  Future.delayed(Duration(milliseconds: 2400),(){

         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Otppage(
           phoneController.text,
           Dropwdownvalue,
           staffid,
         )));
       });
     }
   }
    else{
     print("Student enter");
     var document2 = await FirebaseFirestore.instance.collection("Students").orderBy("stname").get();
     print(document2.docs.length);
     for(int j=0;j<document2.docs.length;j++){

       if(document2.docs[j]["mobile"]==phoneController.text){
         setState(() {
           studentid=document2.docs[j].id;
           studentlength=studentlength+1;
         });
       }
     };
     if(studentlength<1){
       return errordialog();
     }
     else{
       await Future.delayed(Duration(milliseconds: 850),(){
         setState(() {
           hide=true;
         });
       });
       await Future.delayed(Duration(milliseconds: 2400),(){
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Otppage(
           phoneController.text,
           Dropwdownvalue,
           studentid,
         )));
       });
     }
   }
  }

  errordialog(){
    double width = MediaQuery.of(context).size.width;
    return AwesomeDialog(
      width: width/0.8,
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Invalid Phone Number',
      desc: 'Sorry, Could not find your phone number',

      btnCancelOnPress: () {

      },
      btnOkOnPress: () {


      },
    )..show();
  }
}

