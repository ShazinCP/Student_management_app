import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/model/bus_studentslist_model.dart';

class BusStudentsListServices {
  final Dio _dio = Dio();
  Future<List<BusStudentsListModel>?> fetchBusStudentsList() async {
    String? token = await readToken();
    print("Token: ${token}");
    const url ='https://school-management-system-xbpl.onrender.com/teacher/busstudents/';
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
        final List<BusStudentsListModel> classStudentsList = json.map((item) => BusStudentsListModel.fromJson(item)).toList();
        return classStudentsList;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("Error: ${e.response?.data}");
      } else {
        log("Error: ${e.message}");
      }
    } catch (e) {
      log("Unexpected Error: $e");
    }
    
    return null;
  }
}
