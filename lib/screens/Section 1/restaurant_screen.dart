// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gmlandingpage/place_model.dart';
import 'package:gmlandingpage/screens/Section%201/movie_screen.dart';
import 'package:gmlandingpage/services/database.dart';
import 'package:location/location.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/restaurant_model.dart';
import '../../widgets/button.dart';
import 'package:geolocator/geolocator.dart' as geo;
// import 'package:geocode/geocode.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

TextEditingController restaurantController = new TextEditingController();
String searchQuery = "";
bool isSearchString = false;
List<RestaurantModel> restaurantList = [];
// TextEditingController currentCityController = new TextEditingController();
// List<PlaceModel> currentCityList = [];
List<bool> isRestaurantSelected = [false, false, false];
List<RestaurantModel> selectedRestaurant = [
  RestaurantModel(),
  RestaurantModel(),
  RestaurantModel()
];

// bool isCurrentCitySelected = false;
Position? currentLocation;

class _RestaurantScreenState extends State<RestaurantScreen> {
  getUserLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      print(_permissionGranted);
      if (_permissionGranted != PermissionStatus.granted) {
        String url = "https://ipinfo.io/json?token=7f711a25d04d32";
        var myUri = Uri.parse(
          url,
        );
        http.Response response = await http.get(
          myUri,
        );
        if (response.statusCode == 200) {
          String jsonData = response.body;
          var decodeData = json.decode(jsonData);
          print(decodeData);
          setState(() {});
        }
      } else {
        currentLocation = await Geolocator.getCurrentPosition(
            desiredAccuracy: geo.LocationAccuracy.high);
        setState(() {});
      }
    } else if (_permissionGranted == PermissionStatus.deniedForever) {
      String url = "https://ipinfo.io/json?token=7f711a25d04d32";
      var myUri = Uri.parse(
        url,
      );
      http.Response response = await http.get(
        myUri,
      );
      if (response.statusCode == 200) {
        String jsonData = response.body;
        var decodeData = json.decode(jsonData);
        print(decodeData);
        setState(() {});
      }
    } else {
      currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: geo.LocationAccuracy.high);
      setState(() {});
    }

    // _locationData = await location.getLocation();

    //  currentLocation = position;
  }

  navigationFunction() {
    if (selectedRestaurant.length < 1) {
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
    DataBase().setRestaurant(restaurantController.text);
    Navigator.pushNamed(context, '/artist/');
  }

  fetchHomeTown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("restaurant")) {
      restaurantController.text = prefs.getString("restaurant")!;
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    // fetchHomeTown();
    getUserLocation();
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
                    percent: 8 / 11,
                    center: Text("8/11"),
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
                            percent: 8 / 11,
                            center: Text("8/11"),
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
                        "Choose your three favorite restaurants from “location”.",
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                    Flexible(
                      child: Text(
                        "Minimum 1 restaurant is required. You can add more later.",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
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
                    setState(() {});
                  });
                },
                leading: SvgPicture.asset("assets/images/plus.svg"),
                title: isRestaurantSelected[0]
                    ? Text(selectedRestaurant[0].name!)
                    : Text(
                        "Add a restaurant",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                trailing: isRestaurantSelected[0]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isRestaurantSelected[0] = false;
                          });
                        },
                        icon: Icon(Icons.cancel),
                      )
                    : SizedBox(
                        height: 0,
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
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
                    setState(() {});
                  });
                },
                leading: SvgPicture.asset("assets/images/plus.svg"),
                title: isRestaurantSelected[1]
                    ? Text(selectedRestaurant[1].name!)
                    : Text(
                        "Add a restaurant",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                trailing: isRestaurantSelected[1]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isRestaurantSelected[1] = false;
                          });
                        },
                        icon: Icon(Icons.cancel),
                      )
                    : SizedBox(
                        height: 0,
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
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
                      return MyBottomSheetWidget(index: 2);
                    },
                  ).then((value) {
                    setState(() {});
                  });
                },
                leading: SvgPicture.asset("assets/images/plus.svg"),
                title: isRestaurantSelected[2]
                    ? Text(selectedRestaurant[2].name!)
                    : Text(
                        "Add a restaurant",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                trailing: isRestaurantSelected[2]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isRestaurantSelected[2] = false;
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
  final RestaurantModel restaurantModel;
  PredictionTile({required this.restaurantModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.restaurant),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    restaurantModel.name == null
                        ? Text("")
                        : Text(
                            restaurantModel.name!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16),
                          ),
                    SizedBox(
                      height: 3,
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
      print(response.body);
      print("=====================");
      if (response.statusCode == 200) {
        final val = jsonDecode(response.body);
        final List result = val["results"];
        for (int i = 0; i < result.length; i++) {
          print(result[i]['name']);
          if (result[i]['photos'] != null) {
            result[i]['photos'].forEach((v) {
              print(v);
            });
          }
        }
        // String jsonData = response.body;
        // var decodeData = json.decode(jsonData);
        // return decodeData;
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

    double radius = 100000;
    String type = "restaurant";
    String keyword = placeName;

    double lat = currentLocation!.latitude;
    double long = currentLocation!.longitude;

    String autoCompleteUrl =
        "https://agile-ocean-18311.herokuapp.com/https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$long&radius=$radius&type=$type&keyword=$keyword&key=$mapKey";

    var myUri = Uri.parse(
      autoCompleteUrl,
    );
    http.Response response = await http.get(
      myUri,
    );
    // print(response.body);
    print("=====================");
    if (response.statusCode == 200) {
      final val = jsonDecode(response.body);
      final List result = val["results"];
      for (int i = 0; i < result.length; i++) {
        restaurantList.add(RestaurantModel(
            name: result[i]['name'], placeId: result[i]['place_id']));
      }
    } else {
      // return "failed";
    }
    setState(() {});
    // if (res["status"] == "OK") {
    //   var predictions = res["predictions"];
    //   var placeList =
    //       (predictions as List).map((e) => PlaceModel.fromJson(e)).toList();
    //   setState(() {
    //     if (widget.index == 0) {
    //       restaurantList = placeList;
    //     } else {
    //       restaurantList = placeList;
    //     }
    //   });
    // }
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
                    restaurantList = [];
                  });
                }
              },
            ),
          ),
          restaurantList.length > 0
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListView.separated(
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          for (int i = 0; i < selectedMovies.length; i++) {
                            if (restaurantList[index].placeId ==
                                selectedRestaurant[i].placeId) {
                              return;
                            }
                          }

                          if (restaurantList[index].name != null) {
                            selectedRestaurant[widget.index].name =
                                restaurantList[index].name!;
                          }

                          restaurantList = [];
                          isRestaurantSelected[widget.index] = true;
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: PredictionTile(
                          restaurantModel: restaurantList[index],
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return Divider();
                    },
                    itemCount: restaurantList.length,
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
