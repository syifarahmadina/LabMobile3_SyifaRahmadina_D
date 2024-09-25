import 'package:flutter/material.dart';
import 'package:tugaspm3/seventeen_app/login_page.dart'; // Pastikan path ke file login_page benar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seventeen Fan App',
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Colors.purple[800]!, // Warna utama sesuai tema Seventeen
          primaryContainer: Colors.purple[200]!,
          secondary: Colors.pink[300]!, // Warna sekunder pink
          secondaryContainer: Colors.pink[100]!,
          background: Colors.white,
          surface: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onBackground: Colors.black,
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        fontFamily: 'Poppins', // Jika ingin menambahkan font unik
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(), // Mengarah ke splash screen sebelum login
    );
  }
}

// Splash screen sederhana sebelum ke halaman login
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800], // Warna latar sesuai tema
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome Carats!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
