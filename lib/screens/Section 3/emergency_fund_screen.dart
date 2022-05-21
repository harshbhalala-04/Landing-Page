// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class EmergencyFundScreen extends StatefulWidget {
  const EmergencyFundScreen({ Key? key }) : super(key: key);

  @override
  State<EmergencyFundScreen> createState() => _EmergencyFundScreenState();
}

enum Option{Yes, No}

class _EmergencyFundScreenState extends State<EmergencyFundScreen> {
  Option? _reply;
  navigationFunction() {
    String option = "";
    if(_reply == Option.Yes) {
      option = "Yes";
    }  else if(_reply == Option.No) {
      option = "No";
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
    
    DataBase().setShowPage(24);
    DataBase().setEmergencyFund(option);
    Navigator.pushNamed(context, '/borrowing_money/');
  }
   fetchEmergencyFund() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("emergencyFund")) {
      if(prefs.getString("emergencyFund") == "Yes") {
        _reply = Option.Yes;
      } else if(prefs.getString("emergencyFund") == "No") {
        _reply = Option.No;
      } 
    }

    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchEmergencyFund();
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
                    percent: 5/6,
                    center: Text("5/6"),
                    progressColor: Color.fromRGBO(182, 102, 210, 1),
                  )
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
                            percent: 5/6,
                            center: Text("5/6"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Do you believe in keeping an emergency fund?",
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
                      _reply = Option.Yes;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Option.Yes,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Option? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Yes',style: TextStyle(
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
                      _reply = Option.No;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Option.No,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (Option? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('No', style: TextStyle(
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