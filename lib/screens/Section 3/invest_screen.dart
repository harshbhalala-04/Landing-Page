// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oktoast/oktoast.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class InvestScreen extends StatefulWidget {
  const InvestScreen({Key? key}) : super(key: key);

  @override
  State<InvestScreen> createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
  navigationFunction() {
    if (count != 2) {
      return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Text("Please Select two options!"),
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
    List<String> reply = [];
    if (option1) {
      reply.add("Bank FD’s / RD’s");
    }
    if (option2) {
      reply.add("Gold");
    }
    if (option3) {
      reply.add("Real estate");
    }
    if (option4) {
      reply.add("Equities");
    }
    if (option5) {
      reply.add("Cryptocurrencies & NFT’s");
    }
    DataBase().setInvestment(reply);
    DataBase().setShowPage(21);
    Navigator.pushNamed(context, '/invest_in_stock/');
  }

  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;
  bool option5 = false;

  int count = 0;

  List<int> selectedValues = [];
  fetchInvestment() async { 
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("investment")) {
      List<String> replyAns = prefs.getStringList("investment")!;
      count = replyAns.length;
      for(int i = 0; i < replyAns.length; i++) {
        if(replyAns[i] == "Bank FD’s / RD’s") {
          option1 = true;
        } else if(replyAns[i] == "Gold") {
          option2 = true;
        } else if(replyAns[i] == "Real estate") {
          option3 = true;
        } else if(replyAns[i] == "Equities") {
          option4 = true;
        } else if(replyAns[i] == "Cryptocurrencies & NFT’s") {
          option5 = true;
        }
      }

    }
    setState(() {
      
    });
    
    
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchInvestment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
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
                      percent: 2 / 6,
                      center: Text("2/6"),
                      progressColor: Color.fromRGBO(182, 102, 210, 1),
                    )),
              ],
            )
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
            ),
      body: OKToast(
        child: Center(
          child: Container(
            color: Colors.white,
            height: deviceSize.height,
            width: deviceSize.width < 800
                ? deviceSize.width
                : deviceSize.width / 4,
            child: Column(
              children: [
                deviceSize.width < 800
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 8, right: 15),
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
                              percent: 2 / 6,
                              center: Text("2/6"),
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
                          "If you had to invest a million dollars in only two asset classes, then what would they be?",
                          style: TextStyle(
                            fontFamily: "oxygen",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.info_outline),
                        color: Color.fromRGBO(51, 51, 51, 1),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      print("Option1 : $option1");
                      if (option1) {
                        count--;
                        option1 = !option1;
                        return;
                      }
                      if (count == 2 && !option1) {
                        showToast(
                          " You can select maximum 2 options at a time! ",
                          position: ToastPosition.bottom,
                          constraints: BoxConstraints(
                            minHeight: 30,
                          ),
                          backgroundColor: Color.fromRGBO(182, 102, 210, 1),
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "oxygen",
                          ),
                        );

                        // OKToast(

                        //   child: Text("You can select maximum 2 options at a time!"),
                        //   position: ToastPosition.bottom,
                        //   backgroundColor: Color.fromRGBO(182, 102, 210, 1),
                        //   textStyle: TextStyle(
                        //     color: Colors.white,
                        //     fontFamily: "oxygen",

                        //   ),
                        // );

                        // Fluttertoast.showToast(
                        //   msg: "You can select maximum 2 options at a time!",
                        //   backgroundColor: Color.fromRGBO(182, 102, 210, 1),
                        //   fontSize: 14,
                        //   textColor: Colors.white,
                        // );
                      } else if (count < 2) {
                        option1 = !option1;
                        count++;
                      }
                    });
                    print("Option1 After : $option1");
                    print("Count while 1: $count");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: Color.fromRGBO(182, 102, 210, 1),
                            value: option1,
                            onChanged: (val) {
                              setState(() {
                                print("Option1 : $option1");
                                if (option1) {
                                  count--;
                                  option1 = val!;
                                  return;
                                }
                                if (count == 2 && !option1) {
                                  showToast(
                                    " You can select maximum 2 options at a time! ",
                                    position: ToastPosition.bottom,
                                    constraints: BoxConstraints(
                                      minHeight: 30,
                                    ),
                                    backgroundColor:
                                        Color.fromRGBO(182, 102, 210, 1),
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "oxygen",
                                    ),
                                  );
                                  return;
                                } else if (count < 2) {
                                  option1 = val!;
                                  count++;
                                }
                                print("Option1 After : $option1");
                                print("Count while 1: $count");
                              });
                            }),
                        Flexible(
                          child: Text(
                            "Bank FD’s / RD’s",
                            style:
                                TextStyle(fontFamily: "oxygen", fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      print("Option2 : $option2");
                      if (option2) {
                        print("Inside decrement count");
                        count--;

                        option2 = !option2;
                        return;
                      }
                      if (count == 2 && !option2) {
                        showToast(
                          " You can select maximum 2 options at a time! ",
                          position: ToastPosition.bottom,
                          constraints: BoxConstraints(
                            minHeight: 30,
                          ),
                          backgroundColor: Color.fromRGBO(182, 102, 210, 1),
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "oxygen",
                          ),
                        );
                        return;
                      } else if (count < 2) {
                        option2 = !option2;
                        count++;
                      }
                      print("Option2 After : $option2");
                      print("Count while 2: $count");
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: Color.fromRGBO(182, 102, 210, 1),
                            value: option2,
                            onChanged: (val) {
                              setState(() {
                                print("Option2 : $option2");
                                if (option2) {
                                  count--;
                                  option2 = val!;
                                  return;
                                }
                                if (count == 2 && !option2) {
                                  showToast(
                                    " You can select maximum 2 options at a time! ",
                                    position: ToastPosition.bottom,
                                    constraints: BoxConstraints(
                                      minHeight: 30,
                                    ),
                                    backgroundColor:
                                        Color.fromRGBO(182, 102, 210, 1),
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "oxygen",
                                    ),
                                  );
                                  return;
                                } else if (count < 2) {
                                  option2 = val!;
                                  count++;
                                }
                              });
                            }),
                        Flexible(
                          child: Text(
                            "Gold",
                            style:
                                TextStyle(fontFamily: "oxygen", fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (option3) {
                        count--;
                        option3 = !option3;
                        return;
                      }
                      if (count == 2 && !option3) {
                        showToast(
                          " You can select maximum 2 options at a time! ",
                          position: ToastPosition.bottom,
                          constraints: BoxConstraints(
                            minHeight: 30,
                          ),
                          backgroundColor: Color.fromRGBO(182, 102, 210, 1),
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "oxygen",
                          ),
                        );
                        return;
                      } else if (count < 2) {
                        option3 = !option3;
                        count++;
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: Color.fromRGBO(182, 102, 210, 1),
                            value: option3,
                            onChanged: (val) {
                              setState(() {
                                if (option3) {
                                  count--;
                                  option3 = val!;
                                  return;
                                }
                                if (count == 2 && !option3) {
                                  showToast(
                                    " You can select maximum 2 options at a time! ",
                                    position: ToastPosition.bottom,
                                    constraints: BoxConstraints(
                                      minHeight: 30,
                                    ),
                                    backgroundColor:
                                        Color.fromRGBO(182, 102, 210, 1),
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "oxygen",
                                    ),
                                  );
                                  return;
                                } else if (count < 2) {
                                  option3 = val!;
                                  count++;
                                }
                              });
                            }),
                        Flexible(
                          child: Text(
                            "Real estate",
                            style:
                                TextStyle(fontFamily: "oxygen", fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (option4) {
                        count--;
                        option4 = !option4;
                        return;
                      }
                      if (count == 2 && !option4) {
                        showToast(
                          " You can select maximum 2 options at a time! ",
                          position: ToastPosition.bottom,
                          constraints: BoxConstraints(
                            minHeight: 30,
                          ),
                          backgroundColor: Color.fromRGBO(182, 102, 210, 1),
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "oxygen",
                          ),
                        );
                        return;
                      } else if (count < 2) {
                        option4 = !option4;
                        count++;
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: Color.fromRGBO(182, 102, 210, 1),
                            value: option4,
                            onChanged: (val) {
                              setState(() {
                                if (option4) {
                                  count--;
                                  option4 = val!;
                                  return;
                                }
                                if (count == 2 && !option4) {
                                  showToast(
                                    " You can select maximum 2 options at a time! ",
                                    position: ToastPosition.bottom,
                                    constraints: BoxConstraints(
                                      minHeight: 30,
                                    ),
                                    backgroundColor:
                                        Color.fromRGBO(182, 102, 210, 1),
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "oxygen",
                                    ),
                                  );
                                  return;
                                } else if (count < 2) {
                                  option4 = val!;
                                  count++;
                                }
                              });
                            }),
                        Flexible(
                          child: Text(
                            "Equities",
                            style:
                                TextStyle(fontFamily: "oxygen", fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (option5) {
                        count--;
                        option5 = !option5;
                        return;
                      }
                      if (count == 2 && !option5) {
                        showToast(
                          " You can select maximum 2 options at a time! ",
                          position: ToastPosition.bottom,
                          constraints: BoxConstraints(
                            minHeight: 30,
                          ),
                          backgroundColor: Color.fromRGBO(182, 102, 210, 1),
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "oxygen",
                          ),
                        );
                        return;
                      } else if (count < 2) {
                        option5 = !option5;
                        count++;
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: Color.fromRGBO(182, 102, 210, 1),
                            value: option5,
                            onChanged: (val) {
                              setState(() {
                                if (option5) {
                                  count--;
                                  option5 = val!;
                                  return;
                                }
                                if (count == 2 && !option5) {
                                  showToast(
                                    " You can select maximum 2 options at a time! ",
                                    position: ToastPosition.bottom,
                                    constraints: BoxConstraints(
                                      minHeight: 30,
                                    ),
                                    backgroundColor:
                                        Color.fromRGBO(182, 102, 210, 1),
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "oxygen",
                                    ),
                                  );
                                  return;
                                } else if (count < 2) {
                                  option5 = val!;
                                  count++;
                                }
                              });
                            }),
                        Flexible(
                          child: Text(
                            "Cryptocurrencies & NFT’s",
                            style:
                                TextStyle(fontFamily: "oxygen", fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Button(
                    text: "Continue", navigationFunction: navigationFunction),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
