// ignore_for_file: prefer_constructors_in_immutables, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors_in_immutables, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:uas_ikea/color/rootv.dart';

class HomeKo extends StatelessWidget {
  const HomeKo({
    super.key, required this.color, required this.img, required this.title, required this.desc,
  });

  final Color color;
  final String img;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(img),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(title, style: style(Colors.white, 16, FontWeight.w700))
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.only(right: 12, left: 12),
            child: Text(desc, style: style(Colors.white, 14, FontWeight.w400)),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}