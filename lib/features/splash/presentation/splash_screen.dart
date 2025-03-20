import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.jpg'),
            SizedBox(height: 15),
            Text('NARAKISAH STUDIO', style: GoogleFonts.montserrat(
              fontSize: 25,fontWeight: FontWeight.bold,
            )
            ),
          ],
        ),
      ),
    );
  }
}
