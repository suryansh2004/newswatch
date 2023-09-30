import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswatch/Widgets/news_card_widget.dart';
import 'package:newswatch/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [];
  @override
  void initState() {
    super.initState();
    tabs.add(tab("Popular"));
    tabs.add(tab("Business"));
    tabs.add(tab("Politics"));
    tabs.add(tab("Tech"));
    tabs.add(tab("Science"));
    tabs.add(tab("Healthy"));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Discover",
                style: TextStyle(
                  color: Colors.black,
                )),
            centerTitle: true,
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              tabs: tabs,
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.blue,
            ),
            leading: GestureDetector(
              onTap: () {
                Get.to(SettingScreen());
              },
              child: Icon(Icons.settings, color: Colors.grey),
            ),
            actions: <Widget>[
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.notifications,
                color: Colors.blue,
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          body: TabBarView(
            children: tabs.map((model) => NewsCardWidget()).toList(),
          ),
        ));
  }

  Widget tab(String tabName) {
    return Tab(
      text: tabName,
    );
  }
}
