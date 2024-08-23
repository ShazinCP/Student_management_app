class StudentInfoModel {
  final Student? student;
  final Bus? bus;
  final Route? route;
  final BusPoint? busPoint;

  StudentInfoModel({
    this.student,
    this.bus,
    this.route,
    this.busPoint,
  });

  factory StudentInfoModel.fromJson(Map<String, dynamic> json) {
    return StudentInfoModel(
      student:
          json['student'] != null ? Student.fromJson(json['student']) : null,
      bus: json['bus'] != null ? Bus.fromJson(json['bus']) : null,
      route: json['route'] != null ? Route.fromJson(json['route']) : null,
      busPoint: json['bus_point'] != null
          ? BusPoint.fromJson(json['bus_point'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student': student?.toJson(),
      'bus': bus?.toJson(),
      'route': route?.toJson(),
      'bus_point': busPoint?.toJson(),
    };
  }
}

class Bus {
  final int? id;
  final int? busNo;
  final String? driverName;
  final String? plateNumber;
  final int? capacity;

  Bus({
    this.id,
    this.busNo,
    this.driverName,
    this.plateNumber,
    this.capacity,
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
  final int? id;
  final int? route;
  final String? name;
  final String? fee;

  BusPoint({
    this.id,
    this.route,
    this.name,
    this.fee,
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
  final int? id;
  final int? bus;
  final int? routeNo;
  final String? fromLocation;
  final String? toLocation;
  final List<BusPoint>? busPoints;

  Route({
    this.id,
    this.bus,
    this.routeNo,
    this.fromLocation,
    this.toLocation,
    this.busPoints,
  });

  factory Route.fromJson(Map<String, dynamic> json) {
    var busPointsFromJson = json['bus_points'] as List?;
    List<BusPoint> busPointsList =
        busPointsFromJson?.map((i) => BusPoint.fromJson(i)).toList() ?? [];

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
      'bus_points': busPoints?.map((busPoint) => busPoint.toJson()).toList(),
    };
  }
}

class Student {
  final int? id;
  final String? admissionNo;
  final User? user;

  Student({
    this.id,
    this.admissionNo,
    this.user,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      admissionNo: json['admission_no'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'admission_no': admissionNo,
      'user': user?.toJson(),
    };
  }
}

class User {
  final int? id;
  final String? name;
  final String? gender;

  User({
    this.id,
    this.name,
    this.gender,
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
