import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:student_management/helper/readandset_token.dart';

class AdminLoginServices {
  final Dio dio = Dio();
  Future<void> getToken(String userName, String password) async {
    try {
      String apiUrl =
          'https://student-management-system-eojv.onrender.com/admins/login/';

      final Map<String, dynamic> requestData = {
        "username": userName,
        "password": password
      };

      Response response = await dio.post(apiUrl, data: requestData);

      if (response.statusCode == 200) {
        print(response.statusCode);
        String token = response.data["token"]["access"];
        log(token);
        saveToSharedPreferences(token);
      } else {
        print('response: ${response.statusCode}, ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("${e.response?.data}");
      }
    }
  }
}
