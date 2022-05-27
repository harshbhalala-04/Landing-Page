// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gmlandingpage/widgets/confetti_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: deviceSize.width < 800
          ? Colors.white
          : Color.fromRGBO(229, 229, 229, 1),
      appBar: deviceSize.width < 800
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
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
          child: MyConfettiWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    controller!.play();
                  },
                  child: Text(
                    "🎉",
                    style: TextStyle(
                        fontFamily: "oxygen",
                        fontWeight: FontWeight.w700,
                        fontSize: 50),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Thank you for pre-registering!",
                  style: TextStyle(
                      fontFamily: "oxygen",
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "Follow us on our socials.",
                        style: TextStyle(
                            fontFamily: "oxygen",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.6),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "We’ll announce our launch date there.",
                        style: TextStyle(
                            fontFamily: "oxygen",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/twitter.svg"),
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset("assets/images/insta.png"),
                  ],
                ),
                Spacer(),
                Text(
                  "Like the concept?",
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Share it with your friends who are seeking",
                  style: TextStyle(
                      fontFamily: "oxygen",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.6),
                ),
                Text(
                  "meaningful relationships",
                  style: TextStyle(
                      fontFamily: "oxygen",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.6),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset("assets/images/copy.svg"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Copy URL",
                            style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/images/insta.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Instagram",
                            style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset("assets/images/twitter.svg"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Twitter",
                            style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/images/whatsapp.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Whatsapp",
                            style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
