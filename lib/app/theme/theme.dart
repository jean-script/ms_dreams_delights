import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms_dreams_delights/app/utils/hexcolor.dart';

class MyTheme {
  static Color positive = HexColor('#22C55E');
  static ThemeData get(BuildContext context) {
    return ThemeData(
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: HexColor("#B0EDEE"),
            surface: HexColor("#F3F4F6"),
            secondary: HexColor('#F582A1'),
          ),
      textTheme: GoogleFonts.getTextTheme('Kalam').copyWith(
        titleLarge: GoogleFonts.getTextTheme('Kalam').titleLarge?.copyWith(
              fontSize: 40,
              color: HexColor("#F582A1"),
              fontWeight: FontWeight.bold,
            ),
        titleMedium: GoogleFonts.getTextTheme('Kalam').titleLarge?.copyWith(
              fontSize: 24,
              color: HexColor("#F582A1"),
              fontWeight: FontWeight.bold,
            ),
        titleSmall: GoogleFonts.getTextTheme('Kalam').titleLarge?.copyWith(
              fontSize: 20,
              color: HexColor("#1C1C1C"),
              fontWeight: FontWeight.bold,
            ),
        labelLarge: GoogleFonts.getTextTheme('Kalam').labelMedium?.copyWith(
              fontSize: 20,
              color: HexColor("#475569"),
              fontWeight: FontWeight.bold,
            ),
        labelMedium: GoogleFonts.getTextTheme('Kalam').labelMedium?.copyWith(
              fontSize: 12,
              color: HexColor("#475569"),
              fontWeight: FontWeight.bold,
            ),
        labelSmall: GoogleFonts.getTextTheme('Kalam').labelMedium?.copyWith(
              fontSize: 12,
              color: HexColor("#1C1C1C"),
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
