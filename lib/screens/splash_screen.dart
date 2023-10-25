import 'package:bicoin_ticker/screens/prices_screen.dart';
import 'package:flutter/material.dart';

class TickerSplashScreen extends StatefulWidget {
  @override
  State<TickerSplashScreen> createState() => _TickerSplashScreenState();
}

class _TickerSplashScreenState extends State<TickerSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PriceScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "images/splash.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
