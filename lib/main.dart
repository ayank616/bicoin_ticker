// import 'package:bicoin_ticker/screens/prices_screen.dart';
import 'package:bicoin_ticker/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: TickerSplashScreen(),
    );
  }
}
