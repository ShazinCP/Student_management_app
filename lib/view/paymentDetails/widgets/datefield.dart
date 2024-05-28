import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controller/addscreen_provider.dart';
import 'package:student_management/helper/colors.dart';

Container dateTime() {
  return Container(
    alignment: Alignment.bottomLeft,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: cGreyColor)),
    height: 50,
    width: 232,
    child: Consumer<AddScreenProvider>(
      builder: (context, provider, child) {
        return Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100));
          
              if (newDate == null) {
                return;
              } else {
                provider.setDate(newDate);
              }
            },
            child: Text(
              'Date : ${provider.date.year}/${provider.date.month}/${provider.date.day}',
              style: const TextStyle(fontSize: 16, color: cBlackColor),
            ),
          ),
        );
      },
    ),
  );
}