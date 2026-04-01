import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/inbox/models/message.dart';

class MessagesRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage(MessageModel message) async {
    // TODO: 유저아이디 받아서 넣기
    await _db
        .collection("chat_rooms")
        .doc("")
        .collection("texts")
        .add(message.toJson());
  }
}

final messagesRepo = Provider((ref) => MessagesRepo());
