// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class BorrowingMoneyScreen extends StatefulWidget {
  const BorrowingMoneyScreen({ Key? key }) : super(key: key);

  @override
  State<BorrowingMoneyScreen> createState() => _BorrowingMoneyScreenState();
}

enum Options {Option1,Option2, Option3, Option4}

class _BorrowingMoneyScreenState extends State<BorrowingMoneyScreen> {
  Options? _reply;
  navigationFunction() {
    String option = "";
    if(_reply == Options.Option1) {
      option = "I believe in zero debt";
    }  else if(_reply == Options.Option2) {
      option = "It’s okay to borrow money to acquire appreciating assets";
    }else if(_reply == Options.Option3) {
      option = "Borrow for anything that is tax efficient";
    }else if(_reply == Options.Option4) {
      option = "I haven’t thought about it seriously";
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
    DataBase().setBorrowingMoney(option);
    
    DataBase().setShowPage(25);
    Navigator.pushNamed(context, '/major_life_intro/');
  }

  fetchBorrowingMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("borrowingMoney")) {
      if(prefs.getString("borrowingMoney") == "I believe in zero debt") {
        _reply = Options.Option1;
      } else if(prefs.getString("borrowingMoney") == "It’s okay to borrow money to acquire appreciating assets") {
        _reply = Options.Option2;
      } else if(prefs.getString("borrowingMoney") == "Borrow for anything that is tax efficient") {
        _reply = Options.Option3;
      } else if(prefs.getString("borrowingMoney") == "I haven’t thought about it seriously") {
        _reply = Options.Option4;
      } 
    }

    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchBorrowingMoney();
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
                    center: Text("4/4"),
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
                            percent: 1,
                            center: Text("4/4"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "What are your thoughts on borrowing money?",
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
                      Text('I believe in zero debt',style: TextStyle(
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
                      Flexible(child: Text('It’s okay to borrow money to acquire appreciating assets',style: TextStyle(
                          fontSize: 18,
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                        ),)),
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
                      Flexible(
                        child: Text('Borrow for anything that is tax efficient',style: TextStyle(
                            fontSize: 18,
                            fontFamily: "oxygen",
                            fontWeight: FontWeight.w400,
                          ),),
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
                      _reply = Options.Option4;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: Options.Option4,
                        groupValue: _reply,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        onChanged: (Options? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('I haven’t thought about it seriously',style: TextStyle(
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