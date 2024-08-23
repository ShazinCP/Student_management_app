class User {
  final int id;
  final String name;
  final String username;
  final String gender;
  final String phone;
  final String dateOfBirth;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.gender,
    required this.phone,
    required this.dateOfBirth,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0, // Default value for id if null
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      gender: json['gender'] ?? '',
      phone: json['phone'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'gender': gender,
      'phone': phone,
      'date_of_birth': dateOfBirth,
    };
  }
}

class Student {
  final int id;
  final String admissionNo;
  final dynamic photo;
  final String guardianName;
  final String pincode;
  final String houseName;
  final String postOffice;
  final String place;
  final int classRoom;
  final User user;

  Student({
    required this.id,
    required this.admissionNo,
    this.photo,
    required this.guardianName,
    required this.pincode,
    required this.houseName,
    required this.postOffice,
    required this.place,
    required this.classRoom,
    required this.user,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] ?? 0, // Default value for id if null
      admissionNo: json['admission_no'] ?? '',
      photo: json['photo'],
      guardianName: json['guardian_name'] ?? '',
      pincode: json['pincode'] ?? '',
      houseName: json['house_name'] ?? '',
      postOffice: json['post_office'] ?? '',
      place: json['place'] ?? '',
      classRoom: json['classRoom'] ?? 0, // Default value for classRoom if null
      user: User.fromJson(json['user'] ?? {}), // Handle null for user
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'admission_no': admissionNo,
      'photo': photo,
      'guardian_name': guardianName,
      'pincode': pincode,
      'house_name': houseName,
      'post_office': postOffice,
      'place': place,
      'classRoom': classRoom,
      'user': user.toJson(),
    };
  }
}

class ClassroomLists {
  final int id;
  final String name;
  final String division;
  final int capacity;
  final dynamic classTeacher;
  final List<Student> students;

  ClassroomLists({
    required this.id,
    required this.name,
    required this.division,
    required this.capacity,
    this.classTeacher,
    required this.students,
  });

  factory ClassroomLists.fromJson(Map<String, dynamic> json) {
    return ClassroomLists(
      id: json['id'] ?? 0, // Default value for id if null
      name: json['name'] ?? "",
      division: json['division'] ?? "",
      capacity: json['capacity'] ?? 0, // Default value for capacity if null
      classTeacher: json['classTeacher']?['teacher']  ?? '', // Handle null for classTeacher
      students: (json['students'] as List<dynamic>?)
              ?.map((student) => Student.fromJson(student))
              .toList() ??
          [], // Handle null for students list
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'division': division,
      'capacity': capacity,
      'classTeacher': {'teacher': classTeacher},
      'students': students.map((student) => student.toJson()).toList(),
    };
  }
}
