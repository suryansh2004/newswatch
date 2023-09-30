// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _email.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Reset email sent! check your email"),
            );
          });
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
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
                Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: TextFormField(
                  controller: _email,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Email is empty";
                    }
                    return null;
                  },
                  decoration:
                      const InputDecoration(labelText: "Enter your Email"),
                ),),
                Padding(padding: EdgeInsets.symmetric(horizontal: 110),child: SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          await passwordReset();
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
                          : const Text("Reset Password")),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
