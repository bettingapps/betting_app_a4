import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Color green = const Color(0xffADD039);
  static Color darkBlue = const Color(0xff113252);
  static Color grey = const Color(0xff3C4F5E);
  static BoxDecoration boxWithGradient = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xff2B7BC0),
        Color(0xff091D30),
      ],
    ),
  );

  static TextStyle h1Green = GoogleFonts.inder(
    fontWeight: FontWeight.w700,
    color: green,
    decoration: TextDecoration.none,
    fontSize: 36,
  );
  static TextStyle h1Red = GoogleFonts.inder(
    fontWeight: FontWeight.w700,
    color: Colors.red,
    decoration: TextDecoration.none,
    fontSize: 36,
  );
  static TextStyle h2White = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    decoration: TextDecoration.none,
    fontSize: 20,
  );
  static TextStyle h2Red = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: Colors.red,
    decoration: TextDecoration.none,
    fontSize: 20,
  );
  static TextStyle small15 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    decoration: TextDecoration.none,
    fontSize: 15,
  );
  static TextStyle small10 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    decoration: TextDecoration.none,
    fontSize: 10,
  );

  static TextStyle small15Green = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: green,
    decoration: TextDecoration.none,
    fontSize: 15,
  );
}
