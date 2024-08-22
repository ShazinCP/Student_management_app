class BusStudentsListModel {
  int id;
    String admissionNo;
    User user;
    int classRoom;

    BusStudentsListModel({
      required this.id,
        required this.admissionNo,
        required this.user,
        required this.classRoom,
    });

    factory BusStudentsListModel.fromJson(Map<String, dynamic> json) => BusStudentsListModel(
        id: json["id"],
        admissionNo: json["admission_no"],
        user: User.fromJson(json["user"]),
        classRoom: json["classRoom"],
    );

    Map<String, dynamic> toJson() => {
      "id": id,
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
