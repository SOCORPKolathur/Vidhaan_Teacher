import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:InvestinShare/Homeland.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';



class profile extends StatefulWidget {



  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();
  TextEditingController field3 = TextEditingController();
  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }
  String name="";
  String phone="";
  String email="";

  @override
  getdata() async {
    var document = await FirebaseFirestore.instance.collection('User').doc(auth.currentUser!.uid).get();
    Map<String, dynamic>? value = document.data();

    setState(() {
      field1.text = value!['name'].toString();
      field2.text = value['number'].toString();
      field3.text = value['email'].toString();
      name = value['name'].toString();
      phone = value['number'].toString();

    });
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    Future <void> show()  async  {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profile Updated'),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Container(
                    width: 100,
                    height: 100,
                    child: Lottie.asset('lib/assets/done.json')),

              ],
            ),
          ),
          actions: <Widget>[

            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.blue),),
              onPressed: () {
                Navigator.pop(context);

              },
            ),
          ],
        );
      },
    );
  }

   uploadFile() async {
    await _firestore
        .collection('User').doc(auth.currentUser!.uid)
        .update({
      'name':field1.text,
      'phone':field2.text,
      'email':field3.text,

    });
  }

  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3D8CF8),
        title:  Row(

          children: [
            Padding(
              padding: EdgeInsets.only(left: width/49),
              child:
              Container(
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child:const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top:height/151.8,left:width/39.2,bottom:height/151.8),
              child: Container(

                height:height/25,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text("Edit Profile",
                    style: GoogleFonts.poppins(color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),),
                ),
              ),
            ),


          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top:height/151.8,left:width/39.2,bottom:height/151.8),
            child: TextButton(
              onPressed: (){
                uploadFile();
                show();
              },
              child: Container(
                height: height/33,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text("Done",
                    style: GoogleFonts.poppins(color:Colors.white,
                      fontWeight: FontWeight.w600,
                    ),),
                ),
              ),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
                width: width/1.96,
                height:height/4.21,
                child: Lottie.asset('assets/profile.json')),

            Container(
              height:height/23,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(name,style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff484545)
                ),),
              ),
            ),
            //
            Container(
              height:height/32,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text('+91 ${phone}',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff484545),
                    fontSize: 15,),),
              ),
            ),
            //
            Container(
              width:width/0.98,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffF9F9F9),
                      Color(0xffffffff),
                    ],)),


            ),

            Column(
              children: [
                Padding(
                  padding:EdgeInsets.symmetric(horizontal:width/14,vertical:height/94.87),
                  child:
                  TextField(
                    controller: field1,
                    cursorColor: const Color(0xff4169E1),

                    decoration: InputDecoration(

                        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.person)),
                        hintText: '',
                        labelText: "Name"


                    ),
                  ),
                ),


                Padding(
                  padding:EdgeInsets.symmetric(horizontal:width/14,vertical:height/94.87),
                  child: TextField(
                    controller: field2,
                    cursorColor: const Color(0xff4169E1),

                    decoration: InputDecoration(

                        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.mail)),
                        hintText: '',
                        labelText: "Phone"


                    ),
                  ),
                ),


                Padding(
                  padding:EdgeInsets.symmetric(horizontal:width/14,vertical:height/94.87),
                  child: TextField(
                    controller: field3,
                    cursorColor: const Color(0xff4169E1),

                    decoration: InputDecoration(

                        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.phone)),
                        hintText: '',
                        labelText: "E Mail "


                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding:EdgeInsets.only(top:height/5),
              child:  Container(
                  height:height/33,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text('Vidhaan Teachers',style: TextStyle(
                          color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),))),
            )
          ],
        ),
      ),
    );



  }



}