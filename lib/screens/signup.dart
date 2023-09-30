import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newswatch/Widgets/bottom_navigator.dart';
import 'package:newswatch/services/auth_aservices.dart';
import 'package:newswatch/services/auth_fservices.dart';
import 'package:newswatch/services/auth_gservices.dart';

enum Character { mediareporter, visitor }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  Character? _character = Character.mediareporter;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phnno = TextEditingController();
  final TextEditingController _password = TextEditingController();
  createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      if (e.code == 'weak-password') {
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("The password provided is too weak.")));
      } else if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("The account already exists for that email.")));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
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
              overflowSpacing: 20.0,
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Image.asset(
                    'assets/images/NewsWatch_Logo.png',
                    height: 70,
                  ),
                ),
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
                    controller: _phnno,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Mobile Number is Empty";
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(labelText: "Mobile Number"),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: const Text("I am a"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<Character>(
                        value: Character.mediareporter,
                        groupValue: _character,
                        onChanged: (Character? value) {
                          setState(() {
                            _character = value;
                          });
                        }),
                    const Text(
                      "Media Reporter",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Radio<Character>(
                        value: Character.visitor,
                        groupValue: _character,
                        onChanged: (Character? value) {
                          setState(() {
                            _character = value;
                          });
                        }),
                    const Text(
                      "Visitor",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 110),
                  child: SizedBox(
                    width: 150,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            await createUserWithEmailAndPassword();
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
                            : Text("Sign Up")),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 140),
                  child: const Text("or sign in with"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        signInWithGoogle();
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text("BY signing up to NewsWatch you are accepting our"),
                      Text(
                        "Terms & Conditons",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
