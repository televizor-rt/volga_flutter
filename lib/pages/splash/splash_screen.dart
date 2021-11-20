import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE21A1A),
      body: Center(
        child: Stack(
          children: [
            Image.asset('assets/images/logo.png'),
            Positioned(
              bottom: 110,
              right: 55,
              child: SizedBox(
                width: 174.0,
                child: Image.asset('assets/images/delivery.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
