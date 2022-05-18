import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBase {
  User? user = FirebaseAuth.instance.currentUser;

  void createUser(String phoneNo) async {
    if (user != null) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .set({"phoneNumber": phoneNo, "showPage": 0, "allAnswer": false});
    }
  }

  void createUserByEmail(String email) async {
    if (user != null) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .set({"email": email, "showPage": 0, "allAnswer": false});
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

  void setAllImages(List<String> imgUrls) {
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
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"imgUrls": tmpUrls});
  }

  void setName(String name) async {
    FirebaseFirestore.instance.collection("users").doc(user!.uid).update({
      "name": name,
    });
  }

  void setGenderAndInterested(String gender, String interested) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"gender": gender, "interestedGender": interested});
  }

  // void setGender(String gender) {
  //    FirebaseFirestore.instance.collection("users").doc(user!.uid).update({
  //     "gender": gender,
  //   });
  // }

  // void setInterestedGender(String interestedGender) {
  //    FirebaseFirestore.instance.collection("users").doc(user!.uid).update({
  //     "interestedGender": interestedGender,
  //   });
  // }

  void setHomeTown(String hometown) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"hometown": hometown});
  }

  void setCurrentLocation(String currentLocation) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"currentLocation": currentLocation});
  }

  void setHeight(String height) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"height": height});
  }

  void setMotherToungue(String motherToungue) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"motherToungue": motherToungue});
  }

  void setAcademicBackground(String academicBackground) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"academicBackground": academicBackground});
  }

  void setIndustry(String industry) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"industry": industry});
  }

  void setIncome(String income) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"income": income});
  }

  void setQualification(String qualification) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"qualification": qualification});
  }

  void setIncomeSource(String incomeSource) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"incomeSource": incomeSource});
  }

  void setRelationshipStatus(String relationshipStatus) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"relationshipStatus": relationshipStatus});
  }

  void setInvestment(List<String> investment) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"investment": investment});
  }

  void setDOB(String date, String month, String year) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"birthdate": date + "/" + month + "/" + year});
  }

  void setInvestInStock(String stockInvest) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"stockInvest": stockInvest});
  }

  void setCREDMember(String member) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"member": member});
  }

  void setEmergencyFund(String emergencyFund) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"emergencyFund": emergencyFund});
  }

  void setBorrowingMoney(String borrowingMoney) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"borrowingMoney": borrowingMoney});
  }

  void setChildrenPlan(String childrenPlan) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"childrenPlan": childrenPlan});
  }

  void setFirstHome(String firstHome) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"firstHome": firstHome});
  }

  void setWedding(String wedding) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({"wedding": wedding});
  }
}
