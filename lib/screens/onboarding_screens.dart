// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const, prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    final deviceSize = MediaQuery.of(context).size;
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
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
          height: deviceSize.height,
          width:
              deviceSize.width < 800 ? deviceSize.width : deviceSize.width / 4,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(243, 242, 215, 1),
              Color.fromRGBO(246, 243, 212, 1),
              Color.fromRGBO(224, 230, 246, 1),
              Color.fromRGBO(219, 175, 237, 1)
            ],
          )),
          child: IntroductionScreen(
            key: introKey,
            globalBackgroundColor: Colors.transparent,
            // globalBackgroundColor: Colors.white,

            dotsDecorator: const DotsDecorator(
              size: Size(5.0, 10.0),
              color: Colors.black,
              activeSize: Size(10.0, 10.0),
              activeColor: Color.fromRGBO(182, 102, 210, 1),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            pages: [
              PageViewModel(
                decoration: PageDecoration(
                    // boxDecoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [
                    //     Color.fromRGBO(243, 242, 215, 1),
                    //     Color.fromRGBO(246, 243, 212, 1),
                    //     Color.fromRGBO(224, 230, 246, 1),
                    //     Color.fromRGBO(219, 175, 237, 1)
                    //   ],
                    // )),
                    // titleTextStyle: TextStyle(
                    //     fontFamily: "oxygen",
                    //     fontSize: 24,

                    //     fontWeight: FontWeight.w700),
                    bodyTextStyle: TextStyle(
                        fontFamily: "oxygen",
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                titleWidget: GradientText(
                  'Meet the right person',
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: .4,
                  colors: [
                    Color.fromRGBO(182, 102, 210, 1),
                    Color.fromRGBO(255, 85, 115, 1),
                  ],
                ),
                body:
                    "Meaningful long-term relationship with a smart and sensible person",
                footer: Column(children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(182, 102, 210, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                        child: Text(
                          "Pre-Register Now",
                          style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/auth/');
                        },
                      ),
                    ),
                  )
                ]),
                image: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/slide_1.svg",
                    width: double.infinity,
                  ),
                ),
              ),
              PageViewModel(
                decoration: PageDecoration(
                    // boxDecoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [
                    //     Color.fromRGBO(243, 242, 215, 1),
                    //     Color.fromRGBO(246, 243, 212, 1),
                    //     Color.fromRGBO(224, 230, 246, 1),
                    //     Color.fromRGBO(219, 175, 237, 1)
                    //   ],
                    // )),
                    // titleTextStyle: TextStyle(
                    //     fontFamily: "oxygen",
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.w700),
                    bodyTextStyle: TextStyle(
                        fontFamily: "oxygen",
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                titleWidget: GradientText(
                  'Sensible  people',
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: .4,
                  colors: [
                    Color.fromRGBO(182, 102, 210, 1),
                    Color.fromRGBO(255, 85, 115, 1),
                  ],
                ),
                body:
                    "Meet people not just with compatible personalities but who are also as smart as you are",
                image: SvgPicture.asset(
                  "assets/images/slide_2.svg",
                  width: double.infinity,
                ),
                footer: Column(children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(182, 102, 210, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                        child: Text(
                          "Pre-Register Now",
                          style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/auth/');
                        },
                      ),
                    ),
                  )
                ]),
              ),
              PageViewModel(
                titleWidget: GradientText(
                  'Relevant questions',
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: .4,
                  colors: [
                    Color.fromRGBO(182, 102, 210, 1),
                    Color.fromRGBO(255, 85, 115, 1),
                  ],
                ),
                decoration: PageDecoration(
                  // boxDecoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  //   colors: [
                  //     Color.fromRGBO(243, 242, 215, 1),
                  //     Color.fromRGBO(246, 243, 212, 1),
                  //     Color.fromRGBO(224, 230, 246, 1),
                  //     Color.fromRGBO(219, 175, 237, 1)
                  //   ],
                  // )),
                  // titleTextStyle: TextStyle(
                  //     fontFamily: "oxygen",
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.w700),
                  bodyTextStyle: TextStyle(
                      fontFamily: "oxygen",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                body:
                    "Well researched questions that make your personality shine",
                image: SvgPicture.asset(
                  "assets/images/slide_3.svg",
                  width: double.infinity,
                ),
                footer: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(182, 102, 210, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          child: Text(
                            "Pre-Register Now",
                            style: TextStyle(
                                fontFamily: "oxygen",
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/auth/');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PageViewModel(
                decoration: PageDecoration(
                    // boxDecoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [
                    //     Color.fromRGBO(243, 242, 215, 1),
                    //     Color.fromRGBO(246, 243, 212, 1),
                    //     Color.fromRGBO(224, 230, 246, 1),
                    //     Color.fromRGBO(219, 175, 237, 1)
                    //   ],
                    // )),
                    // titleTextStyle: TextStyle(
                    //     fontFamily: "oxygen",
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.w700),
                    bodyTextStyle: TextStyle(
                        fontFamily: "oxygen",
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                titleWidget: GradientText(
                  'Awesome filters',
                  style: TextStyle(
                    fontFamily: "oxygen",
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                  gradientType: GradientType.linear,
                  gradientDirection: GradientDirection.ttb,
                  radius: .4,
                  colors: [
                    Color.fromRGBO(182, 102, 210, 1),
                    Color.fromRGBO(255, 85, 115, 1),
                  ],
                ),
                body:
                    "You can tell a lot about a person based on the content they consume",
                image: SvgPicture.asset(
                  "assets/images/slide_4.svg",
                  width: double.infinity,
                ),
                footer: Column(children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(182, 102, 210, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                        child: Text(
                          "Pre-Register Now",
                          style: TextStyle(
                              fontFamily: "oxygen",
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/auth/');
                        },
                      ),
                    ),
                  )
                ]),
              ),
            ],
            showSkipButton: true,
            showNextButton: true,
            showBackButton: false,
            showDoneButton: false,
            skip: Text(
              "Skip",
              style: TextStyle(
                fontFamily: "oxygen",
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            next: Text(
              "Next",
              style: TextStyle(
                fontFamily: "oxygen",
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
