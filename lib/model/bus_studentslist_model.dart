// To parse this JSON data, do
//
//     final busStudentsListModel = busStudentsListModelFromJson(jsonString);

import 'dart:convert';

List<BusStudentsListModel> busStudentsListModelFromJson(String str) => List<BusStudentsListModel>.from(json.decode(str).map((x) => BusStudentsListModel.fromJson(x)));

String busStudentsListModelToJson(List<BusStudentsListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusStudentsListModel {
    String admissionNo;
    User user;
    int classRoom;

    BusStudentsListModel({
        required this.admissionNo,
        required this.user,
        required this.classRoom,
    });

    factory BusStudentsListModel.fromJson(Map<String, dynamic> json) => BusStudentsListModel(
        admissionNo: json["admission_no"],
        user: User.fromJson(json["user"]),
        classRoom: json["classRoom"],
    );

    Map<String, dynamic> toJson() => {
        "admission_no": admissionNo,
        "user": user.toJson(),
        "classRoom": classRoom,
    };
}

class User {
    int id;
    String name;
    String gender;

    User({
        required this.id,
        required this.name,
        required this.gender,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
    };
}
