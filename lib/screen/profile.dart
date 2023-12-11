// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uas_ikea/widget/profile_cat.dart';

import '../color/rootv.dart';
import '../widget/line.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        titleSpacing: 24,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Menu Akun', style: style(primaryText, 18, FontWeight.w600)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Row(
              children: [
                Icon(Iconsax.setting, color: primaryText, size: 26),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 24, left: 24, top: 0),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/barcode.png'),
              Gap(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rizqi Fatur', style: style(primaryText, 16, FontWeight.w600),),
                  Gap(6),
                  Text('160002359102020', style: style(secondText, 14, FontWeight.w400),)
                ],
              )
            ],
          ),

          Line(),
          ProfileCat(title: 'Profil Saya', ico: Iconsax.profile_circle),
          Line(),
          ProfileCat(title: 'Pesanan', ico: Iconsax.box),
          Line(),
          ProfileCat(title: 'Ulasan', ico: Iconsax.star),
          Line(),
          ProfileCat(title: 'Reward Saya', ico: Iconsax.gift),
          Line(),
          ProfileCat(title: 'Bantuan', ico: Iconsax.information),
          Line(),
        ],
      )
    );
  }
}



