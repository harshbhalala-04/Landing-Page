import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBase {
  User? user = FirebaseAuth.instance.currentUser;

  void createUser(String phoneNo, String email) async {
    if (user != null) {
      FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
        "phoneNumber": phoneNo,
        "showPage": 0,
        "allAnswer": false,
        "uid": user!.uid,
        "email": email
      });
    }
  }

  void createUserByEmail(String phoneNo, String email) async {
    if (user != null) {
      FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
        "email": email,
        "showPage": 0,
        "allAnswer": false,
        "uid": user!.uid,
        "phoneNumber": phoneNo
      });
    }
  }

  void setAllAnswerTrue() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"allAnswer": true});
  }

  void setShowPage(int index) {
    print(user!.uid);
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"showPage": index});
  }

  void setAllImages(List<String> imgUrls) async {
    if (imgUrls[0] != "") {
      FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .update({"profileImg": imgUrls[0]});
    }
    List<String> tmpUrls = [];
    for (int i = 0; i < imgUrls.length; i++) {
      if (imgUrls[i] != "") {
        tmpUrls.add(imgUrls[i]);
      }
    }
    print(tmpUrls);
    print(tmpUrls);
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"imgUrls": tmpUrls});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("images", tmpUrls);
  }

  void setName(String name) async {
    FirebaseFirestore.instance.collection("users").doc(user!.uid).update({
      "name": name,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
  }

  void setGenderAndInterested(String gender, String interested) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"gender": gender, "interestedGender": interested});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("gender", gender);
    prefs.setString("interestedGender", interested);
  }

  void setIncomeUse(double val1, double val2, double val3, double val4) async {
    Map<String, dynamic> incomeUseMap = {
      "Necessities": val1,
      "Spending": val2,
      "Savings": val3,
      "Investments": val4
    };
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"incomeUse": incomeUseMap});

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble("Necessities", val1);
    prefs.setDouble("Spending", val1);
    prefs.setDouble("Savings", val1);
    prefs.setDouble("Investments", val1);
  }

  void setLocation(String hometown, String currentCity) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"hometown": hometown, "currentCity": currentCity});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("hometown", hometown);
    prefs.setString("currentCity", currentCity);
  }

  void setRestaurant(String restaurant) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"restaurant": restaurant});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("restaurant", restaurant);
  }

  void setHeight(String height, String feet, String inches) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"height": height});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("feet", feet);
    prefs.setString("inches", inches);
  }

  void setMotherToungue(String motherToungue) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"motherToungue": motherToungue});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("motherToungue", motherToungue);
  }

  void setAcademicBackground(String academicBackground) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"academicBackground": academicBackground});

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("academicBackground", academicBackground);
  }

  void setIndustry(String industry) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"industry": industry});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("industry", industry);
  }

  void setIncome(String income) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"income": income});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("income", income);
  }

  void setQualification(String qualification) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"qualification": qualification});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("qualification", qualification);
  }

  void setIncomeSource(String incomeSource) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"incomeSource": incomeSource});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("incomeSource", incomeSource);
  }

  void setRelationshipStatus(String relationshipStatus) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"relationshipStatus": relationshipStatus});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("relationshipStatus", relationshipStatus);
  }

  void setInvestment(List<String> investment) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"investment": investment});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("investment", investment);
  }

  void setQuality(List<String> quality) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"quality": quality});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("quality", quality);
  }

  void setDOB(String date, String month, String year) async {
    FirebaseFirestore.instance.collection("users").doc(user!.uid).update({
      "birthdate": date + "/" + month + "/" + year,
      "date": date,
      "month": month,
      "year": year
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("date", date);
    prefs.setString("month", month);
    prefs.setString("year", year);
  }

  void setInvestInStock(String stockInvest) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"stockInvest": stockInvest});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("stockInvest", stockInvest);
  }

  void setCREDMember(String member) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"member": member});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("member", member);
  }

  void setEmergencyFund(String emergencyFund) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"emergencyFund": emergencyFund});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("emergencyFund", emergencyFund);
  }

  void setBorrowingMoney(String borrowingMoney) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"borrowingMoney": borrowingMoney});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("borrowingMoney", borrowingMoney);
  }

  void setChildrenPlan(String childrenPlan) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"childrenPlan": childrenPlan});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("childrenPlan", childrenPlan);
  }

  void setFirstHome(String firstHome) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"firstHome": firstHome});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("firstHome", firstHome);
  }

  void setWedding(String wedding) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"wedding": wedding});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("wedding", wedding);
  }

  void setReferral(String phoneNo) async {
    await FirebaseFirestore.instance
        .collection("users")
        .where("phoneNumber", isEqualTo: phoneNo)
        .get()
        .then((val) {
      String otherUid = val.docs[0].data()['uid'];
      FirebaseFirestore.instance.collection("users").doc(otherUid).update({
        "referList": FieldValue.arrayUnion([phoneNo])
      });
      FirebaseFirestore.instance.collection("users").doc(user!.uid).update({
      "isByRefer": true,
      "referBy": otherUid
    });
    });
    
  }
}
