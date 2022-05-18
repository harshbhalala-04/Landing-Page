// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmlandingpage/place_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:http/http.dart' as http;
import '../../widgets/button.dart';

class CurrentCityScreen extends StatefulWidget {
  const CurrentCityScreen({Key? key}) : super(key: key);

  @override
  State<CurrentCityScreen> createState() => _CurrentCityScreenState();
}

TextEditingController currentCityController = new TextEditingController();

class _CurrentCityScreenState extends State<CurrentCityScreen> {
  String searchQuery = "";

  List<PlaceModel> currentCityList = [];
  navigationFunction() {
    if (currentCityController.text == "") {
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
    Navigator.pushNamed(context, '/relationship_status/');
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
                            percent: 4 / 11,
                            center: Text("4/11"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Current City",
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: currentCityController,
                  cursorColor: Color.fromRGBO(182, 102, 210, 1),
                  decoration: InputDecoration(
                    hintText: '  Search',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromRGBO(182, 102, 210, 1),
                      ),
                    ),
                   
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromRGBO(182, 102, 210, 1),
                        // color: Color.fromRGBO(182, 102, 210, 1),
                      ),
                    ),
                  ),
                  onChanged: (val) {
                    searchQuery = val;

                    if (searchQuery != "") {
                      findPlace(searchQuery);
                    } else {
                      setState(() {
                        // isSearchString = false;
                        currentCityList = [];
                      });
                    }
                  },
                ),
              ),
              currentCityList.length > 0
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListView.separated(
                        itemBuilder: (ctx, index) {
                          return InkWell(
                            onTap: () {
                              if (currentCityList[index].main_text != null &&
                                  currentCityList[index].secondary_text !=
                                      null) {
                                currentCityController.text =
                                    currentCityList[index].main_text! +
                                        ", " +
                                        currentCityList[index].secondary_text!;
                              } else {
                                currentCityController.text =
                                    currentCityList[index].main_text!;
                              }
                              setState(() {
                                currentCityList = [];
                              });
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

  void findPlace(String placeName) async {
    String mapKey = "AIzaSyClZMABTQghPL4az0xu-2qyeoEe-GDU2ZQ";
    if (placeName.length > 1) {
      // https://cors-anywhere.herokuapp.com/

      String autoCompleteUrl =
          "https://agile-ocean-18311.herokuapp.com/https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey";

      var res = await RequestAssitant.getRequest(autoCompleteUrl);

      if (res == "failed") {
        return;
      }
      print("Places prediction:");
      print(res);

      if (res["status"] == "OK") {
        var predictions = res["predictions"];
        var placeList =
            (predictions as List).map((e) => PlaceModel.fromJson(e)).toList();
        setState(() {
          currentCityList = placeList;
        });
      }
    }
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
