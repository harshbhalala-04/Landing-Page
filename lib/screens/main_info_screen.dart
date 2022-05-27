// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmlandingpage/services/database.dart';

class MainInfoScreen extends StatefulWidget {
  const MainInfoScreen({Key? key}) : super(key: key);

  @override
  State<MainInfoScreen> createState() => _MainInfoScreenState();
}

class _MainInfoScreenState extends State<MainInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1),
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
        body: Center(
          child: Container(
            color: Colors.white,
            height: deviceSize.height,
            width: deviceSize.width < 800
                ? deviceSize.width
                : deviceSize.width / 4,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 70,),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Row(
                            children: [
                              Text(
                                "Get Started",
                                style: TextStyle(
                                  fontFamily: "oxygen",
                                  fontSize: 16,
                                  color: Color.fromRGBO(182, 102, 210, 1),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "To help you meet the right \nperson, we need to ask you \na few questions.",
                                  style: TextStyle(
                                    fontFamily: "oxygen",
                                    fontSize: 22,
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Row(
                            children: [
                              Text(
                                "Sections",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: "oxygen",
                                  fontSize: 16,
                                  color: Color.fromRGBO(51, 51, 51, 1),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                          child: ListTile(
                            leading: Image.asset("assets/images/info1.png"),
                            horizontalTitleGap: 0,
                            title: Text(
                              "About You",
                              style: TextStyle(
                                fontFamily: "oxygen",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color.fromRGBO(51, 51, 51, 1),
                              ),
                            ),
                            subtitle: Text(
                              "11 Questions",
                              style: TextStyle(
                                fontFamily: "oxygen",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color.fromRGBO(51, 51, 51, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                          child: ListTile(
                            leading: Image.asset("assets/images/info2.png"),
                            horizontalTitleGap: 0,
                            title: Text(
                              "Professional Background",
                              style: TextStyle(
                                fontFamily: "oxygen",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color.fromRGBO(51, 51, 51, 1),
                              ),
                            ),
                            subtitle: Text(
                              "5 Questions",
                              style: TextStyle(
                                fontFamily: "oxygen",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color.fromRGBO(51, 51, 51, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                          child: ListTile(
                            leading: Image.asset("assets/images/info3.png"),
                            horizontalTitleGap: 0,
                            title: Text(
                              "Financial Inclinations",
                              style: TextStyle(
                                fontFamily: "oxygen",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color.fromRGBO(51, 51, 51, 1),
                              ),
                            ),
                            subtitle: Text(
                              "4 Questions",
                              style: TextStyle(
                                fontFamily: "oxygen",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color.fromRGBO(51, 51, 51, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                          child: ListTile(
                            horizontalTitleGap: 0,
                            leading: Image.asset("assets/images/info4.png"),
                            title: Text(
                              "Major Life Decisions",
                              style: TextStyle(
                                fontFamily: "oxygen",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color.fromRGBO(51, 51, 51, 1),
                              ),
                            ),
                            subtitle: Text(
                              "3 Questions",
                              style: TextStyle(
                                fontFamily: "oxygen",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color.fromRGBO(51, 51, 51, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/images/info.svg"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "This may take about 5-7 minutes.",
                                style: TextStyle(
                                  fontFamily: "oxygen",
                                  fontSize: 12,
                                  color: Color.fromRGBO(51, 51, 51, 1),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                          ],
                        ),
                  ),
                ),
                // Spacer(),
                        // Row(
                        //   mainAxisAlignment: deviceSize.width < 800
                        //       ? MainAxisAlignment.start
                        //       : MainAxisAlignment.center,
                        //   children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                width: deviceSize.width < 800
                                    ? deviceSize.width - 50
                                    : deviceSize.width / 4,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    DataBase().setShowPage(1);
                                    
                                    Navigator.pushNamed(context, '/about_you_intro/');
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
                                      "Get Started",
                                      style: TextStyle(
                                        fontFamily: "oxygen",
                                        fontSize: 18,
                                       
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
              ],
            ),
            //   ],
            // ),
          ),
        ));
  }
}
