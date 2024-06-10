class StudentInfoModel {
  final Student student;
  final Bus bus;
  final Route route;
  final BusPoint busPoint;

  StudentInfoModel({
    required this.student,
    required this.bus,
    required this.route,
    required this.busPoint,
  });

  factory StudentInfoModel.fromJson(Map<String, dynamic> json) {
    return StudentInfoModel(
      student: Student.fromJson(json['student']),
      bus: Bus.fromJson(json['bus']),
      route: Route.fromJson(json['route']),
      busPoint: BusPoint.fromJson(json['bus_point']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student': student.toJson(),
      'bus': bus.toJson(),
      'route': route.toJson(),
      'bus_point': busPoint.toJson(),
    };
  }
}

class Bus {
  final int id;
  final int busNo;
  final String driverName;
  final String plateNumber;
  final int capacity;

  Bus({
    required this.id,
    required this.busNo,
    required this.driverName,
    required this.plateNumber,
    required this.capacity,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json['id'],
      busNo: json['bus_no'],
      driverName: json['driver_name'],
      plateNumber: json['plate_number'],
      capacity: json['capacity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bus_no': busNo,
      'driver_name': driverName,
      'plate_number': plateNumber,
      'capacity': capacity,
    };
  }
}

class BusPoint {
  final int id;
  final int route;
  final String name;
  final String fee;

  BusPoint({
    required this.id,
    required this.route,
    required this.name,
    required this.fee,
  });

  factory BusPoint.fromJson(Map<String, dynamic> json) {
    return BusPoint(
      id: json['id'],
      route: json['route'],
      name: json['name'],
      fee: json['fee'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'route': route,
      'name': name,
      'fee': fee,
    };
  }
}

class Route {
  final int id;
  final int bus;
  final int routeNo;
  final String fromLocation;
  final String toLocation;
  final List<BusPoint> busPoints;

  Route({
    required this.id,
    required this.bus,
    required this.routeNo,
    required this.fromLocation,
    required this.toLocation,
    required this.busPoints,
  });

  factory Route.fromJson(Map<String, dynamic> json) {
    var busPointsFromJson = json['bus_points'] as List;
    List<BusPoint> busPointsList =
        busPointsFromJson.map((i) => BusPoint.fromJson(i)).toList();

    return Route(
      id: json['id'],
      bus: json['bus'],
      routeNo: json['route_no'],
      fromLocation: json['from_location'],
      toLocation: json['to_location'],
      busPoints: busPointsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bus': bus,
      'route_no': routeNo,
      'from_location': fromLocation,
      'to_location': toLocation,
      'bus_points': busPoints.map((busPoint) => busPoint.toJson()).toList(),
    };
  }
}

class Student {
  final int id;
  final String admissionNo;
  final User user;

  Student({
    required this.id,
    required this.admissionNo,
    required this.user,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      admissionNo: json['admission_no'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'admission_no': admissionNo,
      'user': user.toJson(),
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
    };
  }
}
