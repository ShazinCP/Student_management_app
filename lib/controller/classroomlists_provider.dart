import 'package:flutter/material.dart';
import 'package:student_management/model/classroomlist_model.dart';
import 'package:student_management/services/classroomlist_services.dart';

class ClassroomListsProvider with ChangeNotifier {
  ClassroomListsProvider() {
    fetchClassrooms();
  }

  TextEditingController adminSearchController = TextEditingController();
  
  List<ClassroomLists>? _classrooms;
  List<ClassroomLists>? get classrooms => _classrooms;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? selectedClassLevel;


  Future<void> fetchClassrooms() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _classrooms = await ClassroomListServices().fetchClassStudentsList();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String _adminSearchQuery = '';

  String get adminSearchQuery => _adminSearchQuery;

  void setAdminSearchQuery(String value) {
    _adminSearchQuery = value;
    notifyListeners();
  }
}
