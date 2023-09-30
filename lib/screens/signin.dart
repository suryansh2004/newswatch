import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswatch/Widgets/bottom_navigator.dart';
import 'package:newswatch/screens/verify.dart';
import 'package:newswatch/services/auth_aservices.dart';
import 'package:newswatch/services/auth_fservices.dart';
import 'package:newswatch/services/auth_gservices.dart';

import 'signup.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  signInWithEmailandPAssword() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("email or password is incorrect!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: OverflowBar(
              overflowSpacing: 30.0,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 60),child: Image.asset(
                  'assets/images/NewsWatch_Logo.png',
                  height: 70,
                ),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _username,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Username is Empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: "Username"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _email,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Email is Empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _password,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Password is Empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: "Paswword"),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 240),child: ElevatedButton(
                    onPressed: (() => {Get.to(VerifyScreen())}),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 2),
                        elevation: 0,
                        backgroundColor: Colors.transparent),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),),
                Padding(padding: EdgeInsets.symmetric(horizontal: 110),child: SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          await signInWithEmailandPAssword();
                          Get.offAll(Bottom());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text("Sign In")),
                ),),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 140),
                  child: Text("or sign in with"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () async {
                        await signInWithGoogle();
                        Get.offAll(Bottom());
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(),
                      ),
                      child: Image.asset(
                        'assets/logos/google.png',
                        height: 40,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        await signInWithFacebook();
                        Get.offAll(Bottom());
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(),
                      ),
                      child: Image.asset(
                        'assets/logos/facebook.png',
                        height: 40,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        await signInWithApple();
                        Get.offAll(Bottom());
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(),
                      ),
                      child: Image.asset(
                        'assets/logos/apple.png',
                        height: 40,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    ElevatedButton(
                        onPressed: (() => {Get.to(SignUpScreen())}),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(left: 2),
                            elevation: 0,
                            backgroundColor: Colors.transparent),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
