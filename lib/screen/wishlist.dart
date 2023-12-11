// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../color/rootv.dart';
import '../widget/wishlist_prod.dart';
import 'cart.dart';

class ProdModel {
  final String img;
  final String title;
  final String desc;
  final String price;

  ProdModel(this.img, this.title, this.desc, this.price);
}

class Wishlist extends StatefulWidget {
  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  static List<ProdModel> list_prod = [
    ProdModel('assets/w_rak.png', 'ALEX', 'Unit laci, abu-abu toska, 36x70 cm', 'Rp1.350.000'),
    ProdModel('assets/w_kursi.png', 'MILLBERGET', 'Kursi putar, murum hitam', 'Rp1.799.000'),
    ProdModel('assets/w_kasur.png', 'SONGESAND', 'Rngk tmpt tdr dg 2 ktk penyimpanan, cokelat, 160x200 cm', 'Rp3.499.000'),
    ProdModel('assets/w_lampu.png', 'HEKTAR', 'Lampu lantai, abu-abu tua', 'Rp1.299.000'),
  ];

  List <ProdModel> display_prod = List.of(list_prod);

  void UpdateListProd(String val) {
    setState(() {
      display_prod = list_prod.where((element) => element.title.toLowerCase().contains(val.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        titleSpacing: 24,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('Wishlist', style: style(primaryText, 18, FontWeight.w600)),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.to(CartScreen()),
                  child: Icon(Iconsax.shopping_cart, color: primaryText, size: 26)
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: EdgeInsets.only(right: 24, left: 24),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    hintText: 'Cari Barang Di Wishlist',
                    hintStyle: style(secondText, 16, FontWeight.w400),
                    prefixIcon: Icon(Iconsax.search_normal),
                    prefixIconColor: primaryText,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: secondLine
                      ),
                    ),
                  ),
                  style: TextStyle(color: secondText),
                  onChanged: (value) {
                    UpdateListProd(value);
                  },
                ),
                Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('4', style: style(primaryText, 14, FontWeight.w600)),
                        Gap(3),
                        Text('Barang', style: style(secondText, 14, FontWeight.w400)),
                      ],
                    ),

                    Icon(Iconsax.sort, size: 20, color: primaryText,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 24, left: 24),
        child: Column(
          children: [
            Gap(24),

            Expanded(
              child: ListView.builder(
                itemCount: display_prod.length,
                itemBuilder: (context, index) => WProd(img: display_prod[index].img, title: display_prod[index].title, desc: display_prod[index].desc, price: display_prod[index].price),
              ),
            )
          ]
        ),
      ),
    );
  }
}