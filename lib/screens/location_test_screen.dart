// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:http/http.dart' as http;
import 'package:geocode/geocode.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LocationTestScreen extends StatefulWidget {
  const LocationTestScreen({Key? key}) : super(key: key);

  @override
  State<LocationTestScreen> createState() => _LocationTestScreenState();
}

class _LocationTestScreenState extends State<LocationTestScreen> {
  geo.Position? currentLocation;
  void fetchLocation() async {
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
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData);
    String url = "http://maps.googleapis.com/maps/api/geocode/json?latlng=" +
        _locationData.latitude.toString() +
        "," +
        _locationData.longitude.toString() +
        "&sensor=false";

    String anotherUrl = "https://ipinfo.io/json?token=7f711a25d04d32";
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
    }
  }

  String cityName = "";

  getUserLocation() async {
    geo.LocationPermission permission = await geo.Geolocator.checkPermission();
    print(permission.name);
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        print("Here permission denied so call for api");
        // Fetch location from api
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
          print(decodeData['city']);
          setState(() {
            cityName = decodeData['city'];
          });
        }
      } else {
        currentLocation = await geo.Geolocator.getCurrentPosition(
            desiredAccuracy: geo.LocationAccuracy.high);

        print(currentLocation!.latitude.toString());
        print(currentLocation!.longitude.toString());
        final coordinates = new Coordinates(
            latitude: currentLocation!.latitude,
            longitude: currentLocation!.longitude);
        Address address = await GeoCode().reverseGeocoding(
            latitude: currentLocation!.latitude,
            longitude: currentLocation!.longitude);
        print(address.city);
        setState(() {
          cityName = address.city!;
        });
      }
    } else if (permission == geo.LocationPermission.deniedForever) {
      print("Request for permission");
      permission = await geo.Geolocator.requestPermission();
      print(permission.name);
      if (permission == geo.LocationPermission.denied ||
          permission == geo.LocationPermission.deniedForever) {
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
          print(decodeData['city']);
          setState(() {
            cityName = decodeData['city'];
          });
        }
      } else {
        currentLocation = await geo.Geolocator.getCurrentPosition(
            desiredAccuracy: geo.LocationAccuracy.high);

        print(currentLocation!.latitude.toString());
        print(currentLocation!.longitude.toString());
        final coordinates = new Coordinates(
            latitude: currentLocation!.latitude,
            longitude: currentLocation!.longitude);
        Address address = await GeoCode().reverseGeocoding(
            latitude: currentLocation!.latitude,
            longitude: currentLocation!.longitude);
        print(address.city);
        setState(() {
          cityName = address.city!;
        });
      }
    }
    // } else {
    //   String url = "https://ipinfo.io/json?token=7f711a25d04d32";
    //   var myUri = Uri.parse(
    //     url,
    //   );
    //   http.Response response = await http.get(
    //     myUri,
    //   );
    //   if (response.statusCode == 200) {
    //     String jsonData = response.body;
    //     var decodeData = json.decode(jsonData);
    //     print(decodeData['city']);
    //     setState(() {
    //       cityName = decodeData['city'];
    //     });
    //   }
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    // fetchLocation();
    getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 50,
        animation: true,
        lineHeight: 20.0,
        animationDuration: 2500,
        percent: 0.8,
        center: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            Text("80"),
            SizedBox(
              width: 20,
            ),
            Text("This is option text and this is description of option text"),
          ],
        ),
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: Colors.green,
      )),
    );
  }
}
