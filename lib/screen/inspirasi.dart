// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:uas_ikea/color/rootv.dart';

import '../widget/in_bl.dart';
import '../widget/in_cat.dart';
import 'cart.dart';

class Inspirasi extends StatefulWidget {

  @override
  State<Inspirasi> createState() => _InspirasiState();
}

class _InspirasiState extends State<Inspirasi> {
  int selectAA = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 75,
          titleSpacing: 24,
          elevation: 0,
          backgroundColor: Colors.white,
          shape: Border(
            bottom: BorderSide(
              color: secondLine
            ),
          ),
          title: Text('Temukan Inspirasi', style: style(primaryText, 18, FontWeight.w600)),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24),
              child: Row(
                children: [
                  Icon(Iconsax.notification, color: primaryText, size: 26),
                  Gap(16),
                  GestureDetector(
                    onTap: () => Get.to(CartScreen()),
                    child: Icon(Iconsax.shopping_cart, color: primaryText, size: 26,)
                  ),
                ],
              ),
            ),
          ],
          bottom: TabBar(
            padding: EdgeInsets.only(right: 60),
            indicatorColor: primary,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.5, color: primary),
              insets: EdgeInsets.symmetric(horizontal: 20.0),
            ),
            tabs: [
              Tab(
                child: Text(
                  'Inspirasi',
                  style: style(secondText, 16, FontWeight.w400)
                ),
              ),
              Tab(
                child: Text(
                  'Koleksi',
                  style: style(secondText, 16, FontWeight.w400)
                ),
              ),
              Tab(
                child: Text(
                  'Edukasi',
                  style: style(secondText, 16, FontWeight.w400)
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 24, left: 24, top: 24),
              child: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectAA = 1;
                            });
                          },
                          child: InCat(selectAA: selectAA, title: 'Semua', see: 1),
                        ),
                        Gap(16),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectAA = 2;
                            });
                          },
                          child: InCat(selectAA: selectAA, title: 'Ruang Kerja', see: 2),
                        ),
                        Gap(16),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectAA = 3;
                            });
                          },
                          child: InCat(selectAA: selectAA, title: 'Dapur', see: 3),
                        ),
                        Gap(16),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectAA = 4;
                            });
                          },
                          child: InCat(selectAA: selectAA, title: 'Ruang Keluarga', see: 4),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InBl(img: 'assets/i1.png', title: 'Hunian compact yang nyaman'),
                        InBl(img: 'assets/i2.png', title: 'Lakukan 5 hal ini agar sepatumu bebas ...'),
                      ],
                    ),
                  ),

                  Container(
                    child: Column(
                      children: [
                        Image.asset('assets/i3.png'),
                        Gap(16),
                        Text('Hadirkan nuasa elegant dan fancy kedalam kamar tidur anda', style: style(primaryText, 16, FontWeight.w600))
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InBl(img: 'assets/i4.png', title: 'Rumah lebih sehat dengan set tempat ...'),
                        InBl(img: 'assets/i5.png', title: 'Membuat kamar anak rapi jadi lebih mudah'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(child: Text('Koleksi')),
            Center(child: Text('Edukasi')),
          ],
        ),

      ),
    );
  }
}

