import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.partnerID = '',
    this.partnerCode = '',
    this.displayName = '',
    this.status = '',
    this.sip = '',
    this.serviceTypeID = '',
    this.videoTutorial = '',
    this.tutorial = '',
    this.str = ''
  });

  String partnerID;
  String partnerCode;
  String displayName;
  String status;
  String sip;
  String serviceTypeID;
  String videoTutorial;
  String tutorial;
  String str;

  factory User.fromJson(Map<String, dynamic> json) => User(
    partnerID: json["partnerID"] ?? '',
    partnerCode: json["partnerCode"] ?? '',
    displayName: json["displayName"] ?? '',
    status: json["status"] ?? '',
    sip: json["sip"] ?? '',
    serviceTypeID: json["serviceTypeID"] ?? '',
    videoTutorial: json["video_tutorial"] ?? '',
    tutorial: json["tutorial"] ?? '',
    str: json["str"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "partnerID": partnerID,
    "partnerCode": partnerCode,
    "displayName": displayName,
    "status": status,
    "sip" : sip,
    "serviceTypeID" : serviceTypeID,
    "video_tutorial" : videoTutorial,
    "tutorial" : tutorial,
    "str" : str,
  };
}