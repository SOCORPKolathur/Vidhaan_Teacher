

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class Today_Presents_Page extends StatefulWidget {
String name;
String regno;
  Today_Presents_Page(this.name,this.regno);
  @override
  State<Today_Presents_Page> createState() => _Today_Presents_PageState();
}

class _Today_Presents_PageState extends State<Today_Presents_Page> {


  double venderlatitude = 0;
  double venderlongitude = 0;
  double latitude = 0;
  double longitude = 0;


  String _scanBarcode = '';

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;

  late Position position;

  bool attendance=false;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
  double classlongtitude = 0;
  double classlattitude = 0;
  String section = "";

  barcodeScan() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
    print("scan qr codeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    print(_scanBarcode);



    var document = await FirebaseFirestore.instance.collection("Qrscan").doc(_scanBarcode).get();
    Map<String, dynamic>?valuses = document.data();
    setState(() {
      classlongtitude = double.parse(valuses!["longtitude"]);
      classlattitude = double.parse(valuses['lattitude']);
      section =valuses['Class'];
    });
    print(classlongtitude);
    print(classlattitude);
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }
      if (haspermission) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        setState(() {
          latitude = position.latitude;
          longitude = position.longitude;
        });
        print(position.latitude);
        print(position.longitude);
        var _distanceInMeters = await Geolocator.distanceBetween(
          classlattitude,
          classlongtitude,
          latitude,
          longitude,
        );
        print("Kilometers");
        print(_distanceInMeters);
        print((_distanceInMeters * 0.001).round());
        if(_distanceInMeters<60){
          inoufield();
          setState(() {


          });
        }
        else{
          outoufield();
        }
      }
    }

    /// For Continuous scan
    startBarcodeScanStream() async {
      FlutterBarcodeScanner.getBarcodeStreamReceiver(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE)!.listen((barcode) => print(barcode));
    }
  }

  outoufield(){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return showDialog(context: context, builder:(context) {
      return Padding(
        padding: const EdgeInsets.only(top: 180.0,bottom: 180),
        child: AlertDialog(
          content: Column(
            children: [
              SizedBox(height: height/50.4,),

              Text("Out Of range",style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),),

              SizedBox(height: height/75.6,),

              Text("Please Make Sure Valid Location Point",style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,fontSize: width/36.0),),

              SizedBox(height: height/50.4,),

              SizedBox(
                height: height/7.56,
                width: width/3.60,
                child: Center(child: Lottie.asset("assets/animation_lk2m7oge.json")),
              ),

              SizedBox(height: height/32.85,),

              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Material(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  elevation: 50,
                  animationDuration: Duration(seconds: 2),
                  child: Container(
                    height:height/16.425,
                    width:width/3,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Text("okay",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
              ),

              SizedBox(height: height/50.4,),

            ],
          ),
        ),
      );
    },);
  }

  inoufield(){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return showDialog(context: context, builder:(context) {
      return Padding(
        padding:  EdgeInsets.only(top: height/4.2,bottom: height/4.2),
        child: AlertDialog(

          content: Column(
            children: [
              SizedBox(height: height/46.92,),
              Text("Attendance marked SuccessFully",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),),
              SizedBox(height: height/32.85,),
              //Text("Satff Name:${widget.name}" ,style: GoogleFonts.montserrat()),
              //Text("Satff Regno:${widget.regno}" ,style: GoogleFonts.montserrat()),

              SizedBox(
                height: height/6.56,
              width: width/0.41,
                child: Center(
                  child: Lottie.asset("assets/animation_lk3vmbvu.json",fit: BoxFit.cover),
                ),
              ),

              SizedBox(height: height/32.85,),
              GestureDetector(
                onTap: (){

                  Marktheattendancefun();

                },
                child: Material(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  elevation: 50,
                  animationDuration: Duration(seconds: 2),
                  shadowColor: Colors.black12,
                  child: Container(
                    height:height/16.425,
                    width:width/3,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Text("okay",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
              ),

            ],
          ),

        ),
      );
    },);
  }

  Marktheattendancefun(){
    FirebaseFirestore.instance.collection("Staffs").
    doc(staffid).
    update(
        {
          "absent":false,
        });

    FirebaseFirestore.instance.collection("Staffs").doc(staffid).
    collection("Attendance").doc("${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}").
    set(
        {
          "Staffattendance":true,
          "Class":section,
          "Date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "Time":DateFormat("h:mma").format(DateTime.now()),
          "timstamp":DateTime.now().millisecondsSinceEpoch,
        });

    FirebaseFirestore.instance.collection("Staff_attendance").
    doc("${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}").
    collection("Staffs").doc(staffid).
    set(
        {
          "Staffattendance":true,
          "Staffname":staffname,
          "Staffregno":staffregno,
          "Staffid":staffid,
          "Class":section,
          "Date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "Time":DateFormat("h:mma").format(DateTime.now()),
          "timstamp":DateTime.now().millisecondsSinceEpoch,
        });

    Navigator.pop(context);
  }

  String staffid="";
  String staffname="";
  String staffregno="";
  String staffimg="";


  getstaffdetails() async {



    var document = await FirebaseFirestore.instance.collection("Staffs").get();
    for(int i=0;i<document.docs.length;i++){
      if(document.docs[i]["userid"]==FirebaseAuth.instance.currentUser!.uid){
        setState(() {
          staffid=document.docs[i].id;
        });
        print("Saffid:${staffid}");
        print(staffid);
      }
      if(staffid.isNotEmpty){
        var staffdocument= await FirebaseFirestore.instance.collection("Staffs").doc(staffid).get();
        Map<String,dynamic>?staffvalue=staffdocument.data();
        setState(() {
          staffname=staffvalue!['stname'];
          staffregno=staffvalue['regno'];
          staffimg=staffvalue['imgUrl'];
        });
      }
    };



    print("staffname stff id staff img");
    print(staffname);
    print(staffregno);
    print(staffimg);
  }


  @override
  void initState() {
    setState(() {
      attendance=false;
    });
    getstaffdetails();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body:Column(

        children: [
          GestureDetector(
            onTap:(){
              barcodeScan();

            },
            child: SizedBox(
              child: Stack(
                children: [
                  Container(
                      height: height/2.2909,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/Rectangle.png")
                          )
                      ),
                      child: Column(

                        children: [
                          SizedBox(height: 50,),

                          Text("Verify Your Face ID",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),),

                          SizedBox(height: 50,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.white,
                                      width: 2
                                    ),
                                      top: BorderSide(
                                          color: Colors.white,
                                          width: 2
                                      )
                                  )
                                ),
                              ),
                              SizedBox(width: 80,),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Colors.white,
                                            width: 2
                                        ),
                                        top: BorderSide(
                                            color: Colors.white,
                                            width: 2
                                        )
                                    )
                                ),
                              )
                            ],
                          ),

                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            color: Colors.white,
                                            width: 2
                                        ),
                                        bottom: BorderSide(
                                            color: Colors.white,
                                            width: 2
                                        )
                                    )
                                ),
                              ),
                              SizedBox(width: 80,),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Colors.white,
                                            width: 2
                                        ),
                                        bottom: BorderSide(
                                            color: Colors.white,
                                            width: 2
                                        )
                                    )
                                ),
                              )
                            ],
                          )



                        ],
                      )),
                  Padding(
                    padding:  EdgeInsets.only(top: 120.0,left: 125),
                    child: Image.asset("assets/face-head-man-icon-22077-removebg-preview (1).png",height: 110,width: 110,color: Colors.white,),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 80,),

          GestureDetector(
            onTap: (){
            },
            child: Container(
              height: 50,
            width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color(0xff3D8CF8),
              ),
              child: Center(child: Text("Verify",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold),)),
            ),
          ),
          SizedBox(height: 260,),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("assets/icons8-face-id-50.png",height: 25,width: 25,),
              SizedBox(width: 2,),
              Text("Hint: Please Make a Sure In Your Face ID",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
            ],
          )

        ],
      )
    );
  }

}

