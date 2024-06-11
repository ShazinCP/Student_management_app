import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/addscreen_provider.dart';
import 'package:student_management/helper/colors.dart';

Padding paymentType() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Consumer<AddScreenProvider>(
        builder: (context, provider, child) {
          return Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: cGreyColor,
                )),
            child: DropdownButtonFormField<String>(
              value: provider.selectedItem,
      
              onChanged: ((value) {
               provider.selectedPaymentType(value!);
              }),
              items: provider.items
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/payment_page/$e.png',
                              width: 30,
                              height: 30,
                            ),
                          cHeight10,
                            Text(
                              e,
                              style: const TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ))
                  .toList(),
      
              hint: const Text(
                'Select',
                style: TextStyle(color: cGreyColor,fontWeight: FontWeight.w500),
              ),
              dropdownColor: cWhiteColor,
              isExpanded: true,
            ));
        },
        
      ),
    );
  }
