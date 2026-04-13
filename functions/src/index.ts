/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import { onDocumentCreated } from "firebase-functions/v2/firestore";
import * as admin from "firebase-admin";

admin.initializeApp();

export const onVideoCreated = onDocumentCreated(
  {
    document: "videos/{videoId}",
    region: "asia-northeast3",
  },
  async (event) => {
    const spawn = require("child-process-promise").spawn;
    const snapshot = event.data;
    if (!snapshot) return;
    const video = snapshot.data();
    await spawn("ffmpeg", [
      "-i",
      video.fileUrl,
      "-ss",
      "00:00:01.000",
      "-vframes",
      "1",
      "-vf",
      "scale=150:-1",
      `/tmp/${snapshot.id}.jpg`,
    ]);

    const storage = admin.storage();
    const [file, _] = await storage.bucket().upload(`/tmp/${snapshot.id}.jpg`, {
      destination: `thumbnails/${snapshot.id}.jpg`,
    });
    await file.makePublic();
    await snapshot.ref.update({ thumbnailUrl: file.publicUrl() });

    const db = admin.firestore();
    db.collection("users")
      .doc(video.creatorUid)
      .collection("videos")
      .doc(snapshot.id)
      .set({ thumbnailUrl: file.publicUrl(), videoId: snapshot.id });
  },
);

export const onLikedCreated = onDocumentCreated(
  {
    document: "likes/{likeId}",
    region: "asia-northeast3",
  },
  async (event) => {
    const db = admin.firestore();
    const snapshot = event.data;
    const [videoId, _] = snapshot!.id.split("000");
    await db
      .collection("videos")
      .doc(videoId)
      .update({
        likes: admin.firestore.FieldValue.increment(1),
      });

    // 좋아요를 누르면 해당 영상의 주인에게 알림이 갈 수 있도록
    const video = await (
      await db.collection("videos").doc(videoId).get()
    ).data();
    if (video) {
      const creatorUid = video.creatorUid;
      const user = await (
        await db.collection("users").doc(creatorUid).get()
      ).data();
      if (user) {
        const token = user.token;
        await admin.messaging().send({
          token: token,
          data: {
            screen: "123",
          },
          notification: {
            title: "someone liked your video.",
            body: "Likes + 1 ! Congrats! 💖",
          },
        });
      }
    }
  },
);

export const onLikedRemoved = onDocumentCreated(
  {
    document: "likes/{likeId}",
    region: "asia-northeast3",
  },
  async (event) => {
    const db = admin.firestore();
    const snapshot = event.data;
    const [videoId, _] = snapshot!.id.split("000");
    await db
      .collection("videos")
      .doc(videoId)
      .update({
        likes: admin.firestore.FieldValue.increment(-1),
      });
  },
);
