// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, empty_catches, unused_local_variable

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route_list.dart';
import '../services/database.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isShow = false;
  var temp;
  bool isLoading = false;
  bool authSuccess = false;
  bool authFailure = false;
  String _phoneVal = "";
  String _otpVal = "";

  final googleSignIn = GoogleSignIn();

  User? _user;
  int start = 30;
  bool wait = false;
  GoogleAuthProvider authProvider = GoogleAuthProvider();
  String? uid;
  String? name;
  String? userEmail;
  bool isOtpVerify = false;
  bool resend = false;
  googleLogin() async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(authProvider);

      _user = userCredential.user;

    } catch (e) {
      print(e);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_user != null) {
      prefs.setString("uid", _user!.uid);
      uid = _user!.uid;

      name = _user!.displayName;
      userEmail = _user!.email;
      DataBase().createUserByEmail(userEmail!);
      Navigator.pushNamed(context, '/main_info/');
    }

    setState(() {});
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
          resend = true;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  String countryCode = "+91";

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
   
    return Scaffold(
      appBar: deviceSize.width < 800
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
            ),
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: Center(
        child: Container(
          color: Colors.white,
          height: deviceSize.height,
          width:
              deviceSize.width < 800 ? deviceSize.width : deviceSize.width / 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      "OTP Verification",
                      style: TextStyle(
                        fontFamily: "oxygen",
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              isOtpVerify
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Enter the 6 digit OTP sent to ${countryCode} $_phoneVal",
                        style: TextStyle(
                            fontFamily: "oxygen",
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "You will receive a 6 digit One-Time Password (OTP) on this number.",
                        style: TextStyle(
                            fontFamily: "oxygen",
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    isOtpVerify
                        ? Text(
                            "OTP",
                            style: TextStyle(
                                fontFamily: "oxygen",
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            "Phone number",
                            style: TextStyle(
                                fontFamily: "oxygen",
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                    Text(
                      "*",
                      style: TextStyle(
                          color: Color.fromRGBO(182, 102, 210, 1),
                          fontFamily: "oxygen",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              isOtpVerify
                  ? SizedBox(
                      height: 20,
                    )
                  : Container(),
              isOtpVerify
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        onChanged: (val) {
                          _otpVal = val;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter OTP",
                          filled: true,
                          fillColor: Color.fromRGBO(248, 240, 251, 1),
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(width: 2),
                          ),
                          hintStyle: TextStyle(
                            fontFamily: "oxygen",
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(149, 149, 149, 1),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CountryCodePicker(
                            onChanged: (val) {
                              countryCode = val.dialCode!;
                             
                            },
                            showDropDownButton: true,
                            initialSelection: 'IN',
                            favorite: ['+91', 'IN'],
                            showFlagDialog: false,
                            comparator: (a, b) => b.name!.compareTo(a.name!),
                            onInit: (code) => print(
                                "on init ${code!.name} ${code.dialCode} ${code.name}"),
                          ),
                          Flexible(
                            child: TextField(
                              onChanged: (val) {
                                _phoneVal = val;
                              },
                              decoration: InputDecoration(
                                hintText: "Ten digit number",
                                filled: true,
                                fillColor: Color.fromRGBO(248, 240, 251, 1),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  borderSide: BorderSide(width: 2),
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: "oxygen",
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(149, 149, 149, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              isOtpVerify
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          resend
                              ? TextButton(
                                  onPressed: () {
                                    sendOTP(_phoneVal);
                                    setState(() {
                                      start = 30;
                                      wait = false;
                                      resend = false;
                                      startTimer();
                                    });
                                  },
                                  child: Text(
                                    "Resend",
                                    style: TextStyle(
                                        fontFamily: "oxygen",
                                        fontSize: 12,
                                        color:
                                            Color.fromRGBO(182, 102, 210, 1)),
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Resend OTP in: ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "oxygen",
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: "$start",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(182, 102, 210, 1),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "s",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(182, 102, 210, 1)),
                                    ),
                                  ],
                                )),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _phoneVal = "";
                                isOtpVerify = false;
                                start = 30;
                                wait = false;
                              });
                            },
                            child: Text("Change number",
                                style: TextStyle(
                                  fontFamily: "oxygen",
                                  fontSize: 16,
                                  color: Color.fromRGBO(182, 102, 210, 1),
                                )),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Spacer(),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                          color: Color.fromRGBO(182, 102, 210, 1)),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(182, 102, 210, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            
                            setState(() {
                              isLoading = true;
                            });
                            
                            if (isOtpVerify) {
                              
                              await authenticateMe(temp, _otpVal);
                              setState(() {
                                isLoading = false;
                              });
                              return;
                            }
                            temp = await sendOTP(_phoneVal);
                            setState(() {
                              isOtpVerify = true;
                              isLoading = false;
                            });
                            startTimer();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: isOtpVerify
                                ? Text(
                                    "Submit OTP",
                                    style: TextStyle(
                                      fontFamily: "oxygen",
                                      fontSize: 18,
                                    ),
                                  )
                                : Text(
                                    "Request OTP",
                                    style: TextStyle(
                                      fontFamily: "oxygen",
                                      fontSize: 18,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      indent: 30.0,
                      endIndent: 10.0,
                      thickness: 0.3,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontFamily: "oxygen",
                      fontSize: 12,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10.0,
                      endIndent: 30.0,
                      thickness: 0.3,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                    onPressed: () {
                      googleLogin();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/google.svg"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Continue using Google",
                            style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 18,
                              color: Color.fromRGBO(51, 51, 51, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  sendOTP(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;
  
    ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber(
      '$countryCode $phoneNumber',
    );
  
    return confirmationResult;
  }

  authenticateMe(ConfirmationResult confirmationResult, String otp) async {
    setState(() {
      isLoading = true;
    });
    UserCredential userCredential = await confirmationResult.confirm(otp);
    if (userCredential == null) {
      setState(() {
        isLoading = false;
        authFailure = true;
      });
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (userCredential.additionalUserInfo!.isNewUser) {
      // prefs.setString("phoneNo", _phoneVal);
      prefs.setString("uid", userCredential.user!.uid);
      DataBase().createUser(_phoneVal);
      Navigator.pushNamed(context, '/main_info/');
      setState(() {
        isLoading = false;
        authSuccess = true;
      });
    } else {
      // prefs.setString("phoneNo", _phoneVal);
      prefs.setString("uid", userCredential.user!.uid);
      FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .get()
          .then((val) {
        int showPageIndex = val.data()!['showPage'];
        bool allAnswer = val.data()!['allAnswer'];
        if (allAnswer) {
          return Timer(Duration(milliseconds: 1),
              () => Navigator.pushNamed(context, '/feed/'));
        } else {
          return Timer(Duration(milliseconds: 1),
              () => Navigator.pushNamed(context, routeList[showPageIndex]));
        }
      });
      setState(() {
        isLoading = false;
        authSuccess = true;
      });
    }
  }
}