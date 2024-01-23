import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData createTheme() {
    return ThemeData.from(
      useMaterial3: false,
      colorScheme: const ColorScheme(
        // TODO: remove all Colors.fromRGBO from the code outside the theme
        brightness: Brightness.light,
        primary: Color.fromRGBO(224, 144, 144, 1),
        onPrimary: Color.fromRGBO(255, 255, 255, 1),
        secondary: Color.fromRGBO(199, 128, 128, 1),
        onSecondary: Colors.white,
        tertiary: Color.fromRGBO(64, 103, 171, 1),
        onTertiary: Color.fromRGBO(255, 255, 255, 1),
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        background: Colors.white,
        onSurface: Color.fromRGBO(128, 132, 143, 1),
        onBackground: Color.fromRGBO(128, 132, 143, 1),
      ),
    ).copyWith(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.asap(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      dividerTheme: const DividerThemeData(
        space: 2,
        color: Color.fromRGBO(151, 151, 151, 1),
        indent: 12,
        endIndent: 12,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          textStyle: MaterialStatePropertyAll(
            GoogleFonts.asap(
              fontWeight: FontWeight.w700,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
            ),
          ),
        ),
      ),
    );
  }
}
