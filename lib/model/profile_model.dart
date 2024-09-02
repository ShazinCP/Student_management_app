class Profile {
  final int id;
  final User user;
  final String penNo;
  final String? photo;

  Profile({
    required this.id,
    required this.user,
    required this.penNo,
    this.photo,
  });

  // Factory method to create a Profile object from JSON
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] ?? 0,
      user: User.fromJson(json['user'] ?? {}),
      penNo: json['pen_no'] ?? 'Unknown',
      photo: json['photo'],
    );
  }

  // Method to convert a Profile object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'pen_no': penNo,
      'photo': photo,
    };
  }
}

class User {
  final int id;
  final String name;
  final String gender;

  User({
    required this.id,
    required this.name,
    required this.gender,
  });

  // Factory method to create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      gender: json['gender'] ?? 'Unknown',
    );
  }

  // Method to convert a User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
    };
  }
}
