import 'package:flutter/material.dart';
import 'package:labil_video_editing/features/splash/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'NARAKISAH',
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: SplashScreen(),
    );
  }
}
