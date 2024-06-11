import 'package:flutter/material.dart';
import 'package:student_management/model/studentinfo_model.dart';
import 'package:student_management/services/student_info_services.dart';

class StudentInfoProvider with ChangeNotifier {
  StudentInfoModel? _studentInfo;
  bool _isLoading = false;
  String? _errorMessage;


  StudentInfoModel? get studentInfo => _studentInfo;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

   List<String> get busPoints {
    return _studentInfo?.route.busPoints.map((point) => point.name).toList() ?? [];
  }

  Future<void> fetchStudentInfo(int id) async {
    _isLoading = true;
    _errorMessage = null;
    // notifyListeners();

    try {
      _studentInfo = await StudentInfoServices().fetchStudentInfo(id);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


}