import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Saver {
  final String? id;
  final String? userName;
  final int? points;
  final String? email;
  final String? profilePictureURL;
  final double? latitude;
  final double? longitude;
  final String? phoneNumber;
  final String? instagramURL;
  final String? facebookURL;
  final String? twitterURL;

  Saver(
      {this.id,
      this.userName,
      this.points,
      this.email,
      this.profilePictureURL,
      this.latitude,
      this.longitude,
      this.phoneNumber,
      this.instagramURL,
      this.facebookURL,
      this.twitterURL});

  factory Saver.createFromFirebase(User user) {
    return Saver(id: user.uid, email: user.email);
  }

  factory Saver.createFromDoc(DocumentSnapshot doc) {
    return Saver(
        id: doc.get("id"),
        userName: doc.get("userName"),
        points: doc.get("points"),
        email: doc.get("email"),
        profilePictureURL: doc.get("profilePictureURL"),
        latitude: doc.get("latitude"),
        longitude: doc.get("longitude"),
        phoneNumber: doc.get("phoneNumber"),
        instagramURL: doc.get("instagramURL"),
        facebookURL: doc.get("facebookURL"),
        twitterURL: doc.get("twitterURL"));
  }
}
