import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/model/studentinfo_model.dart';

class StudentInfoServices {
  final Dio _dio = Dio();

  Future<StudentInfoModel?> fetchStudentInfo(int id) async {
    String? token = await readToken();
    print("Token: $token");
    final url = 'https://school-management-system-xbpl.onrender.com/teacher/busStudent/$id/';
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = response.data;
        print('Response: ${response.data}');
        final StudentInfoModel studentInfo = StudentInfoModel.fromJson(json);
        return studentInfo;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("Error: ${e.response?.data}");
      }
      return null;
    }
  }
}
