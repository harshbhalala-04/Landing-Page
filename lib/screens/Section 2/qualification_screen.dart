// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class QualificationScreen extends StatefulWidget {
  const QualificationScreen({Key? key}) : super(key: key);

  @override
  State<QualificationScreen> createState() => _QualificationScreenState();
}

enum Qualification { Bachelors, Masters, PHD, PostDoc, Other }

class _QualificationScreenState extends State<QualificationScreen> {
  Qualification? _reply;
  navigationFunction() {
    String qualification = "";
    if(_reply == Qualification.Bachelors) {
      qualification = "Bachelors";
    }  else if(_reply == Qualification.Masters) {
      qualification = "Masters";
    } else if(_reply == Qualification.PHD) {
      qualification = "PHD";
    } else if(_reply == Qualification.PostDoc) {
      qualification = "Post Doc";
    }  else if(_reply == Qualification.Other) {
      qualification = "Other";
    }  else {
      return showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          content: Text("This field is required"),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color.fromRGBO(182, 102, 210, 1)),
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text("Okay"),
            ),
          ],
        );
      });
    }
    DataBase().setShowPage(15);
    DataBase().setQualification(qualification);
    Navigator.pushNamed(context, '/industry/');
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
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, right: 15),
                  child: CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 2.0,
                    percent: 0.4,
                    center: Text("2/5"),
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
                            percent: 0.4,
                            center: Text("2/5"),
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
                      "Highest qualification",
                      style: TextStyle(
                        fontFamily: "oxygen",
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _reply = Qualification.Bachelors;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Qualification.Bachelors,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Qualification? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Bachelors',style: TextStyle(
                          fontSize: 18,
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                        ),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _reply = Qualification.Masters;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Qualification.Masters,
                        groupValue: _reply,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        onChanged: (Qualification? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Masters',style: TextStyle(
                          fontSize: 18,
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                        ),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _reply = Qualification.PHD;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Qualification.PHD,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Qualification? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('PHD',style: TextStyle(
                          fontSize: 18,
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                        ),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _reply = Qualification.PostDoc;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Qualification.PostDoc,
                        groupValue: _reply,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        onChanged: (Qualification? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Post Doc',style: TextStyle(
                          fontSize: 18,
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                        ),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _reply = Qualification.Other;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Qualification.Other,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Qualification? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Other',style: TextStyle(
                          fontSize: 18,
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                        ),),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Button(text: "Continue", navigationFunction: navigationFunction),
            ],
          ),
        ),
      ),
    );
  }
}
