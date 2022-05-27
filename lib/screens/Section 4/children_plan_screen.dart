// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class ChildrenPlanScreen extends StatefulWidget {
  const ChildrenPlanScreen({Key? key}) : super(key: key);

  @override
  State<ChildrenPlanScreen> createState() => _ChildrenPlanScreenState();
}

enum Options { Option1, Option2, Option3, Option4, Option5 }

class _ChildrenPlanScreenState extends State<ChildrenPlanScreen> {
  Options? _reply;
  navigationFunction() {
    String option = "";
    if (_reply == Options.Option1) {
      option = "Don’t want";
    } else if (_reply == Options.Option2) {
      option = "Want someday";
    } else if (_reply == Options.Option3) {
      option = "Have and want more";
    } else if (_reply == Options.Option4) {
      option = "Have and don’t want more";
    } else if (_reply == Options.Option5) {
      option = "Not sure yet";
    } else {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("This field is required"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color.fromRGBO(182, 102, 210, 1)),
                  onPressed: () {

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

    DataBase().setShowPage(27);
    DataBase().setChildrenPlan(option);
    Navigator.pushNamed(context, '/refer/');
  }

  fetchChildrenPlan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("childrenPlan")) {
      if(prefs.getString("childrenPlan") == "Don’t want") {
        _reply = Options.Option1;
      } else if(prefs.getString("childrenPlan") == "Want someday") {
        _reply = Options.Option2;
      }  else if(prefs.getString("childrenPlan") == "Have and want more") {
        _reply = Options.Option3;
      } else if(prefs.getString("childrenPlan") == "Have and don’t want more") {
        _reply = Options.Option4;
      } else if(prefs.getString("childrenPlan") == "Not sure yet") {
        _reply = Options.Option5;
      } 
    }

    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchChildrenPlan();
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
                    percent: 1,
                    center: Text("3/3"),
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
                            percent: 1,
                            center: Text("3/3"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "What are your ideal plans for children?",
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
                      Text('Don’t want', style: TextStyle(
                          fontSize: 18,
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                        ),),
                    ],
                  ),
                ),
              ),
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
                      Text('Want someday', style: TextStyle(
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
                      Text('Have and want more', style: TextStyle(
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
                      Text('Have and don’t want more', style: TextStyle(
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
                      _reply = Options.Option5;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Options.Option5,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Options? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Not sure yet',style: TextStyle(
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
