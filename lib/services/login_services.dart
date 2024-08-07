import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:student_management/helper/readandset_token.dart';

class LoginServices {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> getToken(String userName, String password) async {
    try {
      String apiUrl = 'https://student-management-system-eojv.onrender.com/admins/login/';

      final Map<String, dynamic> requestData = {
        "username": userName,
        "password": password
      };

      Response response = await dio.post(apiUrl, data: requestData);

      if (response.statusCode == 200) {
        log("Response data: ${response.data}");

        String token = response.data["token"]["access"];
        log(token);
        saveToSharedPreferences(token);

        String role = response.data["token"]["role"] ?? '';

        return {
          'token': token,
          'role': role,
        };
      } else {
        log('response: ${response.statusCode}, ${response.statusMessage}');
        return {};
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("${e.response?.data}");
      }
      return {};
    }
  }
}
