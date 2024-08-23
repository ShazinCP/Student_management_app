import 'package:intl/intl.dart';

class BusPaymentsModel {
  double? paidAmount;
  double? balanceAmount;
  BusService? busService;
  List<Transaction>? transactions;

  BusPaymentsModel({
    required this.paidAmount,
    required this.balanceAmount,
    required this.busService,
    required this.transactions,
  });

  factory BusPaymentsModel.fromJson(Map<String, dynamic> json) {
    return BusPaymentsModel(
      paidAmount: (json['paid_amount'] as num?)?.toDouble(),
      balanceAmount: (json['balance_amount'] as num?)?.toDouble(),
      busService: json['bus_service'] != null
          ? BusService.fromJson(json['bus_service'])
          : null,
      transactions: json['transactions'] != null
          ? List<Transaction>.from(json['transactions'].map((x) => Transaction.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paid_amount': paidAmount,
      'balance_amount': balanceAmount,
      'bus_service': busService?.toJson(),
      'transactions': transactions != null
          ? List<dynamic>.from(transactions!.map((x) => x.toJson()))
          : null,
    };
  }
}

class BusService {
  int? annualFees;

  BusService({
    required this.annualFees,
  });

  factory BusService.fromJson(Map<String, dynamic> json) {
    return BusService(
      annualFees: json['annual_fees'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'annual_fees': annualFees,
    };
  }
}

class Transaction {
  int? id;
  String? amount;
  String? paidAmount;
  String? balanceAmount;
  String? createdAt;
  int? student;

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
      id: json['id'] as int?,
      amount: json['amount'] as String?,
      paidAmount: json['paid_amount'] as String?,
      balanceAmount: json['balance_amount'] as String?,
      createdAt: json['created_at'] as String?,
      student: json['student'] as int?,
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
    DateTime parsedDate = DateTime.parse(createdAt!);
    return DateFormat('dd-MM-yyyy').format(parsedDate);
  }
}
