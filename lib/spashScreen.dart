// ignore_for_file: camel_case_types
// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_task/login.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Login()));
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.asset(
            "assets/logo.png",
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}