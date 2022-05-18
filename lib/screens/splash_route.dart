// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  bool allAnswerGiven = false;
  int showPageIndex = 0;

  checkUserRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneNo = prefs.getString("phoneNo");
    String? uid = prefs.getString("uid");

    print("Inside check user function");
    print(phoneNo);

    if (uid != null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .get()
          .then((val) {
        allAnswerGiven = val.data()!['allAnswer'];
        showPageIndex = val.data()!['showPage'];
        
        if (allAnswerGiven) {
          return Timer(Duration(seconds: 2),
              () => Navigator.pushNamed(context, '/feed/'));
        } else {
          return Timer(Duration(seconds: 2),
              () => Navigator.pushNamed(context, routeList[showPageIndex]));
        }
      });
    } else {
      return Timer(
          Duration(seconds: 2), () => Navigator.pushNamed(context, '/onboarding/'));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkUserRoute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(182, 102, 210, 1),
        ),
      ),
    );
  }
}
