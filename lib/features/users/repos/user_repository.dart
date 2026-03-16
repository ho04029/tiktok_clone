import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> createProfile(UserProfileModel profile) async {
    await _db.collection("users").doc(profile.uid).set(profile.toJson());
  }

  Future<Map<String, dynamic>?> findProfile(String uid) async {
    final doc = await _db.collection("users").doc(uid).get();
    return doc.data();
  }

  Future<String> uploadAvatar(File file, String fileName) async {
    final fileRef = _storage.ref().child("avatars/$fileName");
    final metadata = SettableMetadata(
      contentType: "image/jpeg",
    );
    final task = await fileRef.putFile(file, metadata);

    final url = await task.ref.getDownloadURL();

    return url;
  }

  Future<String> uploadAvatarWeb(Uint8List bytes, String fileName) async {
    final fileRef = _storage.ref().child("avatars/$fileName");
    final metadata = SettableMetadata(
      contentType: "image/jpeg",
    );
    final task = await fileRef.putData(bytes, metadata);

    final url = await task.ref.getDownloadURL();

    return url;
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await _db.collection("users").doc(uid).update(data);
  }

  Future<void> updateAvatarUrl(String uid, String url) async {
    await _db.collection("users").doc(uid).update({
      "avatarUrl": url,
    });
  }
}

final userRepo = Provider((ref) => UserRepository());
