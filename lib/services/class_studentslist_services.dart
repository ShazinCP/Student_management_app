

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/model/class_studentslist_model.dart';

class ClassStudentsListServices {
  final Dio _dio = Dio();

  Future<ClassStudentsListModel?> fetchClassStudentsList() async {
    String? token = await readToken();
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAb${token}");
    const url ='https://school-management-system-xbpl.onrender.com/teacher/classstudents/';
    try {
      final response = await _dio.get(url,
          options: Options(
            headers: {
              'Authorization':'Bearer $token',
            },
          ));
      if (response.statusCode == 200) {
        final json = response.data;
        print('Response: ${response.data}');
        print(json);
        final classStudentsListModel = ClassStudentsListModel.fromJson(json);
        return classStudentsListModel;
      } else {
        throw Exception('Failed to load data');
      }
    }on DioException catch(e){
           if(e.response!=null){
            log("${e.response?.data}");
           }
      }
      return null;
}
}

