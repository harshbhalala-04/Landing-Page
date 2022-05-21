// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../movie_model.dart';
import '../../services/database.dart';
import '../../widgets/button.dart';
import 'package:http/http.dart' as http;

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

TextEditingController searchController = new TextEditingController();

bool isSearchString = false;
String searchQuery = "";
List<MovieModel> movieList = [];
List<MovieModel> selectedMovies = [MovieModel(), MovieModel(), MovieModel()];
List<bool> isMovieSelected = [false, false, false];

class _MovieScreenState extends State<MovieScreen> {
  navigationFunction() {
    if (selectedMovies.length < 1) {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("Please select at least one movie"),
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
    DataBase().setShowPage(12);
    Navigator.pushNamed(context, '/professional_intro/');
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
                    percent: 1,
                    center: Text("11/11"),
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
                            percent: 1,
                            center: Text("11/11"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Name three must see movies/series according to you?",
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextField(
              //     controller: searchController,
              //     decoration: InputDecoration(
              //       hintText: 'Search',
              //       suffixIcon: Icon(
              //         Icons.search,
              //         size: 20,
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: const BorderRadius.all(Radius.circular(30)),
              //         borderSide: BorderSide(width: 2),
              //       ),
              //     ),
              //     onChanged: (val) {
              //       searchQuery = val;

              //       if (searchQuery != "") {
              //         setState(() {
              //           isSearchString = true;
              //           movieList = [];
              //           getMovieRecords(searchQuery);
              //         });
              //       } else {
              //         setState(() {
              //           isSearchString = false;
              //           movieList = [];
              //         });
              //       }
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                    Text(
                      "Minimum 1 movie is required. You can add more later.",
                      style: TextStyle(
                        fontFamily: "oxygen",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
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
                      print("Once again bottom");
                      return MyBottomSheetWidget(index: 0);
                    },
                  ).then((value) {
                    setState(() {
                      print("Here state changes");
                      print(selectedMovies);
                    });
                  });
                },
                leading: isMovieSelected[0]
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(selectedMovies[0].poster!))
                    : SvgPicture.asset("assets/images/plus.svg"),
                title: isMovieSelected[0]
                    ? Text(selectedMovies[0].title!)
                    : Text(
                        "Add a movie",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                // subtitle: isMovieSelected[0]
                //     ? Text(selectedMovies[0].year!)
                //     : SizedBox(),
                trailing: isMovieSelected[0]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isMovieSelected[0] = false;
                            selectedMovies.removeAt(0);
                          });
                        },
                        icon: Icon(Icons.cancel),
                      )
                    : SizedBox(
                        height: 0,
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
                      print("Once again bottom");
                      return MyBottomSheetWidget(index: 1);
                    },
                  ).then((value) {
                    setState(() {
                      print("Here state changes");
                      print(selectedMovies);
                    });
                  });
                },
                leading: isMovieSelected[1]
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(selectedMovies[1].poster!))
                    : SvgPicture.asset("assets/images/plus.svg"),
                title: isMovieSelected[1]
                    ? Text(selectedMovies[1].title!)
                    : Text(
                        "Add a movie",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                // subtitle: isMovieSelected[1]
                //     ? Text(selectedMovies[1].year!)
                //     : SizedBox(height: 0,),
                trailing: isMovieSelected[1]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isMovieSelected[1] = false;
                            selectedMovies.removeAt(1);
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
                      print("Once again bottom");
                      return MyBottomSheetWidget(index: 2);
                    },
                  ).then((value) {
                    setState(() {
                      print("Here state changes");
                      print(selectedMovies);
                      print(isMovieSelected[2]);
                    });
                  });
                },
                leading: isMovieSelected[2]
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(selectedMovies[2].poster!))
                    : SvgPicture.asset("assets/images/plus.svg"),
                title: isMovieSelected[2]
                    ? Text(selectedMovies[2].title!)
                    : Text(
                        "Add a movie",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                // subtitle: isMovieSelected[2]
                //     ? Text(selectedMovies[2].year!)
                //     :SizedBox(height: 0,),
                trailing: isMovieSelected[2]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isMovieSelected[2] = false;
                            selectedMovies.removeAt(2);
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
  getMovieRecords(String query) async {
    try {
      final response = await http.get(Uri.parse(
          "https://www.omdbapi.com/?s=$query&apikey=40ee02cf&page=1"));

      final items = jsonDecode(response.body)['Search'];

      if (items != null) {
        for (int i = 0; i < items.length; i++) {
          print(items[i]);
          movieList.add(MovieModel.fromApi(items[i]));
        }
      }
      print(movieList);
      setState(() {});
    } catch (e) {
      print(e);
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
                    print("Here set state of is searching string true");
                    movieList = [];
                    getMovieRecords(searchQuery);
                  });
                } else {
                  setState(() {
                    isSearchString = false;
                    movieList = [];
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
                  itemCount: movieList.length,
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
                              for (int i = 0; i < selectedMovies.length; i++) {
                                if (selectedMovies[i].imdbID ==
                                    movieList[index].imdbID) {
                                  flag = 1;
                                }
                              }
                              if (flag == 0) {
                                selectedMovies[widget.index] = movieList[index];
                              }

                              isSearchString = false;
                              searchQuery = "";
                              movieList = [];
                              isMovieSelected[widget.index] = true;
                              print("here index value: $index");
                              print(isMovieSelected[2]);
                              searchController.text = "";
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: ListTile(
                              leading: Image.network(movieList[index].poster!),
                              title: Text(movieList[index].title!),
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
