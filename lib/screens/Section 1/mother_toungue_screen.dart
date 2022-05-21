// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/database.dart';
import '../../widgets/button.dart';

class MotherToungueScreen extends StatefulWidget {
  const MotherToungueScreen({Key? key}) : super(key: key);

  @override
  State<MotherToungueScreen> createState() => _MotherToungueScreenState();
}

class _MotherToungueScreenState extends State<MotherToungueScreen> {
  List<String> motherToungueList = [
    "Afar",
    "Afrikaans",
    "Albanian",
    "Amharic",
    "Arabic",
    "Aramaic",
    "Armenian",
    "Assamese",
    "Azerbaijani",
    "Balochi",
    "Basque",
    "Belarusian",
    "Bengali",
    "Berber",
    "Bhojpuri",
    "Bodo",
    "Bosnian",
    "Breton",
    "Bulgarian",
    "Burmese",
    "Cantonese",
    "Catalan",
    "Cebuano",
    "Chechen",
    "Chewa",
    "Chinese",
    "Comorian",
    "Corsican",
    "Creole",
    "Croatian",
    "Czech",
    "Dakhini",
    "Danish",
    "Dogri",
    "Dutch",
    "Dzongkha",
    "English",
    "Esperanto",
    "Estonian",
    "Ewe",
    "Faroese",
    "Filipino",
    "Finnish",
    "French",
    "Frisian",
    "Fulani",
    "Gujarati",
    "Galician",
    "Garhwali",
    "Georgian",
    "German",
    "Greek",
    "Guaraní",
    "Hindi",
    "Hakka",
    "Haryanvi",
    "Hausa",
    "Hawaiian",
    "Hebrew",
    "Hiligaynon",
    "Hmong",
    "Hokkien",
    "Hungarian",
    "Icelandic",
    "lgbo",
    "Indonesian",
    "Irish",
    "Italian",
    "Jamaican Patois",
    "Japanese",
    "Javanese",
    "Kannada",
    "Kashmiri",
    "Kazakh",
    "Khmer",
    "Kikongo",
    "Kinyarwanda",
    "Kirundi",
    "Kodava",
    "Konkani",
    "Korean",
    "Kumaoni",
    "Kurdish",
    "Kutchi",
    "Kyrgyz",
    "Lao",
    "Latin",
    "Latvian",
    "Lingala",
    "Lithuanian",
    "Luo",
    "Luxembourgish",
    "Macedonian",
    "Maithili",
    "Malagasy",
    "Malay",
    "Malayalam",
    "Maltese",
    "Mandarin",
    "Maori",
    "Marathi",
    "Marwari",
    "Mayan",
    "Meitei",
    "Mongolian",
    "Montenegrin",
    "Nahuatl",
    "Ndebele",
    "Nepali",
    "Norwegian",
    "Occitan",
    "Oriya",
    "Oromo",
    "Pahari",
    "Papiamento",
    "Pashto",
    "Persian",
    "Polish",
    "Portuguese",
    "Punjabi",
    "Quechua",
    "Rajasthani",
    "Romanian",
    "Romansh",
    "Russian",
    "Sami",
    "Sankethi",
    "Sanskrit",
    "Santali",
    "Saurashtra",
    "Sepedi",
    "Serbian",
    "Sesotho",
    "Setswana",
    "Seychelles Creole",
    "Shona",
    "Sign language",
    "Sindebele",
    "Sindhi",
    "Sinhala",
    "Slovak",
    "Slovenian",
    "Somali",
    "Spanish",
    "Sranan Tongo",
    "Sundanese",
    "Swahili",
    "Swati",
    "Swedish",
    "Tagalog",
    "Taiwanese",
    "Tajik",
    "Tamil",
    "Tatar",
    "Telugu",
    "Teochew",
    "Thai",
    "Tibetan",
    "Tigrinya",
    "Tsonga",
    "Tulu",
    "Tunisian",
    "Turkish",
    "Turkmen",
    "Twi",
    "Ukrainian",
    "Urdu",
    "Uyghur",
    "Uzbek",
    "Valencian",
    "Venda",
    "Vietnamese",
    "Welsh",
    "Wolof",
    "Xhosa",
    "Yiddish",
    "Yoruba",
    "Zulu",
  ];
  String motherToungeAns = "";
  navigationFunction() {
    if (motherToungeAns == "") {
      return AlertDialog(
        content: Text("This field is required"),
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
    }
    DataBase().setMotherToungue(motherToungeAns);
    DataBase().setShowPage(10);
    Navigator.pushNamed(context, '/height/');
  }

  fetchMotherToungue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("motherToungue")) {
      print(prefs.getString("motherToungue"));
      motherToungeAns = prefs.getString("motherToungue")!;
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchMotherToungue();
    super.initState();
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
                    percent: 9 / 11,
                    center: Text("9/11"),
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
                            percent: 9 / 11,
                            center: Text("9/11"),
                            progressColor: Color.fromRGBO(182, 102, 210, 1),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      "What is your mother tongue?",
                      style: TextStyle(
                        fontFamily: "oxygen",
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    selectedItem: motherToungeAns,
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search",
                    )),
                    items: motherToungueList,
                    label: "Select",
                    onChanged: (val) {
                      motherToungeAns = val!;
                    },
                  ),
                ),
              ),
              deviceSize.width > 800 ? Spacer() : Container(),
              deviceSize.width > 800
                  ? Button(
                      text: "Continue", navigationFunction: navigationFunction)
                  : Container(),
              // Spacer(),
              // Button(text: "Continue", navigationFunction: navigationFunction)
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
