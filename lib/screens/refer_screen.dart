// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/database.dart';
import '../widgets/button.dart';

class ReferScreen extends StatefulWidget {
  const ReferScreen({Key? key}) : super(key: key);

  @override
  State<ReferScreen> createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {
  String _phoneVal = "";
  TextEditingController phoneController = new TextEditingController();
  navigationFunction() async {
    
    
      DataBase().setReferral(_phoneVal, );
    
    Navigator.pushNamed(context, '/feed/');
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
                  padding: const EdgeInsets.only(top: 15, right: 15),
                  child: TextButton(
                    child: Text("Skip"),
                    onPressed: () {},
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
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 5),
                            child: TextButton(
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                    fontFamily: "oxygen",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(51, 51, 51, 1)),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      "Referred by",
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "If you were referred by someone, please enter their details",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Phone number",
                      style: TextStyle(
                        fontFamily: "oxygen",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  onChanged: (val) {
                    _phoneVal = val;
                  },
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Ten digit number",
                    filled: true,
                    fillColor: Color.fromRGBO(248, 240, 251, 1),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 2),
                    ),
                    hintStyle: TextStyle(
                      fontFamily: "oxygen",
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(149, 149, 149, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Benefits of referring / getting referred?",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Icon(
                          Icons.circle,
                          size: 8,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        "The referrer and the one getting referred will both get 1 month of premium membership for free.",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Spacer(),
              // Button(text: "Continue", navigationFunction: navigationFunction),
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
