// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tiktok_clone/features/video/models/video_model.dart';

import 'package:tiktok_clone/main.dart';

void main() {
  group("VideoModel Test", () {
    test("Test Video Model Constructor", () {
      final video = VideoModel(
          id: "id",
          title: "title",
          descriptions: "descriptions",
          fileUrl: "fileUrl",
          thumbnailUrl: "thumbnailUrl",
          creatorUid: "creatorUid",
          creator: "creator",
          likes: 1,
          comments: 1,
          createdAt: 1);
      expect(video.id, "id");
    });

    test("Test Video Model .fromJson Constructor", () {
      final video = VideoModel.fromJson({
        "id": "id",
        "title": "title",
        "descriptions": "descriptions",
        "fileUrl": "fileUrl",
        "thumbnailUrl": "thumbnailUrl",
        "creatorUid": "creatorUid",
        "creator": "creator",
        "likes": 1,
        "comments": 1,
        "createdAt": 1
      }, "videoId");
      expect(video.title, "title");
      expect(video.comments, isInstanceOf<int>());
    });

    test("Test Video Model toJson Method", () {
      final video = VideoModel(
          id: "id",
          title: "title",
          descriptions: "descriptions",
          fileUrl: "fileUrl",
          thumbnailUrl: "thumbnailUrl",
          creatorUid: "creatorUid",
          creator: "creator",
          likes: 1,
          comments: 1,
          createdAt: 1);
      final json = video.toJson();
      expect(json["id"], "id");
      expect(json["likes"], isInstanceOf<int>());
    });
  });
}
