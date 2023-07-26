import 'package:animate_do/animate_do.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'StudentAttendance_Page.dart';
import 'account_page.dart';
import 'demo.dart';



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
      home: MyHomePage(),
      /*EasySplashScreen(

        logo: Image.asset("assets/1024.png"),
        durationInSeconds: 4,
        logoWidth: 100,
        title: Text(
          "Vidhaan", style: GoogleFonts.montserrat(color: Colors.white)
        ),
        backgroundColor: Color(0xffFEFCFF),
        showLoader: true,
        loaderColor: Color(0xff0A74CC),
        loadingText: Text("Loading...",style: GoogleFonts.montserrat(color: Colors.white),),
        navigator:FirebaseAuth.instance.currentUser!=null? Accountpage() :Homepage(),
      ),*/

      /*  SplashScreen(
          seconds: 14,
          navigateAfterSeconds:  FirebaseAuth.instance.currentUser!=null? Slidepage() :Homepage(),
          title: Text("Vidhaan"),
          image: Image.asset("assets/1024.png"),
          backgroundColor: Color(0xffFEFCFF),
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 100.0,
          loaderColor: Colors.red
      ),*/
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
    
    Future.delayed(Duration(milliseconds: 4200),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Accountpage() ,));
      
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            FadeOut(
              duration: Duration(
                milliseconds: 12000
              ),
              child: SlideInUp(
                duration: Duration(milliseconds: 1600),
                from: 700,
                child: FadeOut(
                  delay: Duration(milliseconds: 3850),
                  child: Container(
                  height: height/3.78,
                    width:width/1.8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/VIDHAAN LOGO3.png")
                      )
                    ),
          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
