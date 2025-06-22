// lib/main.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/ClanListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Naruto Clans',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orangeAccent,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF101010),
          elevation: 0,
          titleTextStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF2C2C2C),
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(textTheme).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: const Color(0xFF2C2C2C),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.orangeAccent,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.orangeAccent,
        ),
      ),
      // A home agora chama a tela que criamos
      home: const ClanListScreen(),
    );
  }
}