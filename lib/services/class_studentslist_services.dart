import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/model/class_studentslist_model.dart';

class ClassStudentsListServices {
  final Dio _dio = Dio();

  Future<List<ClassStudentsListModel>?> fetchClassStudentsList() async {
    String? token = await readToken();
    print("${token}");
    const url ='https://school-management-system-xbpl.onrender.com/teacher/students/';
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
        final List<ClassStudentsListModel> classStudentsList = json.map((item) => ClassStudentsListModel.fromJson(item)).toList();
        return classStudentsList;
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