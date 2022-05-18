// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({Key? key}) : super(key: key);

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  

  TextEditingController feetController = new TextEditingController();
  TextEditingController inchesController = new TextEditingController();

  navigationFunction() {
    
    if(feetController.text == "" || inchesController.text == "") {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("Please Select Your Height"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color.fromRGBO(182, 102, 210, 1)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              ],
            );
          });
    }
    if(int.tryParse(inchesController.text) == null) {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("Please Enter valid Parameters"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color.fromRGBO(182, 102, 210, 1)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              ],
            );
          });
    }
    if(int.tryParse(feetController.text) == null) {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("Please Enter valid Parameters"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color.fromRGBO(182, 102, 210, 1)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              ],
            );
          });
    }
    if(int.tryParse(feetController.text)! >= 10) {
       return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("Please Enter valid height"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color.fromRGBO(182, 102, 210, 1)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              ],
            );
          });
    }
     if(int.tryParse(inchesController.text)! >= 12) {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("Please Enter valid height"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color.fromRGBO(182, 102, 210, 1)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              ],
            );
          });
    }
    DataBase().setShowPage(9);
    DataBase().setHeight(feetController.text + "'" + inchesController.text + "\"");
    Navigator.pushNamed(context, '/mother_toungue/');
  }
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: deviceSize.width < 800
          ? Colors.white
          : Color.fromRGBO(229, 229, 229, 1),
      appBar: deviceSize.width < 800
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading:  Container(
                 margin: EdgeInsets.only(top: 15),
                child: IconButton(
                              icon: Icon(Icons.arrow_back_ios_new),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.grey,
                            ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, right: 15),
                  child: CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 2.0,
                    percent: 8/11,
                    center: Text("8/11"),
                    progressColor: Color.fromRGBO(182, 102, 210, 1),
                  ),
                ),
              ],
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
          width:
              deviceSize.width < 800 ? deviceSize.width : deviceSize.width / 4,
          child: Column(
            children: [
               deviceSize.width < 800
                  ? Container()
                  : Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 8, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios_new),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.grey,
                          ),
                          CircularPercentIndicator(
                            radius: 20.0,
                            lineWidth: 2.0,
                            percent: 8/11,
                            center: Text("8/11"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      "Enter your height",
                      style: TextStyle(
                        fontFamily: "oxygen",
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 50,
                              child: TextField(
                                controller: feetController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "#",
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Feet",
                              style: TextStyle(
                                  fontFamily: "oxygen",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8),
                            ),
                          ],
                        ),
                        Positioned(
                          top: -10,
                          right: -10,
                          child: Text(
                            "‘",
                            style: TextStyle(
                                color: Color.fromRGBO(51, 51, 51, 1),
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 50,
                              child: TextField(
                                controller: inchesController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "#",
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Inches",
                              style: TextStyle(
                                  fontFamily: "oxygen",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8),
                            ),
                          ],
                        ),
                        Positioned(
                          top: -10,
                          right: -10,
                          child: Text(
                            "“",
                            style: TextStyle(
                                color: Color.fromRGBO(51, 51, 51, 1),
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              deviceSize.width > 800 ? Spacer() : Container(),
              deviceSize.width > 800
                  ? Button(
                      text: "Continue", navigationFunction: navigationFunction)
                  : Container(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: deviceSize.width < 800
          ? Button(text: "Continue", navigationFunction: navigationFunction)
          : SizedBox(),
    );
  }
}
