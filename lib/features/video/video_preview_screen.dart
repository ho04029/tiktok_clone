import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class VideoPreviewScreen extends StatefulWidget {
  final XFile video;

  const VideoPreviewScreen({super.key, required this.video});

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preview video")),
      body: Container(),
    );
  }
}
