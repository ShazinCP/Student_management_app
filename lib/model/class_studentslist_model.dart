class ClassStudentsListModel {
    String admissionNo;
    User user;
    int classRoom;

    ClassStudentsListModel({
        required this.admissionNo,
        required this.user,
        required this.classRoom,
    });

    factory ClassStudentsListModel.fromJson(Map<String, dynamic> json) => ClassStudentsListModel(
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

  get length => null;

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
    };
}
