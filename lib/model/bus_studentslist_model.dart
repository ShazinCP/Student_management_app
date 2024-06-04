
import 'dart:convert';

List<BusStudentsListModel> BusStudentsListModelFromJson(String str) => List<BusStudentsListModel>.from(json.decode(str).map((x) => BusStudentsListModel.fromJson(x)));

String BusStudentsListModelToJson(List<BusStudentsListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusStudentsListModel {
    int id;
    User user;
    String admissionNo;
    int classRoom;

    BusStudentsListModel({
        required this.id,
        required this.user,
        required this.admissionNo,
        required this.classRoom,
    });

    factory BusStudentsListModel.fromJson(Map<String, dynamic> json) => BusStudentsListModel(
        id: json["id"],
        user: User.fromJson(json["user"]),
        admissionNo: json["admission_no"],
        classRoom: json["classRoom"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "admission_no": admissionNo,
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
