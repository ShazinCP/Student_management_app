import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_management/model/bus_payments_model.dart';
import 'package:student_management/services/bus_payment_services.dart';

class BusPaymentDetailsProvider extends ChangeNotifier{

TextEditingController amountController=TextEditingController();
 

  final formKey = GlobalKey<FormState>();

  String? selectedItem;


  final List<String> items = [
    'CASH',
    'UPI'
  ];

  void selectedPaymentType(String value) {
    selectedItem = value;
    notifyListeners();
  }
  
  BusPaymentServices busPaymentServices =BusPaymentServices();
      


 //-------------------------feaching bus payments-----------------
 BusPaymentsModel? _BusPayments;
  bool _isLoading = true;
  String? _errorMessage;

  BusPaymentsModel? get BusPayments => _BusPayments;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchBusPayments(int studentId) async {
    _isLoading = true;
    _errorMessage = null;
    try {
      _BusPayments = await busPaymentServices.fetchBusPayments(studentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }



 //---------------------add peyments-----------------
  Future<void> postBusPayment(studentId) async {
    print(studentId);
    Map<String, dynamic> requestData = {
      "student": studentId,
      "amount": amountController.text,
      "method": selectedItem
    };
   print(requestData);
    try {
      await busPaymentServices.postBusPayment(requestData);
      fetchBusPayments(studentId);
    } catch (e) {
      print('Error posting bus payment: $e');
      throw Exception('Update failed: $e');
    }
  }


//--------------------delete transaction-------------------------
  Future<void> deleteTransaction(memberId,studentId) async {
    await busPaymentServices.deleteTransaction(memberId);
    fetchBusPayments(studentId);
    notifyListeners();
  }
//---------------------edit bus transactions--------------------
  Future<void> editBusTransaction(studentId,transactionId) async {
    print(studentId);
    Map<String, dynamic> requestData = {
      "student": studentId,
      "amount": amountController.text,
      "method": selectedItem
    };
   print(requestData);
    try {
      await busPaymentServices.editBusTransaction(transactionId,requestData);
      fetchBusPayments(studentId);
    } catch (e) {
      print('Error posting bus payment: $e');
      throw Exception('Update failed: $e');
    }
  }

}