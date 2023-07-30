import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Homepage2.dart';
import 'Student_Landing_Page.dart';
import 'account_page.dart';
import 'homepage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
       options: FirebaseOptions(
           apiKey: "AIzaSyAlSXyLVpxsmAQbvJqSHZTLWqEfDAG7o1M",
           authDomain: "raven-english-school.firebaseapp.com",
           projectId: "raven-english-school",
           storageBucket: "raven-english-school.appspot.com",
           messagingSenderId: "532398284543",
           appId: "1:532398284543:web:853ba40048837d4595f6ca",
           measurementId: "G-J8TF91RDPY"
    )
      );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Intro_Page(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Intro_Page extends StatefulWidget {
  const Intro_Page({Key? key}) : super(key: key);

  @override
  State<Intro_Page> createState() => _Intro_PageState();
}

class _Intro_PageState extends State<Intro_Page> {
  
  @override
  void initState() {
    getdeviceid();
    // TODO: implement initState
    super.initState();
  }

  getdeviceid()async{
   if(FirebaseAuth.instance.currentUser!=null){
     var getdate=await FirebaseFirestore.instance.collection('deviceid').where("id",isEqualTo: FirebaseAuth.instance.currentUser!.uid).where("type",isEqualTo:"Student" ).get();
     var getdate2=await FirebaseFirestore.instance.collection('deviceid').where("id",isEqualTo: FirebaseAuth.instance.currentUser!.uid).where("type",isEqualTo:"Teacher" ).get();
     if(getdate.docs.length>0){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Student_landing_Page(),));
     }
     else if(getdate2.docs.length>0){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage(),));
     }
   }
    else{
      print("Login Page");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Accountpage(),));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Container();

  }
}
