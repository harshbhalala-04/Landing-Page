// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "New Name",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: deviceSize.width < 800 ? 36 : 40,
                  fontFamily: "dancing_script"),
            ),
            SizedBox(
              height: 30,
            ),
            GradientText(
              "Find financially \nsmart soulmate",
              colors: [
                Color.fromRGBO(83, 142, 201, 1),
                Color.fromRGBO(255, 85, 115, 1)
              ],
              style: TextStyle(
                  fontSize: deviceSize.width < 800 ? 32 : 64,
                  fontWeight: FontWeight.w700,
                  fontFamily: "oxygen"),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Meet people not just with compatible personalities but with \n compatible financial sense as well.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: deviceSize.width < 800 ? 18 : 24,
                color: Color.fromRGBO(51, 51, 51, 1),
                fontFamily: "oxygen",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: deviceSize.width < 800 ? 254 : 285,
              height: deviceSize.width < 800 ? 49 : 54,
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
                  Navigator.popAndPushNamed(context, '/registration/');
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
                  "Pre-register now",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: deviceSize.width < 800 ? 20 : 24,
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
