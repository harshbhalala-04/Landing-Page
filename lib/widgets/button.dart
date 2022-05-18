// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function navigationFunction;

  Button({required this.text, required this.navigationFunction});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: deviceSize.width < 800
            ? deviceSize.width - 50
            : deviceSize.width / 4,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            navigationFunction();
          },
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(182, 102, 210, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: "oxygen",
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
