import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kThemeColor = Color(0xffFF5F8F);

class Themeing {
  static const Color primaryColor = Color(0xffEC0055);
  static const Color themeColor = Color(0xffFF924C);

  static ThemeData lightTheme = ThemeData(
      listTileTheme: ListTileThemeData(
        selectedColor: Colors.white.withOpacity(0.8),
        textColor: Colors.white.withOpacity(0.8),
      ),
      textTheme: TextTheme(
        displayMedium: TextStyle(
            fontFamily: GoogleFonts.nunito().fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white),
        bodyLarge: TextStyle(
            fontFamily: GoogleFonts.nunito().fontFamily,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.white10),
        bodyMedium: TextStyle(
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: const Color(0xff818181),
        ),
        bodySmall: TextStyle(
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0xff818181),
        ),
        labelMedium: TextStyle(
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        labelSmall: TextStyle(
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ));
}
