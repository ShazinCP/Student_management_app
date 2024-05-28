import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controller/studentlist_provider.dart';
import 'package:student_management/helper/colors.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Consumer<StudenListProvider>(
        builder: (context, provider, child) {
          return TextField(
            controller: provider.searchController,
            style: const TextStyle(color: cBlackColor),
            cursorColor: cPrimaryColor,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(
                    color: cBlackColor,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(
                      color: cBlackColor,
                    )),
                fillColor: cWhiteColor,
                filled: true,
                hintText: 'Search Student...',
                hintStyle: TextStyle(
                  color: cGreyColorWithShade700,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  size: 22,
                  color: cGreyColorWithShade700,
                ),
                suffixIcon: Icon(
                  CupertinoIcons.clear,
                  size: 19,
                  color: cGreyColorWithShade700,
                )),
          );
        },
      ),
    );
  }
}
