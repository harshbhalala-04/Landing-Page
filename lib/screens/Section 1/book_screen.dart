// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../book_model.dart';
import '../../services/database.dart';
import '../../widgets/button.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

TextEditingController searchController = new TextEditingController();
bool isSearchString = false;
String searchQuery = "";
List<BookModel> bookList = [];
List<BookModel> selectedBooks = [BookModel(), BookModel(), BookModel()];
List<bool> isBookSelected = [false, false, false];

class _BookScreenState extends State<BookScreen> {
  navigationFunction() {
    if (selectedBooks.length < 1) {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("Please Select Atleast one book"),
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
                  "Name three must read books according to you?",
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
              //           bookList = [];
              //           getBooks(searchQuery);
              //         });
              //       } else {
              //         setState(() {
              //           isSearchString = false;
              //           bookList = [];
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
                      "Minimum 1 book is required. You can add more later.",
                      style: TextStyle(
                        fontFamily: "oxygen",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
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
                      )
                    ),
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
                      print(selectedBooks);
                    });
                  });
                },
                leading: isBookSelected[0]
                    ? Image.network(selectedBooks[0].thumbnail!)
                    : SvgPicture.asset("assets/images/plus.svg"),
                title: isBookSelected[0]
                    ? Text(selectedBooks[0].title!)
                    : Text(
                        "Add a book",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                trailing: isBookSelected[0]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isBookSelected[0] = false;
                            selectedBooks.removeAt(0);
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
                      return MyBottomSheetWidget(index: 1);
                    },
                  ).then((value) {
                    setState(() {
                      print("Here state changes");
                      print(selectedBooks);
                    });
                  });
                },
                leading: isBookSelected[1]
                    ? Image.network(selectedBooks[1].thumbnail!)
                    : SvgPicture.asset("assets/images/plus.svg"),
                title: isBookSelected[1]
                    ? Text(selectedBooks[1].title!)
                    : Text(
                        "Add a book",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      trailing: isBookSelected[1]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isBookSelected[1] = false;
                            selectedBooks.removeAt(1);
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
                      print(selectedBooks);
                      print(isBookSelected[2]);
                    });
                  });
                },
                leading: isBookSelected[2]
                    ? Image.network(selectedBooks[2].thumbnail!)
                    : SvgPicture.asset("assets/images/plus.svg"),
                title: isBookSelected[2]
                    ? Text(selectedBooks[2].title!)
                    : Text(
                        "Add a book",
                        style: TextStyle(
                          fontFamily: "oxygen",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      trailing: isBookSelected[2]
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isBookSelected[2] = false;
                            selectedBooks.removeAt(2);
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
  getBooks(String query) async {
    try {
      final response = await http.get(
          Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$query"));

      final items = jsonDecode(response.body)['items'];

      for (var item in items) {
        bookList.add(BookModel.fromApi(item));
      }

      for (int i = 0; i < bookList.length; i++) {
        bookList[i].authors;
      }
      setState(() {});
    } catch (e) {
      print("error get books $e");
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
                    bookList = [];
                    getBooks(searchQuery);
                  });
                } else {
                  setState(() {
                    isSearchString = false;
                    bookList = [];
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
                  itemCount: bookList.length,
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
                              for (int i = 0; i < selectedBooks.length; i++) {
                                if (selectedBooks[i].id == bookList[index].id) {
                                  flag = 1;
                                }
                              }
                              if (flag == 0) {
                                selectedBooks[widget.index] = bookList[index];
                              }

                              isSearchString = false;
                              searchQuery = "";
                              bookList = [];
                              isBookSelected[widget.index] = true;
                              print("here index value: $index");
                              print(isBookSelected[2]);
                              searchController.text = "";
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: ListTile(
                              leading:
                                  Image.network(bookList[index].thumbnail!),
                              title: Text(bookList[index].title!),
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


