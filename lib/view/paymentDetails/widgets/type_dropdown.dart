import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controller/paymentdetails_provider.dart';
import 'package:student_management/helper/colors.dart';

Padding paymentType() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Consumer<BusPaymentDetailsProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          width: 300,
          child: FormField<String>(
            validator: (value) {
              if (provider.selectedItem == null) {
                return 'Please select a payment type';
              }
              return null;
            },
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  errorText: state.errorText,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 2, color: cGreyColor),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: provider.selectedItem,
                    onChanged: (value) {
                      state.didChange(value);
                      provider.selectedPaymentType(value!);
                    },
                    items: provider.items.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/payment_page/$e.png',
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              e,
                              style: const TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                    hint: const Text(
                      'Select',
                      style: TextStyle(color: cGreyColor, fontWeight: FontWeight.w500),
                    ),
                    dropdownColor: cWhiteColor,
                    isExpanded: true,
                  ),
                ),
              );
            },
          ),
        );
      },
    ),
  );
}
