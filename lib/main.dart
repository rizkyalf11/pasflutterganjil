// ignore_for_file: use_key_in_widget_constructors, annotate_overrides, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:uas_ikea/screen/detail.dart';
import 'package:uas_ikea/screen/home.dart';
import 'package:uas_ikea/main_screen.dart';
import 'package:uas_ikea/provider/main_screen_provider.dart';
import 'package:uas_ikea/tes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainScreenNotifier())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  
   Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}