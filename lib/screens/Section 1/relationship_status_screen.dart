// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class RelationshipStatusScreen extends StatefulWidget {
  const RelationshipStatusScreen({ Key? key }) : super(key: key);

  @override
  State<RelationshipStatusScreen> createState() => _RelationshipStatusScreenState();
}

enum RelationshipStatus {Single, WidowWidower, Divorced, Separated}

class _RelationshipStatusScreenState extends State<RelationshipStatusScreen> {
  RelationshipStatus? _reply;
  navigationFunction() {
    String relationshipStatus = "";
    if(_reply == RelationshipStatus.Single) {
      relationshipStatus = "Single";
    }  else if(_reply == RelationshipStatus.WidowWidower) {
      relationshipStatus = "Widow / Widower";
    } else if(_reply == RelationshipStatus.Divorced) {
      relationshipStatus = "Divorced";
    } else if(_reply == RelationshipStatus.Separated) {
      relationshipStatus = "Separated";
    }else {
      showDialog(context: context, builder: (ctx) {
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
    DataBase().setShowPage(6);
    // DataBase().setRelationshipStatus(relationshipStatus);
    Navigator.pushNamed(context, '/birth_date/');
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
                    percent: 5/11,
                    center: Text("5/11"),
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
                            percent: 5/11,
                            center: Text("5/11"),
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
                      "Relationship status",
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
                      _reply = RelationshipStatus.Single;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: RelationshipStatus.Single,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (RelationshipStatus? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Single', style: TextStyle(
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
                      _reply = RelationshipStatus.WidowWidower;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: RelationshipStatus.WidowWidower,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (RelationshipStatus? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Widow / Widower', style: TextStyle(
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
                      _reply = RelationshipStatus.Divorced;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: RelationshipStatus.Divorced,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (RelationshipStatus? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Divorced', style: TextStyle(
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
                      _reply = RelationshipStatus.Separated;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: RelationshipStatus.Separated,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (RelationshipStatus? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Separated', style: TextStyle(
                          fontSize: 18,
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                        ),),
                    ],
                  ),
                ),
              ),
              deviceSize.width > 800 ? Spacer() : Container(),
              deviceSize.width > 800
                  ? Button(
                      text: "Continue", navigationFunction: navigationFunction)
                  : Container(),
              // Spacer(),
              // Button(text: "Continue", navigationFunction: navigationFunction),
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