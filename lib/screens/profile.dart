import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswatch/Widgets/bottom_navigator.dart';


enum Character { mediareporter, visitor }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  Character? _character = Character.mediareporter;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phnno = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
              onTap: () {
                Get.offAll(Bottom());
              },
              child: Icon(Icons.arrow_back_ios),
            ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Icon(
            Icons.account_circle,
            size: 200,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Change Profile Photo",
            style: TextStyle(color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: _username,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Username is Empty";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "  Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: _email,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Email is Empty";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "  Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: _phnno,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Mobile Number is Empty";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "  Mobile Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: _password,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Password is Empty";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "  Paswword",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: const Text(
              "I am a",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
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
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: const Text(
              "Upload Media Document",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  backgroundColor: Colors.grey,
                ),
                child: Text(
                  "Browse File",
                  style: TextStyle(color: Colors.blue),
                ),
              )),
        ],
      ),
    );
  }
}
