import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ddverse/core/constants/const.dart';

class DatabaseNetwork {
  final FirebaseFirestore _firestoreInstance;
  final String _userId;

  DatabaseNetwork({
    required FirebaseFirestore firestoreInstance,
    required String userId,
  }) : _firestoreInstance = firestoreInstance,
       _userId = userId;

  Future<void> addData(Map<String, dynamic> data) async {
    try {
      await _firestoreInstance
          .collection(users)
          .doc(_userId)
          .collection(readings)
          .add(data);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<QuerySnapshot> getData() {
    return _firestoreInstance
        .collection(users)
        .doc(_userId)
        .collection(readings)
        .orderBy("timestamp", descending: true)
        .snapshots();
  }
}
