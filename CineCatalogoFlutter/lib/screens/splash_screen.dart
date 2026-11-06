import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF24134A), Color(0xFF10101A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF7C3AED).withOpacity(0.18),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.movie_creation_outlined,
                  size: 76, color: Color(0xFFC4B5FD)),
            ),
            const SizedBox(height: 24),
            const Text(
              'CineCatálogo',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Descubre tu próxima película favorita',
                style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 36),
            const CircularProgressIndicator(color: Color(0xFFC4B5FD)),
          ],
        ),
      ),
    );
  }
}
