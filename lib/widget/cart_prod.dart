// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import '../color/rootv.dart';

class CProd extends StatelessWidget {
  const CProd({
    super.key, required this.img, required this.title, required this.desc, required this.price, required this.count, required this.onCountChanged,
  });

  final String img;
  final String title;
  final String desc;
  final String price;
  final int count;
  final Function(int) onCountChanged;

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
              Text(title, style: style(primaryText, 16, FontWeight.w600)),
              Gap(6),
              Text(desc, style: style(secondText, 14, FontWeight.w400)),
              Gap(12),
              Text(price, style: style(primaryText, 16, FontWeight.w600)),
              Gap(12),
              
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: secondLine,
                          width: 1
                        )
                      ),
                      child: Icon(Iconsax.trash, size: 20, color: primaryText,)
                    )
                  ),
                  Gap(16),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: secondLine,
                          width: 1
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if(count > 1) {
                                onCountChanged(count - 1);
                              }
                            },
                            child: Icon(Iconsax.minus, size: 20, color: Color(0xffB4B4B4),)
                          ),
                          Text(count.toString(), style: style(primary, 14, FontWeight.w500),),
                          GestureDetector(
                            onTap: () {
                              onCountChanged(count  + 1);
                            },
                            child: Icon(Iconsax.add, size: 20, color: primary)
                          ),
                        ],
                      )
                    )
                  ),
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