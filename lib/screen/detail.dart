// ignore_for_file: prefer_constructors_in_immutables, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors_in_immutables, sized_box_for_whitespace, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../color/rootv.dart';
import '../widget/detail_mo.dart';
import 'cart.dart';

class Detail extends StatefulWidget {
  Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isActive = true;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        titleSpacing: 24,
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        shape: Border(
          bottom: BorderSide(
            color: secondLine
          ),
        ),
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Iconsax.arrow_left, size: 26, color: primaryText)
            ),
            Gap(16),
            Text('ALEX/LAGKAPTEN', style: style(primaryText, 18, FontWeight.w600),)
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Row(
              children: [
                Icon(Iconsax.search_normal, size: 26, color: primaryText),
                Gap(16),
                Icon(Iconsax.share, size: 26, color: primaryText),
                Gap(16),
                GestureDetector(
                    onTap: () => Get.to(CartScreen()),
                  child: Icon(Iconsax.shopping_cart, size: 26, color: primaryText)
                ),
              ],
            ),
          )
        ],
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 16),
            child: Image.asset('assets/d_prod.png')
          ),

          Container(
            margin: EdgeInsets.only(bottom: 24),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DetailMo(img: 'assets/d_meja.png'),
                  Gap(16),
                  DetailMo(img: 'assets/d_papan.png'),
                  Gap(16),
                  DetailMo(img: 'assets/d_rak.png'),
                  Gap(16),
                  DetailMo(img: 'assets/d_tiang.png'),
                  Gap(16),
                  DetailMo(img: 'assets/d_prod.png'),
                ],
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ALEX/LAGKAPTEN', style: style(primaryText, 20, FontWeight.w600)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
                child: SizedBox(
                  width: 26,
                  height: 26,
                  child: isActive ? Image.asset('assets/actheart.png') : Icon(Iconsax.heart, size: 26, color: primaryText),
                ),
              )
            ],
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            child: Text('Meja, hijau muda/putih, 120x60 cm', style: style(secondText, 16, FontWeight.w400)),
          ),

          Text('Rp1.909.000', style: style(primaryText, 24, FontWeight.w700)),

          Container(
            margin: EdgeInsets.only(top: 12, bottom: 24),
            child: Row(
              children: [
                Row(
                  children: [
                    Image.asset('assets/star.png'),
                    Image.asset('assets/star.png'),
                    Image.asset('assets/star.png'),
                    Image.asset('assets/star.png'),
                    Image.asset('assets/star.png'),
                  ],
                ),
                SizedBox(width: 6),
                Text('4.5 | Terjual 116', style: style(secondText, 14, FontWeight.w400))
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 24),
            child: Text('Ruang terbatas bukan berarti Anda harus menolak belajar atau bekerja dari rumah. Meja ini memakan sedikit ruang lantai namun masih memiliki unit laci tempat Anda dapat menyimpan kertas dan barang penting lainnya.', style: style(primaryText, 16, FontWeight.w400), textAlign: TextAlign.justify),
          )
        ],
      ),

      bottomNavigationBar: SizedBox(
        height: 100,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: secondLine
              )
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 127,
                height: 56,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: secondLine
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(counter > 1) {
                            counter -= 1;
                          }
                        });
                      },
                      child: Icon(Iconsax.minus)
                    ),
                    Text('${counter}', style: style(primaryText, 16, FontWeight.w600)),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          counter += 1;
                        });
                      },
                      child: Icon(Iconsax.add, color: primary)
                    ),
                  ],
                ),
              ),

              Container(
                width: 224,
                height: 56,
                decoration: BoxDecoration(
                  color: primary
                ),
                child: TextButton(
                  onPressed: () {}, 
                  child: Text('Tambah Ke Keranjang', style: style(Colors.white, 16, FontWeight.w600))
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}