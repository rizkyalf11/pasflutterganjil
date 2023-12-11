// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../color/rootv.dart';

class InCat extends StatelessWidget {
  const InCat({
    super.key,
    required this.selectAA, required this.title, required this.see,
  });

  final int selectAA;
  final String title;
  final int see;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: selectAA == see ? primary : Colors.white,
        border: Border.all(
          color: secondLine
        )
      ),
      child: Text(title, style: style(selectAA == see ? Colors.white : primaryText, 14, selectAA == see ? FontWeight.w500 : FontWeight.w400)),
    );
  }
}