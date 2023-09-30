import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newswatch/screens/auth_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 1, milliseconds: 500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()),
      ),
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/NewsWatch_Logo.png',
                  height: 90,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "All type of news from all trusted sources for all\n type of people",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
