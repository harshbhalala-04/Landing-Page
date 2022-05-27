// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gmlandingpage/global.dart';
import 'package:gmlandingpage/global_controller.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class BirthDateScreen extends StatefulWidget {
  const BirthDateScreen({Key? key}) : super(key: key);

  @override
  State<BirthDateScreen> createState() => _BirthDateScreenState();
}

class _BirthDateScreenState extends State<BirthDateScreen> {
  String dd = "";
  String mm = "";
  String yyyy = "";
  bool isValueSubmitted = false;
  String sunSign = "";

  


  navigationFunction() {
    if (dd == "" || mm == "" || yyyy == "") {
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
    DataBase().setShowPage(7);
    DataBase().setDOB(dd, mm, yyyy);
    Navigator.pushNamed(context, '/mother_toungue/');
  }

  void showDatePickerDailog(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime(DateTime.now().year - 21),
            firstDate: DateTime(1940),
            lastDate: DateTime(DateTime.now().year - 21))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          dd = pickedDate.day.toString();
          mm = pickedDate.month.toString();
          yyyy = pickedDate.year.toString();
          int day = pickedDate.day;
          int month = pickedDate.month;

          if ((month == 1 && day <= 20) || (month == 12 && day >= 22)) {
            sunSign = "Capricorn";
          } else if ((month == 1 && day >= 21) || (month == 2 && day <= 18)) {
            sunSign =  "Aquarius";
          } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
            sunSign =  "Pisces";
          } else if ((month == 3 && day >= 21) || (month == 4 && day <= 20)) {
            sunSign =  "Aries";
          } else if ((month == 4 && day >= 21) || (month == 5 && day <= 20)) {
            sunSign =  "Taurus";
          } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
            sunSign =  "Gemini";
          } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
            sunSign =  "Cancer";
          } else if ((month == 7 && day >= 23) || (month == 8 && day <= 23)) {
            sunSign =  "Leo";
          } else if ((month == 8 && day >= 24) || (month == 9 && day <= 23)) {
            sunSign =  "Virgo";
          } else if ((month == 9 && day >= 24) || (month == 10 && day <= 23)) {
            sunSign =  "Libra";
          } else if ((month == 10 && day >= 24) || (month == 11 && day <= 22)) {
            sunSign =  "Scorpio";
          } else if ((month == 11 && day >= 23) || (month == 12 && day <= 21)) {
            sunSign =  "Sagittarius";
          } else {
            sunSign =  "Unknown";
          }
          isValueSubmitted = true;
        });
      }
    });
  }

  fetchBirthDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("date")) {
      dd = prefs.getString("date")!;
    }
    if(prefs.containsKey("month")) {
      mm = prefs.getString("month")!;
    }
    if(prefs.containsKey("date")) {
      yyyy = prefs.getString("year")!;
    }
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState 
    fetchBirthDate();
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
                    percent: 4 / 11,
                    center: Text("4/11"),
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
                            percent: 4 / 11,
                            center: Text("4/11"),
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
                      "Enter your birth date",
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
                    child: Container(
                      width: 50,
                      child: Column(
                        children: [
                          TextField(
                            onTap: () {
                              showDatePickerDailog(context);
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: dd == '' ? "DD" : dd,
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: "oxygen"),
                              border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(width: 2),
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Day",
                            style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(51, 51, 51, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Container(
                      width: 55,
                      child: Column(
                        children: [
                          TextField(
                            onTap: () {
                              showDatePickerDailog(context);
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: mm == '' ? "MM" : mm,
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: "oxygen"),
                              border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(width: 2),
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Month",
                            style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(51, 51, 51, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Container(
                      width: 60,
                      child: Column(
                        children: [
                          TextField(
                            onTap: () {
                              showDatePickerDailog(context);
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: yyyy == '' ? "YYYY" : yyyy,
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: "oxygen"),
                              border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(width: 2),
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Year",
                            style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(51, 51, 51, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.calendar_today_rounded),
                        onPressed: () {
                          showDatePickerDailog(context);
                        },
                        color: Color.fromRGBO(182, 102, 210, 1),
                        iconSize: 30,
                      ),
                      Text(""),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 15,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                    Text(
                      " We won’t reveal this to anyone",
                      style: TextStyle(
                        fontFamily: "oxygen",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              isValueSubmitted
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Awesome, you are a ",
                                  style: TextStyle(
                                      fontFamily: "oxygen",
                                      fontSize: 20,
                                      color: Color.fromRGBO(51, 51, 51, 1),
                                      fontWeight: FontWeight.w700),
                                ),
                                TextSpan(
                                  text: "$sunSign!",
                                  style: TextStyle(
                                    fontFamily: "oxygen",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(182, 102, 210, 1),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
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
