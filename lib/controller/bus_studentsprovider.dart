import 'package:flutter/material.dart';
import 'package:student_management/model/bus_studentslist_model.dart';
import 'package:student_management/services/bus_studentlist_services.dart';

class BusStudentsProvider with ChangeNotifier {
  BusStudentsProvider(){
    fetchBusStudents();
  }

TextEditingController searchController=TextEditingController();
  List<BusStudentsListModel>? _students;
  bool _isLoading = false;
  String? _errorMessage;

  List<BusStudentsListModel>? get students => _students;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchBusStudents() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _students = await BusStudentsListServices().fetchBusStudentsList();
    } catch (e) {
      _errorMessage = e.toString();
    }
     finally {
      _isLoading = false;
      notifyListeners();
    }
  }

    String _searchQuery = '';

  String get searchQuery => _searchQuery;

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
}
}
