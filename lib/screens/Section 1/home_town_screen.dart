// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gmlandingpage/place_model.dart';
import 'package:gmlandingpage/services/database.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/button.dart';

class HomeTownScreen extends StatefulWidget {
  const HomeTownScreen({Key? key}) : super(key: key);

  @override
  State<HomeTownScreen> createState() => _HomeTownScreenState();
}

TextEditingController homeTownController = new TextEditingController();
String searchQuery = "";
bool isSearchString = false;
List<PlaceModel> homePlaceList = [];
TextEditingController currentCityController = new TextEditingController();
List<PlaceModel> currentCityList = [];
bool isHomeTownSelected = false;
bool isCurrentCitySelected = false;

class _HomeTownScreenState extends State<HomeTownScreen> {
  navigationFunction() {
    if (homeTownController.text == "") {
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
    DataBase().setLocation(homeTownController.text, currentCityController.text);
    Navigator.pushNamed(context, '/artist/');
  }

  fetchHomeTown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("hometown")) {
      homeTownController.text = prefs.getString("hometown")!;
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchHomeTown();
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
                    percent: 3 / 11,
                    center: Text("3/11"),
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            percent: 3 / 11,
                            center: Text("3/11"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Home town",
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                    context: context,
                    isDismissible: true,
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxWidth: deviceSize.width < 800
                          ? deviceSize.width
                          : deviceSize.width / 4,
                      maxHeight: deviceSize.height - 100,
                      minHeight: deviceSize.height - 100,
                    ),
                    builder: (ctx) {
                      return MyBottomSheetWidget(index: 0);
                    },
                  ).then((value) {
                    setState(() {
                      print(homeTownController.text);
                      print(isHomeTownSelected);
                    });
                  });
                },
                leading: SvgPicture.asset("assets/images/location.svg"),
                title: isHomeTownSelected
                    ? Text(homeTownController.text)
                    : Text(
                        "Add a location",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                trailing: isHomeTownSelected
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isHomeTownSelected = false;
                          });
                        },
                        icon: Icon(Icons.cancel),
                      )
                    : SizedBox(
                        height: 0,
                      ),
              ),
              SizedBox(height: 20,),
                Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Current Location",
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
               ListTile(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                    context: context,
                    isDismissible: true,
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxWidth: deviceSize.width < 800
                          ? deviceSize.width
                          : deviceSize.width / 4,
                      maxHeight: deviceSize.height - 100,
                      minHeight: deviceSize.height - 100,
                    ),
                    builder: (ctx) {
                      return MyBottomSheetWidget(index: 1);
                    },
                  ).then((value) {
                    setState(() {
                      
                    });
                  });
                },
                leading: SvgPicture.asset("assets/images/location.svg"),
                title: isCurrentCitySelected
                    ? Text(currentCityController.text)
                    : Text(
                        "Add a location",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                trailing: isCurrentCitySelected
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isCurrentCitySelected = false;
                          });
                        },
                        icon: Icon(Icons.cancel),
                      )
                    : SizedBox(
                        height: 0,
                      ),
              ),
              deviceSize.width > 800 ? Spacer() : Container(),
              deviceSize.width > 800
                  ? Button(
                      text: "Continue", navigationFunction: navigationFunction)
                  : Container(),
              // Spacer(),
              // Button(text: "Continue", navigationFunction: navigationFunction)
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

class PredictionTile extends StatelessWidget {
  final PlaceModel placePredictions;
  PredictionTile({required this.placePredictions});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.add_location),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    placePredictions.main_text == null
                        ? Text("")
                        : Text(
                            placePredictions.main_text!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16),
                          ),
                    SizedBox(
                      height: 3,
                    ),
                    placePredictions.secondary_text == null
                        ? Text("")
                        : Text(
                            placePredictions.secondary_text!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class RequestAssitant {
  static Future<dynamic> getRequest(String url) async {
    try {
      Map<String, String>? header = {
        'Access-Control-Allow-Origin': '*', // Required for CORS support to work
        "Access-Control-Allow-Credentials":
            "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET,POST, OPTIONS"
      };
      var myUri = Uri.parse(
        url,
      );
      http.Response response = await http.get(myUri, headers: header);
      if (response.statusCode == 200) {
        String jsonData = response.body;
        var decodeData = json.decode(jsonData);
        return decodeData;
      } else {
        return "failed";
      }
    } catch (err) {
      print("$err");
    }
  }
}

class MyBottomSheetWidget extends StatefulWidget {
  final int index;

  MyBottomSheetWidget({required this.index});

  @override
  State<MyBottomSheetWidget> createState() => _MyBottomSheetWidgetState();
}

class _MyBottomSheetWidgetState extends State<MyBottomSheetWidget> {
  void findPlace(String placeName) async {
    String mapKey = "AIzaSyClZMABTQghPL4az0xu-2qyeoEe-GDU2ZQ";

    String autoCompleteUrl =
        "https://agile-ocean-18311.herokuapp.com/https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey";

    var res = await RequestAssitant.getRequest(autoCompleteUrl);

    if (res == "failed") {
      return;
    }
    

    if (res["status"] == "OK") {
      var predictions = res["predictions"];
      var placeList =
          (predictions as List).map((e) => PlaceModel.fromJson(e)).toList();
      setState(() {
        if (widget.index == 0) {
          homePlaceList = placeList;
        } else {
          currentCityList = placeList;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              // controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(
                  Icons.search,
                  size: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(width: 2),
                ),
              ),
              onChanged: (val) {
                searchQuery = val;
                if (searchQuery != "") {
                  setState(() {
                    isSearchString = true;
                    findPlace(searchQuery);
                  });
                } else {
                  setState(() {
                    isSearchString = false;
                    if (widget.index == 0) {
                      homePlaceList = [];
                    } else {
                      currentCityList = [];
                    }
                  });
                }
                

              
              },
            ),
          ),
          widget.index == 0 && homePlaceList.length > 0
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListView.separated(
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          if (homePlaceList[index].main_text != null &&
                              homePlaceList[index].secondary_text != null) {
                            homeTownController.text =
                                homePlaceList[index].main_text! +
                                    ", " +
                                    homePlaceList[index].secondary_text!;
                          } else {
                            homeTownController.text =
                                homePlaceList[index].main_text!;
                          }
                          print(homeTownController.text);
                          homePlaceList = [];
                          isHomeTownSelected = true;
                          setState(() {
                            
                          });
                          Navigator.pop(context);
                        },
                        child: PredictionTile(
                          placePredictions: homePlaceList[index],
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return Divider();
                    },
                    itemCount: homePlaceList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  ),
                )
              : Container(),
          widget.index == 1 && currentCityList.length > 0
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListView.separated(
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          if (currentCityList[index].main_text != null &&
                              currentCityList[index].secondary_text != null) {
                            currentCityController.text =
                                currentCityList[index].main_text! +
                                    ", " +
                                    currentCityList[index].secondary_text!;
                          } else {
                            currentCityController.text =
                                currentCityList[index].main_text!;
                          }
                          isCurrentCitySelected = true;
                          currentCityList = [];
                          setState(() {
                            
                          });
                          Navigator.pop(context);
                        },
                        child: PredictionTile(
                          placePredictions: currentCityList[index],
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return Divider();
                    },
                    itemCount: currentCityList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
