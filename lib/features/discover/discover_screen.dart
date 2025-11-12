import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = ["Top", "Users", "Videos", "Sounds", "LIVE", "Shopping", "Brands"];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: [for (var tab in tabs) Tab(text: tab)],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              itemCount: 20,
              padding: EdgeInsets.symmetric(horizontal: Sizes.size6),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 16,
              ),
              itemBuilder:
                  (context, index) => Container(
                    color: Colors.teal,
                    child: Center(child: Text("$index")),
                  ),
            ),
            for (var tab in tabs.skip(1))
              Center(child: Text(tab, style: TextStyle(fontSize: 28))),
          ],
        ),
      ),
    );
  }
}
