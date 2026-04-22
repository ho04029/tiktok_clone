import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:tiktok_clone/features/video/view_models/upload_video_view_model.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends ConsumerStatefulWidget {
  final XFile video;
  final bool isPicked;

  const VideoPreviewScreen({
    super.key,
    required this.video,
    required this.isPicked,
  });

  @override
  VideoPreviewScreenState createState() => VideoPreviewScreenState();
}

class VideoPreviewScreenState extends ConsumerState<VideoPreviewScreen> {
  late final VideoPlayerController _videoPlayerController;

  bool _saveVideo = false;

  Future<void> _initVideo() async {
    _videoPlayerController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();

    setState(() {});
  }

  Future<void> _saveGallery() async {
    if (_saveVideo) return;

    await GallerySaver.saveVideo(widget.video.path, albumName: "TikTok Clone");

    _saveVideo = true;
    setState(() {});
  }

  void _onUploadPressed() {
    ref
        .read(uploadVideoProvider.notifier)
        .uploadVideo(File(widget.video.path), context);
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview video"),
        actions: [
          if (!widget.isPicked)
            IconButton(
              onPressed: _saveGallery,
              icon: FaIcon(
                _saveVideo ? FontAwesomeIcons.check : FontAwesomeIcons.download,
              ),
            ),
          IconButton(
            onPressed: ref.watch(uploadVideoProvider).isLoading
                ? () {}
                : _onUploadPressed,
            icon: ref.watch(uploadVideoProvider).isLoading
                ? CircularProgressIndicator()
                : FaIcon(FontAwesomeIcons.cloudArrowUp),
          ),
        ],
      ),
      body: _videoPlayerController.value.isInitialized == true
          ? Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  left: -MediaQuery.of(context).size.width / 2,
                  right: -MediaQuery.of(context).size.width / 2,
                  bottom: 0,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: _videoPlayerController.value.size.width,
                      height: _videoPlayerController.value.size.height,
                      child: VideoPlayer(_videoPlayerController),
                    ),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
