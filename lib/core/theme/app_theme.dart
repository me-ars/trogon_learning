import 'package:flutter/material.dart';
import 'app_palette.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    scaffoldBackgroundColor: AppPalette.white,
    appBarTheme:  AppBarTheme(
      backgroundColor: AppPalette.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppPalette.litePurple,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppPalette.white),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.delius(
        color: AppPalette.prussianBlue,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.delius(
        color: AppPalette.prussianBlue,
        fontSize: 14,
        fontWeight: FontWeight.bold
      ),
      displayMedium: GoogleFonts.delius(
          color: AppPalette.grey,
          fontSize: 14,
          fontWeight: FontWeight.bold
      ),
      titleLarge: GoogleFonts.delius(
        color: AppPalette.prussianBlue,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),displayLarge:  GoogleFonts.delius(
      fontWeight: FontWeight.w600,
      color: AppPalette.prussianBlue,
      fontSize: 24,
    ),
    ),
  );
}

//Delius
//Akaya Kanadaka