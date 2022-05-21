// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class FirstHomeScreen extends StatefulWidget {
  const FirstHomeScreen({ Key? key }) : super(key: key);

  @override
  State<FirstHomeScreen> createState() => _FirstHomeScreenState();
}

enum Options {Option1, Option2, Option3, Option4}

class _FirstHomeScreenState extends State<FirstHomeScreen> {
 Options? _reply;
  navigationFunction() {
    String option = "";
    if(_reply == Options.Option1) {
      option = "I wish to do this";
    }  else if(_reply == Options.Option2) {
      option = "I have already done this";
    }else if(_reply == Options.Option3) {
      option = "Renting makes financial sense to me";
    }else if(_reply == Options.Option4) {
      option = "I haven’t thought about it";
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
    // DataBase().setShowPage(4);
    // DataBase().setGender(gender);
    
    DataBase().setShowPage(28);
    DataBase().setFirstHome(option);
    Navigator.pushNamed(context, '/plan_for_children/');
  }

  fetchFirstHome() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("firstHome")) {
      if(prefs.getString("firstHome") == "I wish to do this") {
        _reply = Options.Option1;
      } else if(prefs.getString("firstHome") == "I have already done this") {
        _reply = Options.Option2;
      }  else if(prefs.getString("firstHome") == "Renting makes financial sense to me") {
        _reply = Options.Option3;
      } else if(prefs.getString("firstHome") == "I haven’t thought about it") {
        _reply = Options.Option4;
      } 
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchFirstHome();
    super.initState();
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
                  child:  CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 2.0,
                    percent: 2/3,
                    center: Text("2/3"),
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
                            percent: 2/3,
                            center: Text("2/3"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Thoughts on purchasing your first home?",
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _reply = Options.Option1;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Options.Option1,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Options? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('I wish to do this',style: TextStyle(
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
                      _reply = Options.Option2;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Options.Option2,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Options? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('I have already done this',style: TextStyle(
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
                      _reply = Options.Option3;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Options.Option3,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Options? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Renting makes financial sense to me', style: TextStyle(
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
                      _reply = Options.Option4;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Options.Option4,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Options? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('I haven’t thought about it', style: TextStyle(
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