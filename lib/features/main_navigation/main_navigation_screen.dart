import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/video/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIdx = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Container(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIdx == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(offstage: _selectedIdx != 0, child: VideoTimelineScreen()),
          Offstage(offstage: _selectedIdx != 1, child: Column()),
          Offstage(offstage: _selectedIdx != 1, child: Column()),
          Offstage(offstage: _selectedIdx != 1, child: Column()),
          Offstage(offstage: _selectedIdx != 1, child: Column()),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        padding: EdgeInsets.all(Sizes.size12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              text: "Home",
              isSelected: _selectedIdx == 0,
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              onTab: () => _onTap(0),
            ),
            NavTab(
              text: "Discover",
              isSelected: _selectedIdx == 1,
              icon: FontAwesomeIcons.compass,
              selectedIcon: FontAwesomeIcons.solidCompass,
              onTab: () => _onTap(1),
            ),
            Gaps.h24,
            GestureDetector(
              onTap: _onPostVideoButtonTap,
              child: PostVideoButton(),
            ),
            Gaps.h24,
            NavTab(
              text: "Inbox",
              isSelected: _selectedIdx == 3,
              icon: FontAwesomeIcons.message,
              selectedIcon: FontAwesomeIcons.solidMessage,
              onTab: () => _onTap(3),
            ),
            NavTab(
              text: "Profile",
              isSelected: _selectedIdx == 4,
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              onTab: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
