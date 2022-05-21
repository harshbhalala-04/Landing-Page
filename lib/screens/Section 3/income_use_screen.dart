// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class IncomeUseScreen extends StatefulWidget {
  const IncomeUseScreen({Key? key}) : super(key: key);

  @override
  State<IncomeUseScreen> createState() => _IncomeUseScreenState();
}

class _IncomeUseScreenState extends State<IncomeUseScreen> {
  double title1 = 0;
  double title2 = 0;
  double title3 = 0;
  double title4 = 0;
  double min = 0;
  double max = 100;
  navigationFunction() {
    if(title1 + title2 + title3 + title4 != 100) {
      return showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          content: Text("Percentages should be add up to 100%"),
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
    DataBase().setShowPage(20);
    DataBase().setIncomeUse(title1, title2, title3, title4);
    Navigator.pushNamed(context, '/investment/');
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
                    percent: 0.17,
                    center: Text("1/6"),
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
                            percent: 1/6,
                            center: Text("1/6"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "As per you, what is an ideal way to use your income?",
                          style: TextStyle(
                            fontFamily: "oxygen",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "Necessities",
                              style: TextStyle(
                                  fontFamily: "oxygen",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(51, 51, 51, 1)),
                            ),
                            IconButton(
                              icon: Icon(Icons.info_outline),
                              onPressed: () {},
                              color: Color.fromRGBO(51, 51, 51, 1),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: deviceSize.width < 800
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                              width: deviceSize.width < 800
                                  ? deviceSize.width - 100
                                  : deviceSize.width / 5,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: SliderTheme(
                                data: SliderThemeData(
                                  tickMarkShape: SliderTickMarkShape.noTickMark ,
                                  activeTickMarkColor: Colors.transparent,
                                  
                                ),
                                child: Slider(
                                  activeColor: Color.fromRGBO(182, 102, 210, 1),
                                  value: title1,
                                  
                                  min: min,
                                  max: max,
                                  onChanged: (newVal) {
                                    if (newVal + title2 + title3 + title4 <=
                                        100) {
                                      setState(() {
                                        title1 = newVal;
                                      });
                                    }
                                  },
                                  divisions: 20,
                                
                                ),
                              )),
                          Text(title1.toInt().toString() + "%"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "Spending",
                              style: TextStyle(
                                  fontFamily: "oxygen",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(51, 51, 51, 1)),
                            ),
                            IconButton(
                              icon: Icon(Icons.info_outline),
                              onPressed: () {},
                              color: Color.fromRGBO(51, 51, 51, 1),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: deviceSize.width < 800
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                              width: deviceSize.width < 800
                                  ? deviceSize.width - 100
                                  : deviceSize.width / 5,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: SliderTheme(
                                 data: SliderThemeData(
                                  tickMarkShape: SliderTickMarkShape.noTickMark ,
                                  activeTickMarkColor: Colors.transparent,
                                  
                                ),
                                child: Slider(
                                  value: title2,
                                  activeColor: Color.fromRGBO(182, 102, 210, 1),
                                  min: min,
                                  max: max,
                                  onChanged: (newVal) {
                                    if (newVal + title1 + title3 + title4 <=
                                        100) {
                                      setState(() {
                                        title2 = newVal;
                                      });
                                    }
                                  },
                                  divisions: 20,
                                ),
                              )),
                          Text(title2.toInt().toString() + "%"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "Savings",
                              style: TextStyle(
                                  fontFamily: "oxygen",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(51, 51, 51, 1)),
                            ),
                            IconButton(
                              icon: Icon(Icons.info_outline),
                              onPressed: () {},
                              color: Color.fromRGBO(51, 51, 51, 1),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: deviceSize.width < 800
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                              width: deviceSize.width < 800
                                  ? deviceSize.width - 100
                                  : deviceSize.width / 5,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: SliderTheme(
                                 data: SliderThemeData(
                                  tickMarkShape: SliderTickMarkShape.noTickMark ,
                                  activeTickMarkColor: Colors.transparent,
                                  
                                ),
                                child: Slider(
                                  value: title3,
                                  min: min,
                                  max: max,
                                  activeColor: Color.fromRGBO(182, 102, 210, 1),
                                  onChanged: (newVal) {
                                    if (newVal + title2 + title1 + title4 <=
                                        100) {
                                      setState(() {
                                        title3 = newVal;
                                      });
                                    }
                                  },
                                  divisions: 20,
                                ),
                              )),
                          Text(title3.toInt().toString() + "%"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "Investments",
                              style: TextStyle(
                                  fontFamily: "oxygen",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(51, 51, 51, 1)),
                            ),
                            IconButton(
                              icon: Icon(Icons.info_outline),
                              onPressed: () {},
                              color: Color.fromRGBO(51, 51, 51, 1),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: deviceSize.width < 800
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                              width: deviceSize.width < 800
                                  ? deviceSize.width - 100
                                  : deviceSize.width / 5,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: SliderTheme(
                                 data: SliderThemeData(
                                  tickMarkShape: SliderTickMarkShape.noTickMark ,
                                  activeTickMarkColor: Colors.transparent,
                                  
                                ),
                                child: Slider(
                                  value: title4,
                                  min: min,
                                  max: max,
                                  activeColor: Color.fromRGBO(182, 102, 210, 1),
                                  onChanged: (newVal) {
                                    if (newVal + title2 + title3 + title1 <=
                                        100) {
                                      setState(() {
                                        title4 = newVal;
                                      });
                                    }
                                  },
                                  divisions: 20,
                                ),
                              )),
                          Text(title4.toInt().toString() + "%"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: deviceSize.width < 800
                            ? deviceSize.width
                            : deviceSize.width / 4,
                        padding: const EdgeInsets.all(20),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Note: ",
                                style: TextStyle(
                                    fontFamily: "oxygen",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(182, 102, 210, 1)),
                              ),
                              TextSpan(
                                text: "Percentages should add up to 100%",
                                style: TextStyle(
                                  fontFamily: "oxygen",
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Button(text: "Continue", navigationFunction: navigationFunction),
            ],
          ),
        ),
      ),
    );
  }
}
