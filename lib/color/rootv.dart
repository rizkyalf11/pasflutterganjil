import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primary = const Color(0xFF0058AB);
Color primaryText = const Color(0xFF1b1b1b);
Color secondText = const Color(0xFF6C6C6C);
Color brown = const Color(0xFF5E4238);
Color teal = const Color(0xFF4F707F);
Color white = const Color(0xffffffff);
Color secondLine = const Color(0xFFE7E7E7);

TextStyle style(Color color, double fs, FontWeight fw) {
  return GoogleFonts.inter(color: color, fontSize: fs, fontWeight: fw);
}