// ignore_for_file: prefer_constructors_in_immutables, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:uas_ikea/color/rootv.dart';

class HomePo extends StatelessWidget {
  const HomePo({
    super.key, required this.img, required this.title, required this.desc, required this.price,
  });

  final String img;
  final String title;
  final String desc;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 146,
            child: Image.asset(img),
          ),
          SizedBox(height: 12),
          Text(title, style: style(primaryText, 16, FontWeight.w600)),
          SizedBox(height: 6),
          Text(desc, style: style(secondText, 14, FontWeight.w400)),
          SizedBox(height: 12),
          Text(price, style: style(primaryText, 16, FontWeight.w600)),
        ],
      ),
    );
  }
}