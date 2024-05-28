import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/paymentdetails_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/paymentDetails/widgets/amountfield.dart';
import 'package:student_management/view/paymentDetails/widgets/datefield.dart';
import 'package:student_management/view/paymentDetails/widgets/type_dropdown.dart';

class AlertBoxWidget extends StatelessWidget {
  const AlertBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Consumer<PaymentDetailsProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                cHeight25,
                amount(),
                cHeight20,
                paymentType(),
                cHeight20,
                dateTime(),
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
          );
        },
      ),
    );
  }
}
