// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class AcademicBackgroundScreen extends StatefulWidget {
  const AcademicBackgroundScreen({Key? key}) : super(key: key);

  @override
  State<AcademicBackgroundScreen> createState() =>
      _AcademicBackgroundScreenState();
}

class _AcademicBackgroundScreenState extends State<AcademicBackgroundScreen> {
  List<String> academicBGList = [
    "Medicine",
    "Engineering",
    "Architecture",
    "Science",
    "Business",
    "Humanities & Arts",
    "Hotel Management",
    "Fashion",
    "Law",
    "Design",
    "Psychology",
    "Finance",
    "Other"
  ];
  String academicBGAns = "";
  navigationFunction() {
    if(academicBGAns == "") {
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
    DataBase().setShowPage(14);
    DataBase().setAcademicBackground(academicBGAns);
    Navigator.pushNamed(context, '/income_range/');
  }

  fetchAcademicBackground() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("academicBackground")) {
      academicBGAns = prefs.getString("academicBackground")!;
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchAcademicBackground();
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
                    percent: 0.2,
                    center: Text("1/5"),
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
                            percent: 0.2,
                            center: Text("1/5"),
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
                      "Academic background",
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
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    selectedItem: academicBGAns,
                    showSelectedItems: true,
                    showSearchBox: true,
                    items: academicBGList,
                     searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Search",
                      )
                    ),
                    // ignore: deprecated_member_use
                    label: "Select",
                    
                    onChanged: (val) {
                      academicBGAns = val!;
                    },
                  ),
                ),
              ),
              Spacer(),
              Button(text: "Continue", navigationFunction: navigationFunction)
            ],
          ),
        ),
      ),
    );
  }
}
