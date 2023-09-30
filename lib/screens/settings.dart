import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswatch/screens/profile.dart';
import 'package:newswatch/screens/welcome_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
            ),
            title: Text("Profile"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.to(ProfileScreen());
            },
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(
              Icons.account_balance_wallet_outlined,
              color: Colors.black,
            ),
            title: Text("My Wallet"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(
              Icons.edit_square,
              color: Colors.black,
            ),
            title: Text("My Post"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(
              Icons.rocket_launch_outlined,
              color: Colors.black,
            ),
            title: Text("Boost Your Post"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            title: Text("Notifications"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(
              Icons.sticky_note_2_outlined,
              color: Colors.black,
            ),
            title: Text("Terms and Condition"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(
              Icons.question_mark,
              color: Colors.black,
            ),
            title: Text("About"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(
              Icons.star_border,
              color: Colors.black,
            ),
            title: Text("Watch Ads & Earn"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.arrowshape_turn_up_right,
              color: Colors.black,
            ),
            title: Text("Refer and Earn"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(
              Icons.login,
              color: Colors.black,
            ),
            title: Text("Log Out"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async{
              FirebaseAuth.instance.signOut();
              await Get.offAll(WelcomeScreen());
            },
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
