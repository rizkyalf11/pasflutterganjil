// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../color/rootv.dart';

class ProfileCat extends StatelessWidget {
  const ProfileCat({
    super.key, required this.title, required this.ico,
  });

  final String title;
  final IconData ico;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(ico, size: 26, color: primaryText),
        Gap(16),
        Text(title, style: style(primaryText, 16, FontWeight.w500),)
      ],
    );
  }
}