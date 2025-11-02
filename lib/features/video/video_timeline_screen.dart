import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();

  List<Color> colors = [Colors.blue, Colors.red, Colors.yellow, Colors.teal];

  void _onPageChange(int page) {
    _pageController.animateTo(
      page.toDouble(),
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );

    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      colors.addAll([Colors.blue, Colors.red, Colors.yellow, Colors.teal]);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChange,
      itemCount: _itemCount,
      itemBuilder:
          (context, index) => Container(
            color: colors[index],
            child: Center(child: Text("screen $index")),
          ),
    );
  }
}
