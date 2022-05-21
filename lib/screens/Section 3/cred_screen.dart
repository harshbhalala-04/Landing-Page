// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class CredScreen extends StatefulWidget {
  const CredScreen({Key? key}) : super(key: key);

  @override
  State<CredScreen> createState() => _CredScreenState();
}

enum Member{Yes, No}

class _CredScreenState extends State<CredScreen> {
  Member? _reply;
  navigationFunction() {
    String member = "";
    if(_reply == Member.Yes) {
      member = "Yes";
    }  else if(_reply == Member.No) {
      member = "No";
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
    DataBase().setShowPage(23);
    DataBase().setCREDMember(member);
    
    
    Navigator.pushNamed(context, '/emergency_fund/');
  }
  fetchCRED() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("member")) {
      if(prefs.getString("member") == "Yes") {
        _reply = Member.Yes;
      } else if(prefs.getString("member") == "No") {
        _reply = Member.No;
      } 
    }

    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchCRED();
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
                    percent: 4/6,
                    center: Text("4/6"),
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
                            percent: 4/6,
                            center: Text("4/6"),
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
                      "Are you a member of CRED?",
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
                      _reply = Member.Yes;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Member.Yes,
                        groupValue: _reply,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        onChanged: (Member? value) {
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
                      _reply = Member.No;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Member.No,
                        groupValue: _reply,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        onChanged: (Member? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('No',style: TextStyle(
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
