// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DetailMo extends StatelessWidget {
  const DetailMo({
    super.key, required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: Image.asset(img, fit: BoxFit.cover,),
    );
  }
}