class BusStudentsListModel {
  int? id;
  String? admissionNo;
  User? user;
  int? classRoom;

  BusStudentsListModel({
    this.id,
    this.admissionNo,
    this.user,
    this.classRoom,
  });

  factory BusStudentsListModel.fromJson(Map<String, dynamic> json) {
    return BusStudentsListModel(
      id: json["id"] ?? 0, // Default value for id if null
      admissionNo: json["admission_no"] ?? '',
      user: json["user"] != null ? User.fromJson(json["user"]) : null, // Null check for user
      classRoom: json["classRoom"] ?? 0, // Default value for classRoom if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id ?? 0, // Ensures id is not null
      "admission_no": admissionNo ?? '', // Ensures admissionNo is not null
      "user": user?.toJson() ?? {}, // Handles potential null for user
      "classRoom": classRoom ?? 0, // Ensures classRoom is not null
    };
  }
}

class User {
  int? id;
  String? name;
  String? gender;

  User({
    this.id,
    this.name,
    this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? 0, // Default value for id if null
      name: json["name"] ?? '', // Default value for name if null
      gender: json["gender"] ?? '', // Default value for gender if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id ?? 0, // Ensures id is not null
      "name": name ?? '', // Ensures name is not null
      "gender": gender ?? '', // Ensures gender is not null
    };
  }
}
