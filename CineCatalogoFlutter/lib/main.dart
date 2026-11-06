import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const CineCatalogoApp());
}

class CineCatalogoApp extends StatelessWidget {
  const CineCatalogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineCatálogo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7C3AED),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF10101A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF10101A),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
