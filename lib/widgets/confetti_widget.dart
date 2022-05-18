// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class MyConfettiWidget extends StatefulWidget {
  final Widget child;

  MyConfettiWidget({required this.child});

  @override
  State<MyConfettiWidget> createState() => _MyConfettiWidgetState();
}

class _MyConfettiWidgetState extends State<MyConfettiWidget> {
  ConfettiController? controller ;
  @override
  void initState() {
    // TODO: implement initState
    controller = ConfettiController(duration: Duration(seconds: 2));
    controller!.play();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            numberOfParticles: 20,
            minimumSize: Size(10, 10),
            confettiController: controller!,
            blastDirection: pi/2,
            colors: [
              Color.fromRGBO(182, 102, 210, 1),
              Colors.red,
              Colors.blue,
              Colors.orange,
              Colors.lightBlue
            ],
          ),
        ),
         Align(
          alignment: Alignment.centerLeft,
          child: ConfettiWidget(
            numberOfParticles: 20,
            minimumSize: Size(10, 10),
            confettiController: controller!,
            blastDirection: -pi/4,
            colors: [
              Color.fromRGBO(182, 102, 210, 1),
              Colors.red,
              Colors.blue,
              Colors.orange,
              Colors.lightBlue
            ],
          ),
        ),
         Align(
          alignment: Alignment.centerRight,
          child: ConfettiWidget(
            numberOfParticles: 20,
            minimumSize: Size(10, 10),
            confettiController: controller!,
            blastDirection: pi,
            colors: [
              Color.fromRGBO(182, 102, 210, 1),
              Colors.red,
              Colors.blue,
              Colors.orange,
              Colors.lightBlue
            ],
          ),
        ),
        widget.child,
      ]
    );
  }
}