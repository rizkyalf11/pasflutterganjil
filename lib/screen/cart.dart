// ignore_for_file: prefer_constructors_in_immutables, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors_in_immutables, sized_box_for_whitespace, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:uas_ikea/screen/wishlist.dart';
import '../color/rootv.dart';
import '../widget/cart_prod.dart';

String formatRupiah(int harga) {
  final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
  return currencyFormat.format(harga);
}

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _P1Count = 1;
  int _P1Price = 1350000;
  
  int _P2Count = 1;
  int _P2Price = 1499000;

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
            Text('Keranjang', style: style(primaryText, 18, FontWeight.w600),)
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.to(Wishlist()),
                  child: Icon(Iconsax.heart, size: 26, color: primaryText)
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 24, left: 24),
        child: Column(
          children: [
            Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('2', style: style(primaryText, 14, FontWeight.w600)),
                    Gap(3),
                    Text('Barang', style: style(secondText, 14, FontWeight.w400)),
                  ],
                ),

                Text('Hapus semua', style: style(primary, 14, FontWeight.w600))
              ],
            ),
            Gap(24),

            CProd(img: 'assets/w_rak.png', title: 'ALEX', desc: 'Unit laci, abu-abu toska, 36x70 cm', price: formatRupiah(_P1Price), count: _P1Count, onCountChanged: (newCount) {
              setState(() {
                _P1Count = newCount;
              });
            }),
            CProd(img: 'assets/rak_gantung.png', title: 'MACKAPÄR', desc: 'Kabinet/tempat sepatu, putih, 80x35x102 cm', price: formatRupiah(_P2Price), count: _P2Count, onCountChanged: (newCount) {
              setState(() {
                _P2Count = newCount;
              });
            },)
          ],
        ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total', style: style(secondText, 14, FontWeight.w400)),
                  Gap(6),
                  Text(formatRupiah((_P1Price * _P1Count) + (_P2Price * _P2Count)), style: style(primaryText, 20, FontWeight.w700)),
                ],
              ),

              Container(
                width: 180,
                height: 56,
                decoration: BoxDecoration(
                  color: primary
                ),
                child: TextButton(
                  onPressed: () {}, 
                  child: Text('Beli', style: style(Colors.white, 16, FontWeight.w600))
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}