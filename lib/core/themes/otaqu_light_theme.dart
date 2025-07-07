import 'package:flutter/material.dart';
import 'package:rama_otaqu/core/themes/app_colors_theme.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData otaquLightTheme = ThemeData(
  primaryColor: AppColorsTheme.pink,
  scaffoldBackgroundColor: AppColorsTheme.offWhite,
  fontFamily: 'Nunito',
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColorsTheme.pink,
    onPrimary: Colors.white,
    secondary: AppColorsTheme.yellow,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: AppColorsTheme.offWhite,
    onSurface: AppColorsTheme.darkGray,
  ),
  textTheme: GoogleFonts.nunitoTextTheme(),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorsTheme.pink,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColorsTheme.pink,
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);
