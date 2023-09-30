import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _heading = TextEditingController();
  final TextEditingController _tag = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _videolink = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                  width: 30,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 30,
                      ),
                      Text(
                        "Add Post Image",
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: _heading,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Heading is Empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "  Add Heading",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: _tag,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Tag is Empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "  Add Tag",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: _category,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Category is Empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "  Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: _videolink,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Video Link is Empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "  Add Video Link",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                minLines: 5,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                    hintText: "Write article", border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "POST",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ));
  }
}
