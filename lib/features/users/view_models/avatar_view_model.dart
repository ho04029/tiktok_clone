import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/users/repos/user_repository.dart';
import 'package:tiktok_clone/features/users/view_models/user_view_model.dart';

class AvatarViewModel extends AsyncNotifier {
  late final UserRepository _repository;

  @override
  FutureOr build() {
    _repository = ref.read(userRepo);
  }

  Future<void> uploadAvatar(File file) async {
    state = AsyncValue.loading();
    final fileName = ref.read(authRepo).user!.uid;
    state = await AsyncValue.guard(() async {
      final avatarUrl = await _repository.uploadAvatar(file, fileName);
      await _repository.updateAvatarUrl(fileName, avatarUrl);
      ref.read(userProvider.notifier).onAvatarUpload(avatarUrl);
    });
  }

  Future<void> uploadAvatarWeb(Uint8List bytes) async {
    state = const AsyncValue.loading();

    final fileName = ref.read(authRepo).user!.uid;

    state = await AsyncValue.guard(() async {
      final avatarUrl = await _repository.uploadAvatarWeb(bytes, fileName);
      await _repository.updateAvatarUrl(fileName, avatarUrl);
      ref.read(userProvider.notifier).onAvatarUpload(avatarUrl);
    });
  }
}

final avatarProvider = AsyncNotifierProvider<AvatarViewModel, void>(
  () => AvatarViewModel(),
);
