// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class WeddingScreen extends StatefulWidget {
  const WeddingScreen({Key? key}) : super(key: key);

  @override
  State<WeddingScreen> createState() => _WeddingScreenState();
}

enum Options { Option1, Option2, Option3 }

class _WeddingScreenState extends State<WeddingScreen> {
  Options? _reply;
  navigationFunction() {
    String option = "";
    if (_reply == Options.Option1) {
      option = "Lavish";
    } else if (_reply == Options.Option2) {
      option = "Moderate";
    } else if (_reply == Options.Option3) {
      option = "Not sure";
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
    DataBase().setWedding(option);
    DataBase().setAllAnswerTrue();
    DataBase().setShowPage(29);

    Navigator.pushNamed(context, '/first_home/');
  }

  fetchWedding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("wedding")) {
      if(prefs.getString("wedding") == "Lavish") {
        _reply = Options.Option1;
      } else if(prefs.getString("wedding") == "Moderate") {
        _reply = Options.Option2;
      }  else if(prefs.getString("wedding") == "Not sure") {
        _reply = Options.Option3;
      } 
    }
    setState(() {
      
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchWedding();
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
                    percent: 3 / 3,
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
                  "When you get married, what kind of wedding should it be?",
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
                      Text(
                        'Lavish',
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
              SizedBox(
                height: 5,
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
                      Text(
                        'Moderate',
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
              SizedBox(
                height: 5,
              ),
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
                      Text(
                        'Not sure',
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
              Spacer(),
              Button(text: "Finish", navigationFunction: navigationFunction),
            ],
          ),
        ),
      ),
    );
  }
}
