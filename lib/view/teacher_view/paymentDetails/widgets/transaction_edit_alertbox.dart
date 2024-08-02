import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/paymentdetails_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/teacher_view/paymentDetails/widgets/amountfield.dart';
import 'package:student_management/view/teacher_view/paymentDetails/widgets/type_dropdown.dart';

class TransactionEditAlertBox extends StatefulWidget {
  final int studentId;
  final String amount;
  final String transactionType;
  final int transactionId;


  const TransactionEditAlertBox({
    super.key,
    required this.studentId,
    required this.amount,
    required this.transactionType,
    required this.transactionId,
  });

  @override
  State<TransactionEditAlertBox> createState() =>
      _TransactionEditAlertBoxState();
}

class _TransactionEditAlertBoxState extends State<TransactionEditAlertBox> {
  @override
  void initState() {

    final buspaymentPro =
        Provider.of<BusPaymentDetailsProvider>(context, listen: false);
    buspaymentPro.amountController.text = widget.amount;
    buspaymentPro.selectedItem = widget.transactionType;

    super.initState();
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Consumer<BusPaymentDetailsProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  cHeight25,
                  amount(),
                  cHeight20,
                  paymentType(),
                  cHeight20,
                  // dateTime(),
                  cHeight27,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: cPrimaryColor,
                          ),
                          width: 120,
                          height: 40,
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'f',
                              fontWeight: FontWeight.w600,
                              color: cWhiteColor,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            await provider.editBusTransaction(
                                widget.studentId, widget.transactionId);
                            Navigator.pop(context);
                            provider.amountController.clear();
                            provider.selectedItem = null;
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: cPrimaryColor,
                          ),
                          width: 120,
                          height: 40,
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontFamily: 'f',
                              fontWeight: FontWeight.w600,
                              color: cWhiteColor,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  cHeight20,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
