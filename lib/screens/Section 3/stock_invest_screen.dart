// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmlandingpage/screens/Section%203/borrowing_money_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class StockInvestScreen extends StatefulWidget {
  const StockInvestScreen({ Key? key }) : super(key: key);

  @override
  State<StockInvestScreen> createState() => _StockInvestScreenState();
}

enum StockInvest{Yes, Started, No}

class _StockInvestScreenState extends State<StockInvestScreen> {
  StockInvest? _reply;
  navigationFunction() {
    String stockInvest = "";
    if(_reply == StockInvest.Yes) {
      stockInvest = "Yes, I’m a veteran.";
    }  else if(_reply == StockInvest.Started) {
      stockInvest = "Started recently";
    } else if(_reply == StockInvest.No) {
      stockInvest = "No";
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
    DataBase().setShowPage(22);
    // DataBase().setShowPage(4);
    // DataBase().setGender(gender);
    DataBase().setInvestInStock(stockInvest);
    
    Navigator.pushNamed(context, '/borrowing_money/');
  }
  fetchStockInvest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("stockInvest")) {
      if(prefs.getString("stockInvest") == "Yes, I’m a veteran.") {
        _reply = StockInvest.Yes;
      } else if(prefs.getString("stockInvest") == "Started recently") {
        _reply = StockInvest.Started;
      }  else if(prefs.getString("stockInvest") == "No") {
        _reply = StockInvest.No;
      } 
    }

    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchStockInvest();
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
                    percent: 3/4,
                    center: Text("3/4"),
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
                            percent: 3/6,
                            center: Text("3/6"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Do you invest in the stock market?",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
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
                      _reply = StockInvest.Yes;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: StockInvest.Yes,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (StockInvest? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Yes, I’m a veteran.',style: TextStyle(
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
                      _reply = StockInvest.Started;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: StockInvest.Started,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (StockInvest? value) {
                          setState(() {
                            _reply = value!;
                          });
                        },
                      ),
                      Text('Started recently',style: TextStyle(
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
                      _reply = StockInvest.No;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: StockInvest.No,
                        activeColor: Color.fromRGBO(182, 102, 210, 1),
                        groupValue: _reply,
                        onChanged: (StockInvest? value) {
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