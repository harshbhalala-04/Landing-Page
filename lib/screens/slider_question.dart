// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SliderQuestion extends StatefulWidget {
  const SliderQuestion({Key? key}) : super(key: key);

  @override
  State<SliderQuestion> createState() => _SliderQuestionState();
}

class _SliderQuestionState extends State<SliderQuestion> {
  double title1 = 0;
  double title2 = 0;
  double title3 = 0;
  double title4 = 0;
  double min = 0;
  double max = 100;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      appBar: AppBar(
        title: Padding(
          padding: deviceSize.width > 300
              ? const EdgeInsets.all(20.0)
              : const EdgeInsets.all(0),
          child: Text(
            'GM',
            style: TextStyle(
              color: Color.fromRGBO(255, 85, 115, 1),
              fontSize: 24,
              fontWeight: FontWeight.w900,
              fontFamily: 'SourceSerifPro',
            ),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: deviceSize.width >= 376
                ? const EdgeInsets.all(10.0)
                : const EdgeInsets.all(0),
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/');
              },
              child: Text(
                'Home',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Cabin',
                    fontSize: deviceSize.width >= 376 ? 18 : 16),
              ),
            ),
          ),
          Padding(
            padding: deviceSize.width >= 348
                ? const EdgeInsets.all(10.0)
                : const EdgeInsets.all(0),
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/terms/');
              },
              child: Text(
                'Terms',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Cabin',
                    fontSize: deviceSize.width >= 376 ? 18 : 16),
              ),
            ),
          ),
          Padding(
            padding: deviceSize.width >= 348
                ? const EdgeInsets.all(10.0)
                : const EdgeInsets.all(0),
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/privacy-policy/');
              },
              child: Text(
                'Privacy',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Cabin',
                    fontSize: deviceSize.width >= 376 ? 18 : 16),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          height: deviceSize.width < 800
              ? deviceSize.height
              : deviceSize.height - 100,
          width:
              deviceSize.width < 800 ? deviceSize.width : deviceSize.width / 4,
          child: SingleChildScrollView(
            child: Center(
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
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Cupertino slider with maximum cumulative amount",
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
                  Row(
                    mainAxisAlignment: deviceSize.width < 800
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                          width: deviceSize.width < 800
                              ? deviceSize.width - 100
                              : deviceSize.width / 5,
                          padding: EdgeInsets.all(10),
                          child: Slider(
                            value: title1,
                            min: min,
                            max: max,
                            onChanged: (newVal) {
                              setState(() {
                                title1 = newVal;
                              });
                            },
                            divisions: 20,
                          )),
                      Text(title1.toInt().toString() + "%"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: deviceSize.width < 800
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                          width: deviceSize.width < 800
                              ? deviceSize.width - 100
                              : deviceSize.width / 5,
                          padding: EdgeInsets.all(10),
                          child: Slider(
                            value: title2,
                            min: min,
                            max: max,
                            onChanged: (newVal) {
                              setState(() {
                                title2 = newVal;
                              });
                            },
                            divisions: 20,
                          )),
                      Text(title2.toInt().toString() + "%"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: deviceSize.width < 800
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                          width: deviceSize.width < 800
                              ? deviceSize.width - 100
                              : deviceSize.width / 5,
                          padding: EdgeInsets.all(10),
                          child: Slider(
                            value: title3,
                            min: min,
                            max: max,
                            onChanged: (newVal) {
                              setState(() {
                                title3 = newVal;
                              });
                            },
                            divisions: 20,
                          )),
                      Text(title3.toInt().toString() + "%"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: deviceSize.width < 800
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                          width: deviceSize.width < 800
                              ? deviceSize.width - 100
                              : deviceSize.width / 5,
                          padding: EdgeInsets.all(10),
                          child: Slider(
                            value: title4,
                            min: min,
                            max: max,
                            onChanged: (newVal) {
                              setState(() {
                                title4 = newVal;
                              });
                            },
                            divisions: 20,
                          )),
                      Text(title4.toInt().toString() + "%"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: deviceSize.width < 800
                        ? deviceSize.width
                        : deviceSize.width / 4,
                    padding: const EdgeInsets.all(20),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Note: ",
                            style: TextStyle(
                                fontFamily: "oxygen",
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(83, 142, 201, 1)),
                          ),
                          TextSpan(
                            text: "Percentages should add up to 100%",
                            style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: deviceSize.width < 800
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: deviceSize.width < 800
                              ? deviceSize.width - 50
                              : deviceSize.width / 5,
                          child: ElevatedButton(
                            onPressed: () {
                              if (title1 + title2 + title3 + title4 > 100) {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        content: Text(
                                          "Percentage Should be less than 100%",
                                          style: TextStyle(
                                            fontFamily: "oxygen",
                                            fontSize: 20,
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Close"),
                                          ),
                                        ],
                                      );
                                    });
                                return;
                              }
                              Navigator.popAndPushNamed(
                                  context, '/thank_you_page/');
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
