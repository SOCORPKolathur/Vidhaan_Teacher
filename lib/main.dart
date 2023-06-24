import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vidhaan_teacher_dart/Behaviour.dart';
import 'package:vidhaan_teacher_dart/account_page.dart';
import 'package:vidhaan_teacher_dart/circulars.dart';
import 'package:vidhaan_teacher_dart/datepage.dart';
import 'package:vidhaan_teacher_dart/frontpage.dart';
import 'package:vidhaan_teacher_dart/homepage.dart';
import 'package:vidhaan_teacher_dart/homework.dart';
import 'package:vidhaan_teacher_dart/otp_page.dart';
import 'package:vidhaan_teacher_dart/profile_page.dart';
import 'package:vidhaan_teacher_dart/slide_screen.dart';
import 'package:vidhaan_teacher_dart/timetable.dart';

import 'demo.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  FirebaseAuth.instance.currentUser==null? Slidepage() :Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


