import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 97, 78, 78));

final theme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.montserratTextTheme().copyWith(
    titleLarge: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    bodySmall: GoogleFonts.montserrat(
      fontSize: 12,
    ),
  ),
);
