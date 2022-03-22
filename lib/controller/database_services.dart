import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  static CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> createOrUpdateUser(
      String email, String name, double lat, double long) async {
    await usersCollection.doc(email).set({
      'name': name,
      'date': Timestamp.now(),
      'latitude': lat,
      'longitude': long
    }, SetOptions(merge: true));
  }

  static Future<DocumentSnapshot> getUser(String email) async {
    return await usersCollection.doc(email).get();
  }
}
