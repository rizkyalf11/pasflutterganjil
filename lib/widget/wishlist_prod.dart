// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../color/rootv.dart';

class WProd extends StatelessWidget {
  const WProd({
    super.key, required this.img, required this.title, required this.desc, required this.price,
  });

  final String img;
  final String title;
  final String desc;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(img),
        Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: style(primaryText, 16, FontWeight.w600)),
                        Gap(6),
                        Text(desc, style: style(secondText, 14, FontWeight.w400)),
                        Gap(12),
                        Text(price, style: style(primaryText, 16, FontWeight.w600)),
                        Gap(12),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Icon(Icons.more_vert, color: primaryText, size: 26,),
                  )
                ]
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: primary,
                          width: 1
                        )
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Tambah ke Keranjang', style: style(primary, 14, FontWeight.w500)),
                      ),
                    )
                  )
                ],
              ),
              Gap(24),
            ],
          ),
        ),
      ],
    );
  }
}