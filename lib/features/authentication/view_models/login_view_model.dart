import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';

class LoginViewModel extends AsyncNotifier {
  late final AuthenticationRepo _repository;

  @override
  FutureOr build() {
    _repository = ref.read(authRepo);
  }

  Future<void> login(String email, String password) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(
        () async => await _repository.signIn(email, password));
  }
}

final LoginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
