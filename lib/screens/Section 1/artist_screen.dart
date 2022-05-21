// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:spotify/spotify.dart' as spotify;

import '../../book_model.dart';
import '../../model/artist_model.dart';
import '../../services/database.dart';
import '../../widgets/button.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({Key? key}) : super(key: key);

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

TextEditingController searchController = new TextEditingController();
bool isSearchString = false;
String searchQuery = "";
// List<ArtistModel> artistList = [];
List<ArtistModel> artistList = [];
List<ArtistModel> selectedArtist = [
  ArtistModel(),
  ArtistModel(),
  ArtistModel()
];
List<bool> isArtistSelected = [false, false, false];

const clientId = "f7c5d4aad9d945eca2d825f85aee6c69";
const clientSecret = "9524240c15564693938e84d40a4aba4c";

final credentials = spotify.SpotifyApiCredentials(clientId, clientSecret);
final spotifyAuth = spotify.SpotifyApi(credentials);

class _ArtistScreenState extends State<ArtistScreen> {
  navigationFunction() {
    if (selectedArtist.length < 1) {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("Please Select Atleast one artist"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(182, 102, 210, 1)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              ],
            );
          });
    }
    DataBase().setShowPage(11);

    Navigator.pushNamed(context, '/movies/');
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
                    percent: 10 / 11,
                    center: Text("10/11"),
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
                            percent: 10 / 11,
                            center: Text("10/11"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Who are your three favourite artists?",
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
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
                        "Minimum 1 artist is required. You can add more later.",
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
                height: 20,
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
                    setState(() {});
                  });
                },
                leading: isArtistSelected[0]
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                        child: Image.network(selectedArtist[0].imageUri!),
                      )
                    : SvgPicture.asset("assets/images/plus.svg"),
                title: isArtistSelected[0]
                    ? Text(selectedArtist[0].name!)
                    : Text(
                        "Add an artist",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                trailing: isArtistSelected[0]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isArtistSelected[0] = false;
                            selectedArtist.removeAt(0);
                          });
                        },
                        icon: Icon(Icons.cancel),
                      )
                    : SizedBox(),
              ),
              SizedBox(
                height: 20,
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
                    setState(() {});
                  });
                },
                leading: isArtistSelected[1]
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          selectedArtist[1].imageUri!,
                        ),
                      )
                    : SvgPicture.asset(
                        "assets/images/plus.svg",
                      ),
                title: isArtistSelected[1]
                    ? Text(selectedArtist[1].name!)
                    : Text(
                        "Add an artist",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                trailing: isArtistSelected[1]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isArtistSelected[1] = false;
                            selectedArtist.removeAt(1);
                          });
                        },
                        icon: Icon(Icons.cancel),
                      )
                    : SizedBox(),
              ),
              SizedBox(
                height: 20,
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
                      return MyBottomSheetWidget(index: 2);
                    },
                  ).then((value) {
                    setState(() {});
                  });
                },
                leading: isArtistSelected[2]
                    ? ClipRRect( borderRadius: BorderRadius.circular(5),child: Image.network(selectedArtist[2].imageUri!))
                    : SvgPicture.asset("assets/images/plus.svg"),
                title: isArtistSelected[2]
                    ? Text(selectedArtist[2].name!)
                    : Text(
                        "Add an artist",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                trailing: isArtistSelected[2]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isArtistSelected[2] = false;
                            selectedArtist.removeAt(2);
                          });
                        },
                        icon: Icon(Icons.cancel),
                      )
                    : SizedBox(),
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

class MyBottomSheetWidget extends StatefulWidget {
  final int index;

  MyBottomSheetWidget({required this.index});

  @override
  State<MyBottomSheetWidget> createState() => _MyBottomSheetWidgetState();
}

class _MyBottomSheetWidgetState extends State<MyBottomSheetWidget> {
  getArtistData(String query) async {
    spotify.BundledPages data =
        spotifyAuth.search.get(query, types: [spotify.SearchType.artist]);
    List<spotify.Page> searchData = await data.first();

    for (int i = 0; i < searchData.length; i++) {
      searchData[i].items?.forEach((element) {
        artistList.add(new ArtistModel(
            name: element.name,
            id: element.id,
            imageUri: element.images == null || element.images.length == 0
                ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"
                : element.images[0].url));
      });
    }
    setState(() {});
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
              controller: searchController,
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

                    artistList = [];
                    getArtistData(searchQuery);
                  });
                } else {
                  setState(() {
                    isSearchString = false;
                    artistList = [];
                  });
                }
              },
            ),
          ),
          isSearchString
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,
                  itemCount: artistList.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Container(
                          width: deviceSize.width < 800
                              ? deviceSize.width
                              : deviceSize.width / 4,
                          child: InkWell(
                            onTap: () {
                              int flag = 0;
                              for (int i = 0; i < selectedArtist.length; i++) {
                                if (selectedArtist[i].id ==
                                    artistList[index].id) {
                                  flag = 1;
                                }
                              }
                              if (flag == 0) {
                                selectedArtist[widget.index] =
                                    artistList[index];
                              }

                              isSearchString = false;
                              searchQuery = "";
                              artistList = [];
                              isArtistSelected[widget.index] = true;

                              searchController.text = "";
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: ListTile(
                              leading:
                                  Image.network(artistList[index].imageUri!),
                              title: Text(artistList[index].name!),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : Container(),
        ],
      ),
    );
  }
}
