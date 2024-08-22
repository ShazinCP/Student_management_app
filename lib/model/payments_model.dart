// import 'dart:convert';

// BusPaymentsModel busPaymentsModelFromJson(String str) => BusPaymentsModel.fromJson(json.decode(str));

// String busPaymentsModelToJson(BusPaymentsModel data) => json.encode(data.toJson());

// class BusPaymentsModel {
//     num paidAmount;
//     num balanceAmount;
//     BusService busService;
//     List<Transaction> transactions;

//     BusPaymentsModel({
//         required this.paidAmount,
//         required this.balanceAmount,
//         required this.busService,
//         required this.transactions,
//     });

//     factory BusPaymentsModel.fromJson(Map<String, dynamic> json) => BusPaymentsModel(
//         paidAmount: json["paid_amount"],
//         balanceAmount: json["balance_amount"],
//         busService: BusService.fromJson(json["bus_service"]),
//         transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "paid_amount": paidAmount,
//         "balance_amount": balanceAmount,
//         "bus_service": busService.toJson(),
//         "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
//     };
// }

// class BusService {
//     int annualFees;

//     BusService({
//         required this.annualFees,
//     });

//     factory BusService.fromJson(Map<String, dynamic> json) => BusService(
//         annualFees: json["annual_fees"],
//     );

//     Map<String, dynamic> toJson() => {
//         "annual_fees": annualFees,
//     };
// }

// class Transaction {
//     int id;
//     String method;
//     String amount;
//     String paidAmount;
//     String balanceAmount;
//     DateTime createdAt;
//     int student;

//     Transaction({
//         required this.id,
//         required this.method,
//         required this.amount,
//         required this.paidAmount,
//         required this.balanceAmount,
//         required this.createdAt,
//         required this.student,
//     });

//     factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
//         id: json["id"],
//         method: json["method"],
//         amount: json["amount"],
//         paidAmount: json["paid_amount"],
//         balanceAmount: json["balance_amount"],
//         createdAt: DateTime.parse(json["created_at"]),
//         student: json["student"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "method": method,
//         "amount": amount,
//         "paid_amount": paidAmount,
//         "balance_amount": balanceAmount,
//         "created_at": createdAt.toIso8601String(),
//         "student": student,
//     };
// }



import 'package:intl/intl.dart';

class BusPaymentsModel {
  double paidAmount;
  double balanceAmount;
  BusService busService;
  List<Transaction> transactions;

  BusPaymentsModel({
    required this.paidAmount,
    required this.balanceAmount,
    required this.busService,
    required this.transactions,
  });

  factory BusPaymentsModel.fromJson(Map<String, dynamic> json) {
    return BusPaymentsModel(
      paidAmount: json['paid_amount'],
      balanceAmount: json['balance_amount'],
      busService: BusService.fromJson(json['bus_service']),
      transactions: List<Transaction>.from(json['transactions'].map((x) => Transaction.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paid_amount': paidAmount,
      'balance_amount': balanceAmount,
      'bus_service': busService.toJson(),
      'transactions': List<dynamic>.from(transactions.map((x) => x.toJson())),
    };
  }
}

class BusService {
  int annualFees;

  BusService({
    required this.annualFees,
  });

  factory BusService.fromJson(Map<String, dynamic> json) {
    return BusService(
      annualFees: json['annual_fees'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'annual_fees': annualFees,
    };
  }
}


class Transaction {
  int id;
  String amount;
  String paidAmount;
  String balanceAmount;
  String createdAt;
  int student;

  Transaction({
    required this.id,
    required this.amount,
    required this.paidAmount,
    required this.balanceAmount,
    required this.createdAt,
    required this.student,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      amount: json['amount'],
      paidAmount: json['paid_amount'],
      balanceAmount: json['balance_amount'],
      createdAt: json['created_at'],
      student: json['student'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'paid_amount': paidAmount,
      'balance_amount': balanceAmount,
      'created_at': createdAt,
      'student': student,
    };
  }

  // Method to get formatted date
  String getFormattedDate() {
    DateTime parsedDate = DateTime.parse(createdAt);
    return DateFormat('dd-MM-yyyy').format(parsedDate);
  }
}

