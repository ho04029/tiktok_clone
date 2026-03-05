import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';

class UserViewModel extends AsyncNotifier<UserProfileModel> {
  @override
  FutureOr<UserProfileModel> build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}

final userProvider = AsyncNotifierProvider(() => UserViewModel());
