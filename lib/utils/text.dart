import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ModifiedText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const ModifiedText({this.text = '', this.color = Colors.white,
    this.size = 0});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.roboto(color: color, fontSize: size));
  }
}