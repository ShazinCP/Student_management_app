import 'package:flutter/material.dart';
import 'package:student_management/model/class_studentslist_model.dart';
import 'package:student_management/services/class_studentslist_services.dart';

class ClassStudentsProvider with ChangeNotifier {
  ClassStudentsProvider(){
    fetchClassStudents();
  }

  TextEditingController searchController=TextEditingController();

  List<ClassStudentsListModel>? _students;
  bool _isLoading = false;
  String? _errorMessage;

  List<ClassStudentsListModel>? get students => _students;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchClassStudents() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _students = await ClassStudentsListServices().fetchClassStudentsList();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
