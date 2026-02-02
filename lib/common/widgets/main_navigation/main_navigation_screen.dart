import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';
import 'package:tiktok_clone/features/video/video_timeline_screen.dart';
import 'package:tiktok_clone/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({super.key, required this.tab});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = ["home", "discover", "xxx", "inbox", "profile"];

  late int _selectedIdx = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
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
    final isDark = isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          _selectedIdx == 0 || isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(offstage: _selectedIdx != 0, child: VideoTimelineScreen()),
          Offstage(offstage: _selectedIdx != 1, child: DiscoverScreen()),
          Offstage(offstage: _selectedIdx != 3, child: InboxScreen()),
          Offstage(
            offstage: _selectedIdx != 4,
            child: UserProfileScreen(username: 'user', tab: ""),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIdx == 0 || isDark ? Colors.black : Colors.white,
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
              selectedIndex: _selectedIdx,
            ),
            NavTab(
              text: "Discover",
              isSelected: _selectedIdx == 1,
              icon: FontAwesomeIcons.compass,
              selectedIcon: FontAwesomeIcons.solidCompass,
              onTab: () => _onTap(1),
              selectedIndex: _selectedIdx,
            ),
            Gaps.h24,
            GestureDetector(
              onTap: _onPostVideoButtonTap,
              child: PostVideoButton(inverted: _selectedIdx != 0),
            ),
            Gaps.h24,
            NavTab(
              text: "Inbox",
              isSelected: _selectedIdx == 3,
              icon: FontAwesomeIcons.message,
              selectedIcon: FontAwesomeIcons.solidMessage,
              onTab: () => _onTap(3),
              selectedIndex: _selectedIdx,
            ),
            NavTab(
              text: "Profile",
              isSelected: _selectedIdx == 4,
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              onTab: () => _onTap(4),
              selectedIndex: _selectedIdx,
            ),
          ],
        ),
      ),
    );
  }
}
