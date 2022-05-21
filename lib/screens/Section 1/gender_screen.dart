// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmlandingpage/services/database.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/button.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

enum Gender { Male, Female, Other }

enum Interested { Male, Female }

class _GenderScreenState extends State<GenderScreen> {
  Gender? _reply;
  Interested? _replyInterested;
  navigationFunction() {
    String gender = "";
    String interested = "";
    print(_replyInterested == Interested.Male);
    print(_reply == Gender.Female);
    if (_replyInterested == Interested.Male) {
      interested = "Male";
      print("This case here is true");
    }
    else if (_replyInterested == Interested.Female) {
      interested = "Female";
      
    } else {
      print("Enter in required scope");
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("This field is required"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(182, 102, 210, 1)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Okay"),
                ),
              ],
            );
          });
    }
    if (_reply == Gender.Male) {
      gender = "Male";
    } else if (_reply == Gender.Female) {
      print("here gender is female");
      gender = "Female";
    } else if (_reply == Gender.Other) {
      gender = "Other";
    } else {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("This field is required"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(182, 102, 210, 1)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Okay"),
                ),
              ],
            );
          });
    }
    DataBase().setShowPage(4);
    DataBase().setGenderAndInterested(gender, interested);
    Navigator.pushNamed(context, '/photos/');
  }

  fetchGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("gender")) {
      if(prefs.getString("gender") == "Male") {
        _reply = Gender.Male;
      }else if(prefs.getString("gender") == "Male") {
        _reply = Gender.Female;
      } else {
        _reply = Gender.Other;
      }
    }
    if(prefs.containsKey("interestedGender")) {
      print(prefs.getString("interestedGender"));
       if(prefs.getString("interestedGender") == "Male") {
        _replyInterested = Interested.Male;
      }else if(prefs.getString("interestedGender") == "Female") {
        _replyInterested = Interested.Female;
      } 
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchGender();
    super.initState();
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
                    percent: 2 / 11,
                    center: Text("2/11"),
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
                            percent: 2 / 11,
                            center: Text("2/11"),
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
                      "Select your gender",
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
                      _reply = Gender.Male;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Gender.Male,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Gender? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                      _reply = Gender.Female;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Gender.Female,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Gender? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Female', style: TextStyle(
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
                      _reply = Gender.Other;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Gender.Other,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Gender? value) {
                          setState(() {
                            _reply = value!;
                           
                          });
                        },
                      ),
                      Text('Others', style: TextStyle(
                          fontSize: 18,
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                        ),),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      "Interested in?",
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
                      _replyInterested = Interested.Male;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Interested.Male,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _replyInterested,
                        onChanged: (Interested? value) {
                          setState(() {
                            _replyInterested = value!;
                          });
                        },
                      ),
                      Text('Male', style: TextStyle(
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
                      _replyInterested = Interested.Female;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Interested.Female,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _replyInterested,
                        onChanged: (Interested? value) {
                          setState(() {
                            _replyInterested = value!;
                          });
                        },
                      ),
                      Text('Female',  style: TextStyle(
                          fontSize: 18,
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                        ),),
                    ],
                  ),
                ),
              ),
              // Spacer(),
              // Button(text: "Continue", navigationFunction: navigationFunction),
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
