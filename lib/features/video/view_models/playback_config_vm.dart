import 'package:flutter/cupertino.dart';
import 'package:tiktok_clone/features/video/models/playback_config_model.dart';
import 'package:tiktok_clone/features/video/repos/playback_config_repo.dart';

class PlaybackConfigViewModel extends ChangeNotifier {
  PlaybackConfigRepository _repository;

  final PlaybackConfigModel _model = PlaybackConfigModel(
    muted: _repository.isMuted(),
    autoplay: _repository.isAutoplay(),
  );
}
