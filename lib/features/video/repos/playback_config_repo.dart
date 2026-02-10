import 'package:shared_preferences/shared_preferences.dart';

class PlaybackConfigRepository {
  // 디스크에 저장할 키 값을 미리 정의
  static const String _autoplay = "autoplay";
  static const String _muted = "muted";

  final SharedPreferences _preferences;

  PlaybackConfigRepository(this._preferences);

  Future<void> setMuted(bool value) async {
    _preferences.setBool(_muted, value);
  }

  Future<void> setAutoplay(bool value) async {
    _preferences.setBool(_autoplay, value);
  }

  bool isMuted() {
    // 디스크에 값이 없으면 false를  return
    return _preferences.getBool(_muted) ?? false;
  }

  bool isAutoplay() {
    return _preferences.getBool(_autoplay) ?? false;
  }
}
