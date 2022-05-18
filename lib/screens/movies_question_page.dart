// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gmlandingpage/movie_model.dart';
import 'package:http/http.dart' as http;

class MoviesQuestionPage extends StatefulWidget {
  const MoviesQuestionPage({Key? key}) : super(key: key);

  @override
  State<MoviesQuestionPage> createState() => _MoviesQuestionPageState();
}

class _MoviesQuestionPageState extends State<MoviesQuestionPage> {
  TextEditingController searchController = new TextEditingController();

  bool isSearchString = false;
  String searchQuery = "";
  List<MovieModel> movieList = [];
  List<MovieModel> selectedMovies = [];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              width: deviceSize.width < 800
                  ? deviceSize.width
                  : deviceSize.width / 4,
              padding: EdgeInsets.all(20),
              child: Text(
                "api based search list to select max 3 options",
                style: TextStyle(
                  fontFamily: "oxygen",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  width: deviceSize.width < 800
                      ? deviceSize.width
                      : deviceSize.width / 4,
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      suffixIcon: Icon(
                        Icons.search,
                        size: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                    onChanged: (val) {
                      searchQuery = val;

                      if (searchQuery != "") {
                        setState(() {
                          isSearchString = true;
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
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Enter Your current residance';
                      }
                    },
                  ),
                ),
              ),
            ),
            isSearchString
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                                for (int i = 0;
                                    i < selectedMovies.length;
                                    i++) {
                                  if (selectedMovies[i].imdbID ==
                                      movieList[index].imdbID) {
                                    flag = 1;
                                  }
                                }
                                if (flag == 0) {
                                  selectedMovies.add(movieList[index]);
                                }

                                isSearchString = false;
                                searchQuery = "";
                                movieList = [];
                                setState(() {});
                              },
                              child: ListTile(
                                leading:
                                    Image.network(movieList[index].poster!),
                                title: Text(movieList[index].title!),
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : Container(),
            isSearchString
                ? Container()
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: selectedMovies.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Container(
                            width: deviceSize.width < 800
                                ? deviceSize.width
                                : deviceSize.width / 4,
                            child: ListTile(
                              leading:
                                  Image.network(selectedMovies[index].poster!),
                              title: Text(selectedMovies[index].title!),
                              trailing: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {
                                  selectedMovies.removeAt(index);
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: deviceSize.width < 800
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: deviceSize.width < 800
                    ? deviceSize.width - 50
                    : deviceSize.width / 4,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/slider/');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: "oxygen",
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getMovieRecords(String query) async {
    try {
      final response = await http.get(Uri.parse(
          "https://www.omdbapi.com/?s=$query&apikey=40ee02cf&page=1"));

      final items = jsonDecode(response.body)['Search'];

      if (items != null) {
        for (int i = 0; i < items.length; i++) {
          movieList.add(MovieModel.fromApi(items[i]));
        }
      }
      setState(() {});
    } catch (e) {
      print(e);
    }
  }
}
