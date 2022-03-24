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
      instagramURL}) async {
    await _firestore.collection("savers").doc(id).set({
      "id": id,
      "email": email,
      "latitude": latitude,
      "longitude": longitude,
      "userName": userName,
      "points": points,
      "facebookURL": facebookURL,
      "twitterURL": twitterURL,
      "instagramURL": instagramURL
    });

    Future<Saver> getSaver(id) async {
      DocumentSnapshot doc = await _firestore.collection("saver").doc(id).get();
      if (doc.exists) {
        Saver saver = Saver.createFromDoc(doc);
        print("saver " + saver.id!);
        return saver;
      }
      throw '';
    }
  }

  Future<List<Contest>> getContests() async {
    var snapshot = await _firestore.collection("contest").get();
    var contests =
        snapshot.docs.map((doc) => Contest.createFromDoc(doc)).toList();
    return contests;
  }
}
