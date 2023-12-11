// ignore_for_file: prefer_constructors_in_immutables, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:uas_ikea/color/rootv.dart';

class HomeCat extends StatelessWidget {
  const HomeCat({
    super.key, required this.img, required this.title,
  });

  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(img),
        SizedBox(height: 6),
        Text(title, style: style(primaryText, 14, FontWeight.w600))
      ],
    );
  }
}