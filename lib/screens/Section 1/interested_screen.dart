// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gmlandingpage/services/database.dart';

// import '../../widgets/button.dart';

// class InterestedScreen extends StatefulWidget {
//   const InterestedScreen({Key? key}) : super(key: key);

//   @override
//   State<InterestedScreen> createState() => _InterestedScreenState();
// }

// enum Gender { Male, Female }

// class _InterestedScreenState extends State<InterestedScreen> {
//   Gender? _reply;
//   navigationFunction() {
//     String interestedGender = "";
//     if(_reply == Gender.Male) {
//       interestedGender = "Male";
//     }  else if(_reply == Gender.Female) {
//       interestedGender = "Female";
//     }  else {
//       showDialog(context: context, builder: (ctx) {
//         return AlertDialog(
//           content: Text("Please Select Your Interested Gender"),
//           actions: [
//             ElevatedButton(
//               onPressed: (){
//                 Navigator.pop(context);
//               }, 
//               child: Text("Close"),
//             ),
//           ],
//         );
//       });
//     }
//     DataBase().setShowPage(5);
//     DataBase().setInterestedGender(interestedGender);
//     // Navigator.pushNamed(context, '/home_town/');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(229, 229, 229, 1),
//       appBar: deviceSize.width < 800
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               leading: Icon(
//                 Icons.arrow_back_ios_new,
//                 color: Colors.grey,
//               ),
//               actions: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SvgPicture.asset('assets/images/3_10.svg'),
//                 ),
//               ],
//             )
//           : AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               toolbarHeight: 0,
//               automaticallyImplyLeading: false,
//             ),
//       body: Center(
//         child: Container(
//           color: Colors.white,
//           height: deviceSize.height,
//           width:
//               deviceSize.width < 800 ? deviceSize.width : deviceSize.width / 4,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Interested in?",
//                       style: TextStyle(
//                         fontFamily: "oxygen",
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: InkWell(
//                   onTap: () {
//                     setState(() {
//                       _reply = Gender.Male;
//                     });
//                   },
//                   child: Row(
//                     children: [
//                       Radio(
//                         value: Gender.Male,
//                         activeColor: Color.fromRGBO(182, 102, 210, 1),
//                         groupValue: _reply,
//                         onChanged: (Gender? value) {
//                           setState(() {
//                             _reply = value!;
//                           });
//                         },
//                       ),
//                       Text('Male'),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: InkWell(
//                   onTap: () {
//                     setState(() {
//                       _reply = Gender.Female;
//                     });
//                   },
//                   child: Row(
//                     children: [
//                       Radio(
//                         value: Gender.Female,
//                         activeColor: Color.fromRGBO(182, 102, 210, 1),
//                         groupValue: _reply,
//                         onChanged: (Gender? value) {
//                           setState(() {
//                             _reply = value!;
//                           });
//                         },
//                       ),
//                       Text('Female'),
//                     ],
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Button(text: "Continue", navigationFunction: navigationFunction),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
