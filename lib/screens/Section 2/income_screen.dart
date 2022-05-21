// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmlandingpage/services/database.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/button.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

enum IncomeRange {
  ZeroToSix,
  SixToTwelve,
  TwelveToTwentyFour,
  AboverTwentyFour
}

class _IncomeScreenState extends State<IncomeScreen> {
  IncomeRange? _reply;
  navigationFunction() {
    String income = "";
    if(_reply == IncomeRange.ZeroToSix) {
      income = "₹0 - ₹6 Lakhs";
    }  else if(_reply == IncomeRange.SixToTwelve) {
      income = "₹6 - ₹12 Lakhs";
    } else if(_reply == IncomeRange.TwelveToTwentyFour) {
      income = "₹12 - ₹24 Lakhs";
    } else if(_reply == IncomeRange.AboverTwentyFour) {
      income = "Above ₹24 Lakhs";
    } else {
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
    DataBase().setShowPage(17);
    DataBase().setIncome(income);
    Navigator.pushNamed(context, '/source_of_income/');
  }
  fetchIncome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("income")) {
      if(prefs.getString("income") == "₹0 - ₹6 Lakhs") {
        _reply = IncomeRange.ZeroToSix;
      } else if(prefs.getString("income") == "₹6 Lakhs - ₹12 Lakhs") {
        _reply = IncomeRange.SixToTwelve;
      } else if(prefs.getString("income") == "₹12 Lakhs - ₹24 Lakhs") {
        _reply = IncomeRange.TwelveToTwentyFour;
      } else if(prefs.getString("income") == "Above ₹24 Lakhs") {
        _reply = IncomeRange.AboverTwentyFour;
      } 
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchIncome();
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
                  child: CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 2.0,
                    percent: 0.8,
                    center: Text("4/5"),
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
                            percent: 0.8,
                            center: Text("4/5"),
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
                      "Annual income range",
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
                      _reply = IncomeRange.ZeroToSix;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: IncomeRange.ZeroToSix,
                        groupValue: _reply,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        onChanged: (IncomeRange? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('₹0 - ₹6 Lakhs', style: TextStyle(
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
                      _reply = IncomeRange.SixToTwelve;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: IncomeRange.SixToTwelve,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (IncomeRange? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('₹6 Lakhs - ₹12 Lakhs', style: TextStyle(
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
                      _reply = IncomeRange.TwelveToTwentyFour;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: IncomeRange.TwelveToTwentyFour,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (IncomeRange? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('₹12 Lakhs - ₹24 Lakhs', style: TextStyle(
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
                      _reply = IncomeRange.AboverTwentyFour;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: IncomeRange.AboverTwentyFour,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (IncomeRange? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Above ₹24 Lakhs', style: TextStyle(
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
