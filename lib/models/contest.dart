import 'package:blue_savers/models/saver.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contest {
  final String placeName;
  final String date;
  final String hours;
  final String photoURL;
  final double latitude;
  final double longitude;
  final String adress;
  final int point;

  Contest(
      {required this.placeName,
      required this.date,
      required this.hours,
      required this.photoURL,
      required this.latitude,
      required this.longitude,
      required this.adress,
      required this.point});

  factory Contest.createFromDoc(DocumentSnapshot doc) {
    return Contest(
        placeName: doc.get("placeName"),
        date: doc.get("date"),
        hours: doc.get("hours"),
        photoURL: doc.get("photoURL"),
        latitude: doc.get("latitude"),
        longitude: doc.get("longitude"),
        adress: doc.get("adress"),
        point: doc.get("point"));
  }
}
