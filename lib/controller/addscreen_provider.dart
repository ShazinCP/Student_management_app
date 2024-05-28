import 'package:flutter/material.dart';

class AddScreenProvider extends ChangeNotifier {

  DateTime date = DateTime.now();

  String? selectedType;

  final formKey = GlobalKey<FormState>();

  String? selectedItem;

  FocusNode amount = FocusNode();

  final List<String> items = [
    'Cash',
    'Upi'
  ];

  void setDate(DateTime? newDate) {
    if (newDate != null) {
      date = newDate;
      notifyListeners();
    }
  }

  void selectedPaymentType(String value) {
    selectedItem = value;
    notifyListeners();
  }
}
