import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/model/bus_studentslist_model.dart';

class BusStudentsListServices {
  final Dio _dio = Dio();
  Future<List<BusStudentsListModel>?> fetchBusStudentsList() async {
    String? token = await readToken();
    print("Token: ${token}");
    const url ='https://student-management-system-eojv.onrender.com/teacher/students/get_bus_students/';
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
        final List<dynamic> json = response.data;
        print('Response: ${response.data}');
        final List<BusStudentsListModel> busStudentsList = json.map((item) => BusStudentsListModel.fromJson(item)).toList();
        return busStudentsList;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("Error: ${e.response?.data}");
      } 
    
    return null;
}
}}