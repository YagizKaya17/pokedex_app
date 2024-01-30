import 'package:flutter/material.dart';
import 'package:pokedex_app/Themes/app_theme.dart';
import 'package:pokedex_app/pages/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
