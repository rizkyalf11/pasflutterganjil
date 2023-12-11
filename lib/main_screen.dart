// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_ikea/screen/home.dart';
import 'package:uas_ikea/screen/inspirasi.dart';
import 'package:uas_ikea/provider/main_screen_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uas_ikea/screen/profile.dart';
import 'package:uas_ikea/screen/wishlist.dart';
import 'package:uas_ikea/shared/bottom_nav_widget.dart';

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pageList = [
    Home(),
    Inspirasi(),
    Wishlist(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(),
            child: Container(
              height: 65,
              padding: EdgeInsets.only(right: 24, left: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.black.withOpacity(.1)
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavWidget(pgIdx: mainScreenNotifier.pageIndex, icon: Iconsax.home, label: 'Beranda', pgIdx2: 0, onTap: () {
                    mainScreenNotifier.pageIndex = 0;
                  }),
                  BottomNavWidget(pgIdx: mainScreenNotifier.pageIndex, icon: Iconsax.coffee, label: 'Inspirasi', pgIdx2: 1, onTap: () {
                    mainScreenNotifier.pageIndex = 1;
                  }),
                  BottomNavWidget(pgIdx: mainScreenNotifier.pageIndex, icon: Iconsax.heart, label: 'Wishlist', pgIdx2: 2, onTap: () {
                    mainScreenNotifier.pageIndex = 2;
                  }),
                  BottomNavWidget(pgIdx: mainScreenNotifier.pageIndex, icon: Iconsax.profile_circle, label: 'Profile', pgIdx2: 3, onTap: () {
                    mainScreenNotifier.pageIndex = 3;
                  }),
                ],
              ),
            ),
          )
        );
      },
    );
  }
}