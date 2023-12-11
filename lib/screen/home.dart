// ignore_for_file: prefer_constructors_in_immutables, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors_in_immutables, sized_box_for_whitespace, unused_field, prefer_final_fields, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uas_ikea/color/rootv.dart';
import 'package:uas_ikea/screen/cart.dart';
import 'package:uas_ikea/screen/detail.dart';
import 'package:uas_ikea/widget/home_cat.dart';

import '../widget/home_ko.dart';
import '../widget/home_po.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController = ScrollController();
  bool _showTextField = true;
  bool _showSearchIcon = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final double currentScroll = _scrollController.position.pixels;
    if (currentScroll > 20 && _showTextField) {
      setState(() {
        _showTextField = false;
        _showSearchIcon = true;
      });
    } else if (currentScroll <= 20 && !_showTextField) {
      setState(() {
        _showTextField = true;
        _showSearchIcon = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
              child: Container(
                width: 84,
                height: 33,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/ikea_logo.png'))),
              ),
            ),
            actions: <Widget>[
              if (_showSearchIcon)
                GestureDetector(
                  child:
                      Icon(Iconsax.search_normal, color: primaryText, size: 26),
                  onTap: () {
                    setState(() {
                      _showTextField = true;
                      _showSearchIcon = false;
                    });
                  },
                ),
              Gap(16),
              Icon(Iconsax.notification, color: primaryText, size: 26),
              Gap(16),
              Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(CartScreen());
                    },
                    child: Icon(Iconsax.shopping_cart,
                        color: primaryText, size: 26),
                  )),
            ],
            pinned: true,
            floating: true,
            expandedHeight: 150,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  title: _showTextField
                      ? Container(
                          height: 36,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: secondText),
                                      hintText: 'Cari barang impianmu',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffE7E7E7)),
                                      ),
                                      prefixIcon: Icon(
                                        Iconsax.search_normal,
                                        size: 20,
                                        color: primaryText,
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  centerTitle: true,
                );
              },
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 24, bottom: 24),
                      child: Image.asset('assets/banner1.png')),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeCat(
                              img: 'assets/k_tidur.png', title: 'Kamar Tidur'),
                          HomeCat(
                              img: 'assets/k_belajar.png',
                              title: 'Ruang Kerja'),
                          HomeCat(img: 'assets/k_dapur.png', title: 'Dapur'),
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeCat(img: 'assets/bayi.png', title: 'Bayi & Anak'),
                          HomeCat(img: 'assets/tekstil.png', title: 'Telstil'),
                          HomeCat(
                              img: 'assets/penyimpanan.png',
                              title: 'Penyimpanan'),
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24, bottom: 24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Produk Populer',
                                style: style(primaryText, 18, FontWeight.w600)),
                            Text('Lihat Semua',
                                style: style(primary, 14, FontWeight.w600)),
                          ],
                        ),
                        SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.to(Detail());
                                  },
                                  child: HomePo(
                                      img: 'assets/gantungan.png',
                                      title: 'KROKFJORDEN',
                                      desc: 'Pengait dengan plastik isap ...',
                                      price: 'Rp99.900')),
                              Gap(24),
                              HomePo(
                                  img: 'assets/meja.png',
                                  title: 'ALEX/LAGKAPTEN',
                                  desc: 'Meja, hijau muda/putih, 120x60 cm',
                                  price: 'Rp1.909.000'),
                              Gap(24),
                              HomePo(
                                  img: 'assets/lemari.png',
                                  title: 'FARDAL/PAX',
                                  desc:
                                      'Kombinasi lemari pakaian, putih/hig...',
                                  price: 'Rp8.400.000'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24, bottom: 24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Telusuri Koleksi Kami',
                                style: style(primaryText, 18, FontWeight.w600)),
                            Text('Lihat Semua',
                                style: style(primary, 14, FontWeight.w600)),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomeKo(
                              color: Color(0xff4F707F),
                              title: 'BLÅVINGAD',
                              desc:
                                  'Koleksi yang terinspirasi dari lautan untuk menciptakan ...',
                              img: 'assets/b1.png',
                            ),
                            HomeKo(
                              color: Color(0xff5E4238),
                              title: 'VINTERFINT',
                              desc:
                                  'Koleksi VINTERFINT hadir dengan warna dan pola indah ...',
                              img: 'assets/b2.png',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24, bottom: 24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Penawaran Terkini',
                                style: style(primaryText, 18, FontWeight.w600)),
                            Text('Lihat Semua',
                                style: style(primary, 14, FontWeight.w600)),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 175,
                                color: Color(0xff4F707F),
                                child: Image.asset('assets/p1.png')),
                            Container(
                                width: 175,
                                color: Color(0xff5E4238),
                                child: Image.asset('assets/p2.png')),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ]))
        ],
      ),
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //     toolbarHeight: 75,
      //     titleSpacing: 24,
      //     elevation: 0,
      //     backgroundColor: Colors.white,
      //     shape: Border(
      //       bottom: BorderSide(
      //         color: secondLine
      //       ),
      //     ),
      //     title: Image.asset('assets/ikea_logo.png', width: 90,),
      //     actions: [
      //       Padding(
      //         padding: EdgeInsets.only(right: 24),
      //         child: Row(
      //           children: [
      //             Icon(Iconsax.search_normal, color: primaryText, size: 26),
      //             Gap(16),
      //             Icon(Iconsax.notification, color: primaryText, size: 26),
      //             Gap(16),
      //             GestureDetector(
      //               onTap: () => Get.to(CartScreen()),
      //               child: Icon(Iconsax.shopping_cart, color: primaryText, size: 26)
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],

      //   ),

      // body: ListView(
      //   padding: EdgeInsets.symmetric(horizontal: 24),
      //   children: [
      //     Container(
      //       margin: EdgeInsets.only(top: 24, bottom: 24),
      //       child: Image.asset('assets/banner1.png')
      //     ),

      //     Column(
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             HomeCat(img: 'assets/k_tidur.png', title: 'Kamar Tidur'),
      //             HomeCat(img: 'assets/k_belajar.png', title: 'Ruang Kerja'),
      //             HomeCat(img: 'assets/k_dapur.png', title: 'Dapur'),
      //           ],
      //         ),

      //         SizedBox(height: 24),

      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             HomeCat(img: 'assets/bayi.png', title: 'Bayi & Anak'),
      //             HomeCat(img: 'assets/tekstil.png', title: 'Telstil'),
      //             HomeCat(img: 'assets/penyimpanan.png', title: 'Penyimpanan'),
      //           ],
      //         )
      //       ],
      //     ),

      //     Container(
      //       margin: EdgeInsets.only(top: 24, bottom: 24),
      //       child: Column(
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text('Produk Populer', style: style(primaryText, 18, FontWeight.w600)),
      //               Text('Lihat Semua', style: style(primary, 14, FontWeight.w600)),
      //             ],
      //           ),

      //           SizedBox(height: 16),

      //           SingleChildScrollView(
      //             scrollDirection: Axis.horizontal,
      //             child: Row(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 GestureDetector(
      //                   onTap: () {
      //                     Get.to(Detail());
      //                   },
      //                   child: HomePo(img: 'assets/gantungan.png', title: 'KROKFJORDEN', desc: 'Pengait dengan plastik isap ...', price: 'Rp99.900')
      //                 ),
      //                 Gap(24),
      //                 HomePo(img: 'assets/meja.png', title: 'ALEX/LAGKAPTEN', desc: 'Meja, hijau muda/putih, 120x60 cm', price: 'Rp1.909.000'),
      //                 Gap(24),
      //                 HomePo(img: 'assets/lemari.png', title: 'FARDAL/PAX', desc: 'Kombinasi lemari pakaian, putih/hig...', price: 'Rp8.400.000'),
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),

      //     Container(
      //       margin: EdgeInsets.only(top: 24, bottom: 24),
      //       child: Column(
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text('Telusuri Koleksi Kami', style: style(primaryText, 18, FontWeight.w600)),
      //               Text('Lihat Semua', style: style(primary, 14, FontWeight.w600)),
      //             ],
      //           ),

      //           SizedBox(height: 16),

      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               HomeKo(color: Color(0xff4F707F), title: 'BLÅVINGAD', desc: 'Koleksi yang terinspirasi dari lautan untuk menciptakan ...', img: 'assets/b1.png',),
      //               HomeKo(color: Color(0xff5E4238), title: 'VINTERFINT', desc: 'Koleksi VINTERFINT hadir dengan warna dan pola indah ...', img: 'assets/b2.png',),
      //             ],
      //           )
      //         ],
      //       ),
      //     ),

      //     Container(
      //       margin: EdgeInsets.only(top: 24, bottom: 24),
      //       child: Column(
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text('Penawaran Terkini', style: style(primaryText, 18, FontWeight.w600)),
      //               Text('Lihat Semua', style: style(primary, 14, FontWeight.w600)),
      //             ],
      //           ),

      //           SizedBox(height: 16),

      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Container(
      //                 width: 175,
      //                 color: Color(0xff4F707F),
      //                 child: Image.asset('assets/p1.png')
      //               ),
      //               Container(
      //                 width: 175,
      //                 color: Color(0xff5E4238),
      //                 child: Image.asset('assets/p2.png')
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
