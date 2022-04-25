import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream get meetingHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('meetings')
      .snapshots();

  void addToMeetingHistory(String meetingName) async {
    try {
      String docId = _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .doc()
          .id;
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .doc(docId)
          .set({
        'meetingName': meetingName,
        'createdAt': DateTime.now(),
        'docId': docId
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteMeetingHistory(String docId) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .doc(docId)
          .delete();
    } catch (e) {
      print(e);
    }
  }
}
