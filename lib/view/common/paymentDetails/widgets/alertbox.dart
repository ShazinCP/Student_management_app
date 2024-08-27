import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/paymentdetails_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/common/paymentDetails/widgets/amountfield.dart';

class AlertBoxWidget extends StatelessWidget {
  final int studentId;
  final formKey = GlobalKey<FormState>();

  AlertBoxWidget({
    super.key,
    required this.studentId,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Consumer<BusPaymentDetailsProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  cHeight25,
                  amount(),
                  cHeight20,
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
                          if (formKey.currentState!.validate()) {
                            // Validation: Check if the paid amount matches the total amount
                            final totalAmount = provider.BusPayments?.busService?.annualFees ?? 0;
                            final paidAmount = provider.BusPayments?.paidAmount ?? 0;

                            if (paidAmount >= totalAmount) {
                              // Show a message to the user
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('The total amount has already been paid.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return; // Do not proceed further
                            }

                            // Proceed with posting the payment
                            await provider.postBusPayment(studentId);
                            Navigator.pop(context);
                            provider.amountController.clear();
                            provider.selectedItem = null;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Transaction added successfully.'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to add transaction.'),
                                backgroundColor: Colors.red,
                              ),
                            );
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
