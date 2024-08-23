class ClassStudentsListModel {
  String admissionNo;
  User user;
  int classRoom;

  ClassStudentsListModel({
    required this.admissionNo,
    required this.user,
    required this.classRoom,
  });

  factory ClassStudentsListModel.fromJson(Map<String, dynamic> json) {
    return ClassStudentsListModel(
      admissionNo: json["admission_no"] ?? '', // Default to an empty string if null
      user: User.fromJson(json["user"] ?? {}), // Handle null for user
      classRoom: json["classRoom"] ?? 0, // Default to 0 if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "admission_no": admissionNo,
      "user": user.toJson(),
      "classRoom": classRoom,
    };
  }
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? 0, // Default to 0 if null
      name: json["name"] ?? '', // Default to an empty string if null
      gender: json["gender"] ?? '', // Default to an empty string if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "gender": gender,
    };
  }
}
