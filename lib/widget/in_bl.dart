// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uas_ikea/color/rootv.dart';

class InBl extends StatelessWidget {
  const InBl({
    super.key, required this.img, required this.title,
  });

  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(img),
          Gap(16),
          Text(title, style: style(primaryText, 16, FontWeight.w600))
        ]
      ),
    );
  }
}