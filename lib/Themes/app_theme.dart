import 'package:flutter/material.dart';
import 'package:pokedex_app/Themes/text_theme.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(),
  scaffoldBackgroundColor:const  Color(0xFFEBFFFB),
  textTheme: lightTextTheme,
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    surfaceTintColor: Colors.transparent,
    color: Colors.red,
  ),
  cardTheme: const CardTheme(
    elevation: 3,
    surfaceTintColor: Colors.transparent
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(),
  appBarTheme: const AppBarTheme(
    centerTitle: false
  ),
);