import 'package:flutter/material.dart';
import 'package:newswatch/screens/signin.dart';
import 'package:newswatch/screens/signup.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/NewsWatch_Logo.png',
              height: 600,
              width: 350,
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: (() => {Get.to(SignInScreen())}),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.symmetric(vertical: 15)),
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 18),
                        ))),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: (() => {Get.to(SignUpScreen())}),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.symmetric(vertical: 15)),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
