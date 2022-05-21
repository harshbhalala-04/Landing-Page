// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.academicBackground,
        this.birthdate,
        this.borrowingMoney,
        this.childrenPlan,
        this.currentLocation,
        this.emergencyFund,
        this.firstHome,
        this.gender,
        this.height,
        this.hometown,
        this.imgUrls,
        this.income,
        this.incomeSource,
        this.incomeUse,
        this.industry,
        this.interestedGender,
        this.investment,
        this.member,
        this.motherToungue,
        this.name,
        this.phoneNumber,
        this.qualification,
        this.stockInvest,
        this.wedding,
        this.month,
        this.date,
        this.year
    });

    String? academicBackground;
    String? birthdate;
    String? borrowingMoney;
    String? childrenPlan;
    String? currentLocation;
    String? emergencyFund;
    String? firstHome;
    String? gender;
    String? height;
    String? hometown;
    List<String>? imgUrls;
    String? income;
    String? incomeSource;
    IncomeUse? incomeUse;
    String? industry;
    String? interestedGender;
    List<String>? investment;
    String? member;
    String? motherToungue;
    String? name;
    String? phoneNumber;
    String? qualification;
    String? stockInvest;
    String? wedding;
    String? date;
    String? month;
    String? year;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        academicBackground: json["academicBackground"] == null ? null : json["academicBackground"],
        birthdate: json["birthdate"] == null ? null : json["birthdate"],
        borrowingMoney: json["borrowingMoney"] == null ? null : json["borrowingMoney"],
        childrenPlan: json["childrenPlan"] == null ? null : json["childrenPlan"],
        currentLocation: json["currentLocation"] == null ? null : json["currentLocation"],
        emergencyFund: json["emergencyFund"] == null ? null : json["emergencyFund"],
        firstHome: json["firstHome"] == null ? null : json["firstHome"],
        gender: json["gender"] == null ? null : json["gender"],
        height: json["height"] == null ? null : json["height"],
        hometown: json["hometown"] == null ? null : json["hometown"],
        imgUrls: json["imgUrls"] == null ? null : List<String>.from(json["imgUrls"].map((x) => x)),
        income: json["income"] == null ? null : json["income"],
        incomeSource: json["incomeSource"] == null ? null : json["incomeSource"],
        incomeUse: json["incomeUse"] == null ? null : IncomeUse.fromJson(json["incomeUse"]),
        industry: json["industry"] == null ? null : json["industry"],
        interestedGender: json["interestedGender"] == null ? null : json["interestedGender"],
        investment: json["investment"] == null ? null : List<String>.from(json["investment"].map((x) => x)),
        member: json["member"] == null ? null : json["member"],
        motherToungue: json["motherToungue"] == null ? null : json["motherToungue"],
        name: json["name"] == null ? null : json["name"],
        date: json["date"] == null ? null : json["date"],
        month: json["month"] == null ? null : json["month"],
        year: json["year"] == null ? null : json["year"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        qualification: json["qualification"] == null ? null : json["qualification"],
        stockInvest: json["stockInvest"] == null ? null : json["stockInvest"],
        wedding: json["wedding"] == null ? null : json["wedding"],
    );

    Map<String, dynamic> toJson() => {
        "academicBackground": academicBackground == null ? null : academicBackground,
        "birthdate": birthdate == null ? null : birthdate,
        "borrowingMoney": borrowingMoney == null ? null : borrowingMoney,
        "childrenPlan": childrenPlan == null ? null : childrenPlan,
        "currentLocation": currentLocation == null ? null : currentLocation,
        "emergencyFund": emergencyFund == null ? null : emergencyFund,
        "firstHome": firstHome == null ? null : firstHome,
        "gender": gender == null ? null : gender,
        "height": height == null ? null : height,
        "hometown": hometown == null ? null : hometown,
        "imgUrls": imgUrls == null ? null : List<dynamic>.from(imgUrls!.map((x) => x)),
        "income": income == null ? null : income,
        "incomeSource": incomeSource == null ? null : incomeSource,
        "incomeUse": incomeUse == null ? null : incomeUse!.toJson(),
        "industry": industry == null ? null : industry,
        "interestedGender": interestedGender == null ? null : interestedGender,
        "investment": investment == null ? null : List<dynamic>.from(investment!.map((x) => x)),
        "member": member == null ? null : member,
        "motherToungue": motherToungue == null ? null : motherToungue,
        "name": name == null ? null : name,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "qualification": qualification == null ? null : qualification,
        "stockInvest": stockInvest == null ? null : stockInvest,
        "wedding": wedding == null ? null : wedding,
    };
}

class IncomeUse {
    IncomeUse({
        this.investments,
        this.necessities,
        this.savings,
        this.spending,
    });

    double? investments;
    double? necessities;
    double? savings;
    double? spending;

    factory IncomeUse.fromJson(Map<String, dynamic> json) => IncomeUse(
        investments: json["Investments"] == null ? null : json["Investments"],
        necessities: json["Necessities"] == null ? null : json["Necessities"],
        savings: json["Savings"] == null ? null : json["Savings"],
        spending: json["Spending"] == null ? null : json["Spending"],
    );

    Map<String, dynamic> toJson() => {
        "Investments": investments == null ? null : investments,
        "Necessities": necessities == null ? null : necessities,
        "Savings": savings == null ? null : savings,
        "Spending": spending == null ? null : spending,
    };
}
