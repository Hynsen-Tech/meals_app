import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meals App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green.shade700,
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.green[700],
            foregroundColor: Colors.white,
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        darkTheme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.latoTextTheme().copyWith(),
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green.shade900,
          ),
          scaffoldBackgroundColor: Colors.grey[900],
          appBarTheme: AppBarTheme(
            color: Colors.green.shade900,
            foregroundColor: Colors.white,
          ),
        ),
        home: const TabsScreen());
  }
}
