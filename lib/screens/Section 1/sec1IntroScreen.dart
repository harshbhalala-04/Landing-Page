// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmlandingpage/services/database.dart';
import 'package:gmlandingpage/widgets/button.dart';

class Sec1IntroScreen extends StatefulWidget {
  const Sec1IntroScreen({Key? key}) : super(key: key);

  @override
  State<Sec1IntroScreen> createState() => _Sec1IntroScreenState();
}

class _Sec1IntroScreenState extends State<Sec1IntroScreen> {
  navigationFunction() {
    DataBase().setShowPage(2);
    Navigator.pushNamed(context, '/name/');
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1),
        appBar: deviceSize.width < 800
            ? AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.grey,
                  ),
                ),
              )
            : AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 0,
                automaticallyImplyLeading: true,
              ),
        body: Center(
          child: Container(
            color: Colors.white,
            height: deviceSize.height,
            width: deviceSize.width < 800
                ? deviceSize.width
                : deviceSize.width / 4,
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                deviceSize.width < 800
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 8, right: 15),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_new),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.grey,
                        ),
                      ),
                Positioned(
                  top: 80,
                  right: -28,
                  child: SvgPicture.asset(
                    'assets/images/about_you.svg',
                    width: 158,
                    height: 158,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            "SECTION 1",
                            style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 16,
                              color: Color.fromRGBO(182, 102, 210, 1),
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            "About You",
                            style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 20,
                              color: Color.fromRGBO(51, 51, 51, 1),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Row(
                          children: [
                            Flexible(
                              child: AutoSizeText(
                                'Let’s get to know you! A few questions regarding some basic information about you.',
                                minFontSize: 12,
                                maxFontSize: 14,
                                // overflow: TextOverflow.visible,
                                style: TextStyle(
                                    fontFamily: "oxygen",
                                    fontWeight: FontWeight.w500,
                                    height: 1.6,
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                    fontSize: 14),
                                maxLines: 3,
                              ),
                            ),
                          ],
                        )),
                        // Padding(
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        // child: Row(
                        //   children: [
                        //     Flexible(
                        //       child: AutoSizeText(
                        //         'some basic information about you.',
                        //         minFontSize: 12,
                        //         style: TextStyle(
                        //             fontFamily: "oxygen",
                        //             fontWeight: FontWeight.w500,
                        //             height: 1.6,
                        //             color: Color.fromRGBO(51, 51, 51, 1),
                        //             fontSize: 14),
                        //         maxLines: 1,
                        //       ),
                        //     ),
                        //   ],
                        // )),
                        // child: Row(
                        //   children: [
                        //     Flexible(
                        //       child: Text(
                        //         "Let’s get to know you! A few questions regarding \nsome basic information about you.",
                        //         style: TextStyle(
                        //             fontFamily: "oxygen",
                        //             fontWeight: FontWeight.w500,
                        //             height: 1.6,
                        //             color: Color.fromRGBO(51, 51, 51, 1),
                        //             fontSize: 14),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        
                    Spacer(),
                    Button(
                      text: "Start this section",
                      navigationFunction: navigationFunction,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
