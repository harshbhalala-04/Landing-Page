// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gmlandingpage/widgets/button.dart';
import 'package:oktoast/oktoast.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../services/database.dart';

class QualityScreen extends StatefulWidget {
  const QualityScreen({Key? key}) : super(key: key);

  @override
  State<QualityScreen> createState() => _QualityScreenState();
}

class _QualityScreenState extends State<QualityScreen> {
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;
  bool option5 = false;
  bool option6 = false;
  bool option7 = false;
  bool option8 = false;
  bool option9 = false;
  bool option10 = false;

  int count = 0;

  List<int> selectedValues = [];

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
      reply.add("Confidence");
    }
    if (option2) {
      reply.add("Trustworthiness");
    }
    if (option3) {
      reply.add("Integrity");
    }
    if (option4) {
      reply.add("Compassion");
    }
    if (option5) {
      reply.add("Emotional Availability");
    }
     if (option6) {
      reply.add("Respect");
    }
     if (option7) {
      reply.add("Sense of Humor");
    }
     if (option8) {
      reply.add("Maturity");
    }
     if (option9) {
      reply.add("Ambitious");
    }
     if (option10) {
      reply.add("Family Oriented");
    }
    DataBase().setQuality(reply);
    // DataBase().setShowPage(21);
    Navigator.pushNamed(context, '/professional_intro/');
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
                      percent: 11 / 11,
                      center: Text("11/11"),
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
                              percent: 11 / 11,
                              center: Text("11/11"),
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
                          "What are the two most important qualities you want in your significant other?",
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
                            "Confidence",
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
                            "Trustworthiness",
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
                            "Integrity",
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
                            "Compassion",
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
                            "Emotional Availability",
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
                      if (option6) {
                        count--;
                        option6 = !option6;
                        return;
                      }
                      if (count == 2 && !option6) {
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
                        option6 = !option6;
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
                            value: option6,
                            onChanged: (val) {
                              setState(() {
                                if (option6) {
                                  count--;
                                  option6 = val!;
                                  return;
                                }
                                if (count == 2 && !option6) {
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
                                  option6 = val!;
                                  count++;
                                }
                              });
                            }),
                        Flexible(
                          child: Text(
                            "Respect",
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
                      if (option7) {
                        count--;
                        option7 = !option7;
                        return;
                      }
                      if (count == 2 && !option7) {
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
                        option7 = !option7;
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
                            value: option7,
                            onChanged: (val) {
                              setState(() {
                                if (option7) {
                                  count--;
                                  option7 = val!;
                                  return;
                                }
                                if (count == 2 && !option7) {
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
                                  option7 = val!;
                                  count++;
                                }
                              });
                            }),
                        Flexible(
                          child: Text(
                            "Sense of Humor",
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
                      if (option8) {
                        count--;
                        option8 = !option8;
                        return;
                      }
                      if (count == 2 && !option8) {
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
                        option8 = !option8;
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
                            value: option8,
                            onChanged: (val) {
                              setState(() {
                                if (option8) {
                                  count--;
                                  option8 = val!;
                                  return;
                                }
                                if (count == 2 && !option8) {
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
                                  option8 = val!;
                                  count++;
                                }
                              });
                            }),
                        Flexible(
                          child: Text(
                            "Maturity",
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
                      if (option9) {
                        count--;
                        option9 = !option9;
                        return;
                      }
                      if (count == 2 && !option9) {
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
                        option9 = !option9;
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
                            value: option9,
                            onChanged: (val) {
                              setState(() {
                                if (option9) {
                                  count--;
                                  option9 = val!;
                                  return;
                                }
                                if (count == 2 && !option9) {
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
                                  option9 = val!;
                                  count++;
                                }
                              });
                            }),
                        Flexible(
                          child: Text(
                            "Ambitious",
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
                      if (option10) {
                        count--;
                        option10 = !option10;
                        return;
                      }
                      if (count == 2 && !option10) {
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
                        option10 = !option10;
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
                            value: option10,
                            onChanged: (val) {
                              setState(() {
                                if (option10) {
                                  count--;
                                  option10 = val!;
                                  return;
                                }
                                if (count == 2 && !option10) {
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
                                  option10 = val!;
                                  count++;
                                }
                              });
                            }),
                        Flexible(
                          child: Text(
                            "Family Oriented",
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
