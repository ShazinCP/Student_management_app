import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_management/helper/colors.dart';

Widget buildListShimmerEffect() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.white38,
          child: Card(
            color: cPrimaryColor,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              title: Container(
                width: double.infinity,
                height: 10.0,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
        );
      },
    );
  }