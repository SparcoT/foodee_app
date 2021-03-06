import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static final secondaryTextTheme = GoogleFonts.pacifico();

  static const primaryColor = Color(0xff7C37A6);
  static const secondaryColor = Color(0xff323232);
  static final primaryButtonTheme = TextButton.styleFrom(
    shape: StadiumBorder(),
    primary: primaryColor,
    onSurface: primaryColor,
    backgroundColor: Colors.white,
    minimumSize: Size.fromHeight(50),
    textStyle: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
  );

  static final data = ThemeData(
    primaryColor: primaryColor,
  );
}
