import 'package:flutter/material.dart';
import 'package:student_management/model/profile_model.dart';
import 'package:student_management/services/profile_services.dart';

class ProfileProvider with ChangeNotifier {
  ProfileProvider() {
    fetchProfiles();
  }
  
  List<Profile>? _profiles;
  List<Profile>? get profiles => _profiles;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? selectedClassLevel;


  Future<void> fetchProfiles() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _profiles = await ProfileServices().fetchProfiles();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
