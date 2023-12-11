import 'package:flutter/material.dart';

import '../color/rootv.dart';

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: 1, color: secondLine, margin: const  EdgeInsets.symmetric(vertical: 24),);
  }
}