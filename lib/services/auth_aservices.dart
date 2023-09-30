import 'package:firebase_auth/firebase_auth.dart';

signInWithApple() async {
  final appleProvider = AppleAuthProvider();
  await FirebaseAuth.instance.signInWithProvider(appleProvider);
}
