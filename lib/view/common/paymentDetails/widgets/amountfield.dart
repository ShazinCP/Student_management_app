import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controller/paymentdetails_provider.dart';
import 'package:student_management/helper/colors.dart';

Padding amount() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Consumer<BusPaymentDetailsProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          width: 300,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Select Amount';
              } else if (value.contains(',')) {
                return 'Please remove special character';
              } else if (value.contains('.')) {
                return 'Please remove special character';
              } else if (value.contains(' ')) {
                return 'Please Enter a valid number';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.number,
              controller: provider.amountController,
              onChanged: (value) {
              // Check if the value ends with .00 and remove it
              if (value.endsWith('.00')) {
                provider.amountController.text = value.substring(0, value.length - 3);
                // Move the cursor to the end of the text
                provider.amountController.selection = TextSelection.fromPosition(
                  TextPosition(offset: provider.amountController.text.length),
                );
              }
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              labelText: 'Amount',
              labelStyle: const TextStyle(fontSize: 15, color: cGreyColor,fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: cBlackColor),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 2, color: cGreyColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: cPrimaryColor)),
            ),
          ),
        );
      },
    ),
  );
}