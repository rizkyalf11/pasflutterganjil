// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    required this.pgIdx, required this.label, required this.pgIdx2, required this.icon, this.onTap,
  });

  final int pgIdx;
  final String label;
  final int pgIdx2;
  final IconData icon;
  final void Function()? onTap;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: pgIdx == pgIdx2 ? Color(0xff0058AB) : Colors.black,),
          SizedBox(height: 6),
          Text(label, style: GoogleFonts.inter(
            color: pgIdx == pgIdx2 ? Color(0xff0058AB) :Color(0xff6C6C6C)
          ))
        ],
      ),
    );
  }
}