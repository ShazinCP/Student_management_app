import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/model/payments_model.dart';

class BusPaymentServices {
  final Dio _dio = Dio();
//----------------------postpayments----------------------
  Future<void> postBusPayment(requestData) async {
    String? token = await readToken();

    const url =
        "https://student-management-system-eojv.onrender.com/teacher/payment/";
    try {
      final response = await _dio.post(
        url,
        data: jsonEncode(requestData),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      //show success or not messege based on status
      if (response.statusCode == 201) {
        print('Bus Payment Post success: ${response.data}');
      } else {
        log('Updation failed with status code: ${response.statusCode}');
        print('Response body: ${response.data}');
        throw Exception('Update failed');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("Error: ${e.response?.data}");
      }
    }
  }

  //-------------------------------get payments transactions---------------
  Future<BusPaymentsModel?> fetchBusPayments(int studentId) async {
    String? token = await readToken();
    print("Token: $token");
    final url =
        'https://student-management-system-eojv.onrender.com/teacher/transactions/?user_id=$studentId';
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
        final BusPaymentsModel busPaymentsModel =
            BusPaymentsModel.fromJson(json);
        return busPaymentsModel;
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

  //-------------------delete payment Transactions-------------------
  Future<void> deleteTransaction(transactionId) async {
    String? token = await readToken();
    final url =
        'https://student-management-system-eojv.onrender.com/teacher/transactions/$transactionId/';
    final response = await _dio.delete(url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ));
    if (response.statusCode == 204) {
      print('delete success');
    } else {
      //error
      print('error');
    }
  }

  //-------------------edit transactions--------------
  Future<void> editBusTransaction(transactionId, requestData) async {
    String? token = await readToken();
    try {
      final url =
          "https://student-management-system-eojv.onrender.com/teacher/transactions/$transactionId/";
      final response = await _dio.put(
        url,
        data: jsonEncode(requestData),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        print('Updation success');
      } else {
        print('Response body: ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("${e.response?.data}");
      }
    }
  }
}
