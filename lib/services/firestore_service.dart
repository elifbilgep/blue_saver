import 'package:blue_savers/models/contest.dart';
import 'package:blue_savers/models/saver.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createSaver(
      {id,
      email,
      latitude,
      longitude,
      userName,
      points,
      facebookURL,
      twitterURL,
      instagramURL,
      profilePictureURL}) async {
    await _firestore.collection("savers").doc(id).set({
      "id": id,
      "email": email,
      "latitude": latitude,
      "longitude": longitude,
      "userName": userName,
      "points": points,
      "facebookURL": facebookURL,
      "twitterURL": twitterURL,
      "instagramURL": instagramURL,
      "profilePictureURL": profilePictureURL,
    });
  }

  Future<List<Contest>> getContests() async {
    var snapshot = await _firestore.collection("contest").get();
    var contests =
        snapshot.docs.map((doc) => Contest.createFromDoc(doc)).toList();
    return contests;
  }

  Future<Saver> getSaver(id) async {
    try {
      DocumentSnapshot doc = await _firestore.collection("saver").doc(id).get();
      if (doc.exists) {
        print("doc exists");
        Saver saver = Saver.createFromDoc(doc);

        return saver;
      }
      throw '';
    } catch (e) {
      print(e);
    }
    throw "error";
  }
}
