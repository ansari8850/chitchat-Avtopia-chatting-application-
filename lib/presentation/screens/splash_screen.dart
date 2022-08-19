// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:async';

//import 'package:chitchat/presentation/screens/home_screen.dart';
//import 'package:chitchat/presentation/screens/registration_screen.dart';
import 'package:chitchat/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: override_on_non_overriding_member
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: prefer_const_constructors
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          // ignore: prefer_const_constructors
          builder: (_) => WelcomeScreen(),
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "ChitChat Room",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
