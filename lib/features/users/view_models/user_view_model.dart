import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';
import 'package:tiktok_clone/features/users/repos/user_repository.dart';

class UserViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _userRepository;
  late final AuthenticationRepo _authenticationRepository;

  @override
  FutureOr<UserProfileModel> build() async {
    _userRepository = ref.read(userRepo);
    _authenticationRepository = ref.read(authRepo);

    if (_authenticationRepository.isLoggedIn) {
      final profile = await _userRepository
          .findProfile(_authenticationRepository.user!.uid);

      if (profile != null) {
        return UserProfileModel.fromJson(profile);
      }
    }

    return UserProfileModel.empty();
  }

  Future<void> createProfile(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    }

    state = AsyncValue.loading();

    final profile = UserProfileModel(
        uid: credential.user!.uid,
        email: credential.user!.email ?? "anon@anon.com",
        name: credential.user!.displayName ?? "Anon",
        bio: "undefined",
        link: "undefined");
    await _userRepository.createProfile(profile);
    state = AsyncValue.data(profile);
  }
}

final userProvider = AsyncNotifierProvider<UserViewModel, UserProfileModel>(
    () => UserViewModel());
