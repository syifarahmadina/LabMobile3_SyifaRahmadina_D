import 'package:flutter/material.dart';
import 'dart:math';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('About Seventeen'),
    backgroundColor: Colors.purple[900],
    ),
    body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
    return Transform.rotate(
    angle: _controller.value * 2 * pi,
    child: child,
    );
    },
    child: Container(
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.purple[400]!, width: 5),
    ),
      child: Text(
        'SVT',
        style: TextStyle(
          fontSize: 60,
          color: Colors.purple[900], // Tetap seperti ini, tapi tanpa const
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    ),
    const SizedBox(height: 20),
    const Text(
    'Seventeen is a 13-member South Korean boy group known for their passion, energy, and synchrony. Carats are their global fandom!',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 18, color: Colors.purple),
    ),
    const SizedBox(height: 20),
    ElevatedButton(
    onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
    content: Text('SVT and Carats are inseparable! 💎'),
    backgroundColor: Colors.purpleAccent,
    ),
    );
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.purple[400],
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    ),
    ),
    child: const Text(
    'Shine Bright with SVT!',
    style: TextStyle(fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    ),
    ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context); // Kembali ke halaman sebelumnya
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple[900],
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          'Back to Home',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
    ),
    ),
    );
  }
}
