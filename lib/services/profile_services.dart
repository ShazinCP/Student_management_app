import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/model/profile_model.dart';

class ProfileServices {
  final Dio _dio = Dio();

  Future<List<Profile>?> fetchProfiles() async {
    String? token = await readToken();
    print("${token}");
    const url ='https://student-management-system-eojv.onrender.com/teacher/profile/';
    try {
      final response = await _dio.get(url,
          options: Options(
            headers: {
              'Authorization':'Bearer $token',
            },
          ));
      if (response.statusCode == 200) {
        final List<dynamic> json = response.data;
        print('Response: ${response.data}');
        final List<Profile> classroomList = json.map((item) => Profile.fromJson(item)).toList();
        return classroomList;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("${e.response?.data}");
      }
    }
    return null;
  }
}