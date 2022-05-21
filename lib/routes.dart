// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'dart:js';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:gmlandingpage/screens/Section%201/birth_date_screen.dart';
import 'package:gmlandingpage/screens/Section%201/gender_screen.dart';
import 'package:gmlandingpage/screens/Section%201/home_town_screen.dart';
import 'package:gmlandingpage/screens/Section%201/name_screen.dart';
import 'package:gmlandingpage/screens/Section%201/relationship_status_screen.dart';
import 'package:gmlandingpage/screens/Section%201/sec1IntroScreen.dart';
import 'package:gmlandingpage/screens/Section%202/income_screen.dart';
import 'package:gmlandingpage/screens/Section%202/income_source_screen.dart';
import 'package:gmlandingpage/screens/Section%202/qualification_screen.dart';
import 'package:gmlandingpage/screens/Section%202/sec2IntroScreen.dart';
import 'package:gmlandingpage/screens/auth_page.dart';
import 'package:gmlandingpage/home.dart';
import 'package:gmlandingpage/screens/feed_screen.dart';
import 'package:gmlandingpage/screens/main_info_screen.dart';
import 'package:gmlandingpage/screens/movies_question_page.dart';
import 'package:gmlandingpage/screens/onboarding_screens.dart';
import 'package:gmlandingpage/screens/registration_page.dart';
import 'package:gmlandingpage/screens/slider_question.dart';
import 'package:gmlandingpage/screens/splash_route.dart';
import 'package:gmlandingpage/screens/thank_you_page.dart';

import 'screens/Section 1/artist_screen.dart';
import 'screens/Section 1/height_screen.dart';
import 'screens/Section 1/mother_toungue_screen.dart';
import 'screens/Section 1/movie_screen.dart';
import 'screens/Section 1/photos_screen.dart';
import 'screens/Section 2/academic_background_screen.dart';
import 'screens/Section 2/industry_screen.dart';
import 'screens/Section 3/borrowing_money_screen.dart';
import 'screens/Section 3/cred_screen.dart';
import 'screens/Section 3/emergency_fund_screen.dart';
import 'screens/Section 3/income_use_screen.dart';
import 'screens/Section 3/invest_screen.dart';
import 'screens/Section 3/sec3IntroScreen.dart';
import 'screens/Section 3/stock_invest_screen.dart';
import 'screens/Section 4/children_plan_screen.dart';
import 'screens/Section 4/first_home_screen.dart';
import 'screens/Section 4/sec4IntroScreen.dart';
import 'screens/Section 4/wedding_screen.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          Home());

  static Handler _registrationHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          RegistrationPage());

  static Handler _moviesQuestionHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          MoviesQuestionPage());

  static Handler _sliderQuestionHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          SliderQuestion());

  static Handler _thankYouPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          ThankYouPage());

  static Handler _authHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          AuthPage());

  static Handler _splashHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          SplashScreen());

  static Handler _mainInfoHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          MainInfoScreen());

  static Handler _sec1IntroHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          Sec1IntroScreen());

  static Handler _sec2IntroHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          Sec2IntroScreen());

  static Handler _sec3IntroHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          Sec3IntroScreen());

  static Handler _sec4IntroHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          Sec4IntroScreen());

  static Handler _nameHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          NameScreen());

  static Handler _genderHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          GenderScreen());

  // static Handler _interestedHandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
  //         InterestedScreen());

  static Handler _homeTownHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          HomeTownScreen());
  
  static Handler _sec2Que2Handler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          QualificationScreen());

  static Handler _sec2Que4Handler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          IncomeScreen());

  static Handler _sec2Que5Handler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          IncomeSourceScreen());

  static Handler _feedHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          FeedScreen());

  static Handler _relationshipHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          RelationshipStatusScreen());

  static Handler _birthDateHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          BirthDateScreen());

  static Handler _photoHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          PhotoScreen());

  static Handler _heightHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          HeightScreen());

  static Handler _motherToungueHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          MotherToungueScreen());

  static Handler _artistHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          ArtistScreen());

  static Handler _movieHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          MovieScreen());

  static Handler _academicBackgroundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          AcademicBackgroundScreen());

  static Handler _industryHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          IndustryScreen());

  static Handler _incomeUseHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          IncomeUseScreen());

  static Handler _investHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          InvestScreen());

  static Handler _stockInvestHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          StockInvestScreen());

  static Handler _credHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          CredScreen());

  static Handler _emeregencyFundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          EmergencyFundScreen());

  static Handler _borrowingMoneyHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          BorrowingMoneyScreen());

  static Handler _childrenPlanHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          ChildrenPlanScreen());

  static Handler _firstHomeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          FirstHomeScreen());

  static Handler _weddingHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          WeddingScreen());

  static Handler _onBoardingHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          OnBoardingScreens());

  static void setUpRouter() {
    router.define('/onboarding/',
        handler: _onBoardingHandler, transitionType: TransitionType.fadeIn);
    router.define('/registration/',
        handler: _registrationHandler, transitionType: TransitionType.fadeIn);
    router.define('/movie/',
        handler: _moviesQuestionHandler, transitionType: TransitionType.fadeIn);
    router.define('/slider/',
        handler: _sliderQuestionHandler, transitionType: TransitionType.fadeIn);
    router.define('/thank_you_page/',
        handler: _thankYouPageHandler, transitionType: TransitionType.fadeIn);
    router.define('/auth/',
        handler: _authHandler, transitionType: TransitionType.fadeIn);
    router.define('/splash/',
        handler: _splashHandler, transitionType: TransitionType.fadeIn);
    router.define('/main_info/',
        handler: _mainInfoHandler, transitionType: TransitionType.fadeIn);
    router.define('/about_you_intro/',
        handler: _sec1IntroHandler, transitionType: TransitionType.fadeIn);
    router.define('/professional_intro/',
        handler: _sec2IntroHandler, transitionType: TransitionType.fadeIn);
    router.define('/financial_intro/',
        handler: _sec3IntroHandler, transitionType: TransitionType.fadeIn);
    router.define('/major_life_intro/',
        handler: _sec4IntroHandler, transitionType: TransitionType.fadeIn);
    router.define('/name/',
        handler: _nameHandler, transitionType: TransitionType.fadeIn);
    router.define('/gender/',
        handler: _genderHandler, transitionType: TransitionType.fadeIn);
  
    router.define('/location/',
        handler: _homeTownHandler, transitionType: TransitionType.fadeIn);
   
    router.define('/relationship_status/',
        handler: _relationshipHandler, transitionType: TransitionType.fadeIn);

    // Birthdate
    router.define('/birth_date/',
        handler: _birthDateHandler, transitionType: TransitionType.fadeIn);

    // Photos
    router.define('/photos/',
        handler: _photoHandler, transitionType: TransitionType.fadeIn);

    // Height
    router.define('/height/',
        handler: _heightHandler, transitionType: TransitionType.fadeIn);

    // Mothertoungue
    router.define('/mother_toungue/',
        handler: _motherToungueHandler, transitionType: TransitionType.fadeIn);

    // Books
    router.define('/artist/',
        handler: _artistHandler, transitionType: TransitionType.fadeIn);

    // Movies
    router.define('/movies/',
        handler: _movieHandler, transitionType: TransitionType.fadeIn);

    // Academic Background
    router.define('/academic_background/',
        handler: _academicBackgroundHandler,
        transitionType: TransitionType.fadeIn);

    router.define('/highest_qualification/',
        handler: _sec2Que2Handler, transitionType: TransitionType.fadeIn);

    // Industry
    router.define('/industry/',
        handler: _industryHandler, transitionType: TransitionType.fadeIn);

    router.define('/income_range/',
        handler: _sec2Que4Handler, transitionType: TransitionType.fadeIn);
    router.define('/source_of_income/',
        handler: _sec2Que5Handler, transitionType: TransitionType.fadeIn);

    // IncomeUse
    router.define('/income_use/',
        handler: _incomeUseHandler, transitionType: TransitionType.fadeIn);

    // Invest
    router.define('/investment/',
        handler: _investHandler, transitionType: TransitionType.fadeIn);
    // Invest_Stock
    router.define('/invest_in_stock/',
        handler: _stockInvestHandler, transitionType: TransitionType.fadeIn);
    // CRED
    router.define('/cred/',
        handler: _credHandler, transitionType: TransitionType.fadeIn);
    // EmergencyFund
    router.define('/emergency_fund/',
        handler: _emeregencyFundHandler, transitionType: TransitionType.fadeIn);

    // BorrowingMoney
    router.define('/borrowing_money/',
        handler: _borrowingMoneyHandler, transitionType: TransitionType.fadeIn);

    // PlanForChildren
    router.define('/plan_for_children/',
        handler: _childrenPlanHandler, transitionType: TransitionType.fadeIn);

    // FirstHome
    router.define('/first_home/',
        handler: _firstHomeHandler, transitionType: TransitionType.fadeIn);

    // Wedding
    router.define('/wedding/',
        handler: _weddingHandler, transitionType: TransitionType.fadeIn);

    router.define('/feed/',
        handler: _feedHandler, transitionType: TransitionType.fadeIn);

    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return NotFoundPage();
    });
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Page Not Found'),
      ),
    );
  }
}
