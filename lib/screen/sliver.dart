
// ignore_for_file: unused_import, prefer_final_fields, prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../color/rootv.dart';

class BodyBeranda extends StatefulWidget {
  const BodyBeranda({super.key});

  @override
  State<BodyBeranda> createState() => _BodyBerandaState();
}

class _BodyBerandaState extends State<BodyBeranda> {
  bool _showTextField = true;
  bool _showSearchIcon = true;
  ScrollController _scrollController = ScrollController();

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
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(left: 24, top: 12),
              child: Container(
                width: 84,
                height: 33,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('logo.png'),
                )),
              ),
            ),
            actions: <Widget>[
              if (_showSearchIcon)
                IconButton(
                  icon: Icon(
                    LucideIcons.search,
                    color: primaryText,
                  ),
                  onPressed: () {
                    setState(() {
                      _showTextField = true;
                      _showSearchIcon = false;
                    });
                  },
                ),
              Gap(24),
              IconButton(
                icon: Icon(
                  LucideIcons.bell,
                  color: primaryText,
                ),
                onPressed: () {},
              ),
              Gap(24),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: IconButton(
                  icon: Icon(
                    LucideIcons.shoppingCart,
                    color: primaryText,
                  ),
                  onPressed: () {
                    
                  },
                ),
              ),
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
                                        LucideIcons.search,
                                        size: 24,
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
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Column(
                children: [
                  _Banner(),
                  SizedBox(
                    height: 24,
                  ),
                  _kategori(context),
                  SizedBox(
                    height: 48,
                  ),
                  _Action(),
                  SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _FavProduct(),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  _Action1(),
                  SizedBox(
                    height: 16,
                  ),
                  _Collection(),
                  SizedBox(
                    height: 48,
                  ),
                  _Action2(),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/Rectangle 21.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          'assets/Rectangle 22.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }

  SingleChildScrollView _Collection() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                  width: 183,
                  height: 232,
                  decoration: BoxDecoration(color: Color(0xff4F707F)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/Rectangle 19.png',
                        width: 183,
                        height: 119,
                        alignment: Alignment.topCenter,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'BLÅVINGAD',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Koleksi yang\nterinspirasi dari lautan\nuntuk menciptakan ...',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 1.6),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          Column(
            children: [
              Container(
                  width: 183,
                  height: 232,
                  decoration: BoxDecoration(color: Color(0xff5E4238)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/Rectangle 21.png',
                        width: 183,
                        height: 119,
                        alignment: Alignment.topCenter,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'VINTERFINT',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Koleksi VINTERFINT\nhadir dengan warna\ndan pola indah ...',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 1.6),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Padding _FavProduct() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _itemFavProduct(
            'assets/Rectangle 15.png',
            'KROKFJORDEN',
            'Pengait dengan plastik isap...',
            99900,
          ),
          SizedBox(width: 24),
          _itemFavProduct(
            'assets/Rectangle 16.png',
            'ALEX/LAGKAPTEN',
            'Meja, hijau muda/putih, 120x60 cm',
            1909000,
          ),
          SizedBox(
            width: 24,
          ),
          _itemFavProduct(
            'assets/Rectangle 17.png',
            'FARDAL/PAX',
            'Kombinasi lemari pakaian, putih/hig...',
            8400000,
          ),
        ],
      ),
    );
  }

  GestureDetector _itemFavProduct(
      String img, String text, String subText, int harga) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) {
        //     return detailPage(
        //       img: img,
        //       text: text,
        //       subtext: subText,
        //       harga: harga,
        //     );
        //   },
        // ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset(
              img,
              height: 146,
              width: 146,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            text,
            style: TextStyle(
              color: primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 120,
            child: Text(
              subText,
              style: TextStyle(
                color: secondText,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            NumberFormat.currency(
                    locale: 'id_ID', symbol: 'Rp.', decimalDigits: 0)
                .format(harga)
                .toString(),
            style: TextStyle(
                color: primaryText, fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Padding _Action() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Produk Populer',
            style: TextStyle(
                color: primaryText, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            'Lihat Semua',
            style: TextStyle(
                color: primary, fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Padding _Action1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Telusuri Koleksi Kami',
            style: TextStyle(
                color: primaryText, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            'Lihat Semua',
            style: TextStyle(
                color: primary, fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Padding _Action2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Penawaran Terkini',
            style: TextStyle(
                color: primaryText, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            'Lihat Semua',
            style: TextStyle(
                color: primary, fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Center _kategori(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: widthScreen,
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('kasur.png'),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Kamar Tidur',
                  style: TextStyle(
                      color: primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/Rectangle 6.png'),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Ruang Kerja',
                  style: TextStyle(
                      color: primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/Rectangle 7.png'),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Dapur',
                  style: TextStyle(
                      color: primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/Rectangle 8.png'),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Bayi & Anak',
                  style: TextStyle(
                      color: primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/Rectangle 9.png'),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Tekstil',
                  style: TextStyle(
                      color: primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/Rectangle 10.png'),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Penyimpanan',
                  style: TextStyle(
                      color: primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center _Banner() {
    return Center(
      child: Container(
        width: 425,
        height: 280,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/banner.png'), fit: BoxFit.cover)),
      ),
    );
  }
}