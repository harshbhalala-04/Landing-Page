// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pre-registration form",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 32,
                fontFamily: "oxygen",
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              deviceSize.width < 800
                  ? "Become a beta-tester and get early access.\nWe promise not to spam you."
                  : "Become a beta-tester and get early access. We promise not to spam \n you.",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "oxygen",
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Name",
              style: TextStyle(
                  fontFamily: "oxygen",
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: deviceSize.width < 800 ? 327 : 500,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Your answer",
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2),
                  ),
                  hintStyle: TextStyle(
                    fontFamily: "oxygen",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(149, 149, 149, 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Phone number",
              style: TextStyle(
                  fontFamily: "oxygen",
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: deviceSize.width < 800 ? 327 : 500,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Your answer",
                  fillColor: Color.fromRGBO(163, 163, 163, 1),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2),
                  ),
                  hintStyle: TextStyle(
                    fontFamily: "oxygen",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(149, 149, 149, 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your email",
              style: TextStyle(
                  fontFamily: "oxygen",
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: deviceSize.width < 800 ? 327 : 500,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Your answer",
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2),
                  ),
                  hintStyle: TextStyle(
                    fontFamily: "oxygen",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(149, 149, 149, 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: deviceSize.width < 800 ? 327 : 500,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(95, 95, 95, 1),
                    Color.fromRGBO(51, 51, 51, 1)
                  ])),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/movie/');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Color.fromRGBO(51, 51, 51, 0.15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "oxygen",
                      letterSpacing: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
