// To parse this JSON data, do
//
//     final classStudentsListModel = classStudentsListModelFromJson(jsonString);

import 'dart:convert';

List<ClassStudentsListModel> classStudentsListModelFromJson(String str) => List<ClassStudentsListModel>.from(json.decode(str).map((x) => ClassStudentsListModel.fromJson(x)));

String classStudentsListModelToJson(List<ClassStudentsListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassStudentsListModel {
    int id;
    String name;
    int capacity;
    List<Student> students;

    ClassStudentsListModel({
        required this.id,
        required this.name,
        required this.capacity,
        required this.students,
    });

    factory ClassStudentsListModel.fromJson(Map<String, dynamic> json) => ClassStudentsListModel(
        id: json["id"],
        name: json["name"],
        capacity: json["capacity"],
        students: List<Student>.from(json["students"].map((x) => Student.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "capacity": capacity,
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
    };
}

class Student {
    int id;
    User user;
    String admissionNo;
    int classRoom;

    Student({
        required this.id,
        required this.user,
        required this.admissionNo,
        required this.classRoom,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
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
