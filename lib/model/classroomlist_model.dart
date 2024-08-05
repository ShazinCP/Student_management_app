class ClassroomLists {
  final int id;
  final String name;
  final String division;
  final int capacity;
  final dynamic classTeacher;
  final List<dynamic> students;

  ClassroomLists({
    required this.id,
    required this.name,
    required this.division,
    required this.capacity,
    required this.classTeacher,
    required this.students,
  });

  // Factory constructor to create a ClassroomList object from JSON
  factory ClassroomLists.fromJson(Map<String, dynamic> json) {
    return ClassroomLists(
      id: json['id'],
      name: json['name'],
      division: json['division'],
      capacity: json['capacity'],
      classTeacher: json['classTeacher'],
      students: List<dynamic>.from(json['students']),
    );
  }

  // Method to convert a ClassroomList object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'division': division,
      'capacity': capacity,
      'classTeacher': classTeacher,
      'students': students,
    };
  }
}
