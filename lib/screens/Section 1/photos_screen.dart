// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:html' as html;
import 'package:image_picker_web/image_picker_web.dart';
import 'package:path/path.dart' as Path;


import 'package:flutter/material.dart';

import 'package:image_cropper/image_cropper.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_cropper_for_web/image_cropper_for_web.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';
import 'dart:io' as io;

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  navigationFunction() {
    if (imageUrls[0] == "" &&
        imageUrls[1] == "" &&
        imageUrls[2] == "" &&
        imageUrls[3] == "" &&
        imageUrls[4] == "" &&
        imageUrls[5] == "") {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("Please Upload At least one photo."),
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
    DataBase().setShowPage(8);
    DataBase().setAllImages(imageUrls);
    Navigator.pushNamed(context, '/height/');
  }

  int count = 0;
  bool isLoading = false;
  String? imgUrl = '';

  html.File? _cloudFile;

  int newIndex = 0;
  List<bool> isLoadingImage = [false, false, false, false, false, false];
  List<bool> isUploadedImage = [false, false, false, false, false, false];
  List<dynamic> image = [
    "assets/images/add.png",
    "assets/images/add.png",
    "assets/images/add.png",
    "assets/images/add.png",
    "assets/images/add.png",
    "assets/images/add.png",
  ];

  List<String> imageUrls = ["", "", "", "", "", ""];

  Future<dynamic> cropImage(file) async {
    print(file);
    print(file.runtimeType);
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: file,
      uiSettings: [
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.dialog,
          boundary: Boundary(
            width: 520,
            height: 520,
          ),
          viewPort: ViewPort(width: 480, height: 480, type: 'circle'),
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        ),
      ],
    );
    return croppedFile;
  }

  void pickImage(BuildContext context, int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString("uid");

    html.File? imageFile = await ImagePickerWeb.getImageAsFile();

    setState(() {
      isLoadingImage[index] = true;
    });

    if (imageFile == null) {
      setState(() {
        isLoadingImage[index] = false;
      });
      return;
    }

    var snapshot = await FirebaseStorage.instance
        .ref('images/${uid}/${uid! + index.toString()}')
        .putBlob(imageFile);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    print(downloadUrl);
    setState(() {
      isLoadingImage[index] = false;
      isUploadedImage[index] = true;
      imageUrls[index] = downloadUrl;
    });
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
                    percent: 7 / 11,
                    center: Text("7/11"),
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
                            percent: 7 / 11,
                            center: Text("7/11"),
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
                        "Add some photos of yourself",
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(
                  "People with photos have a higher probability of recieving chat requests!",
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: image.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return isLoadingImage[index]
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            pickImage(context, index);
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              image: isUploadedImage[index]
                                  ? DecorationImage(
                                      image: NetworkImage(imageUrls[index]),
                                      fit: BoxFit.cover,
                                    )
                                  : DecorationImage(
                                      image: AssetImage(image[index]),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 15,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                    Flexible(
                      child: Text(
                        " Minimum 1 photo is required. You can add more later.",
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
