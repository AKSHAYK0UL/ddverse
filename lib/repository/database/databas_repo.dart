import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ddverse/model/reading.dart';
import 'package:ddverse/network/database/database_network.dart';

class DatabaseRepo {
  final DatabaseNetwork _databaseNetwork;

  DatabaseRepo({required DatabaseNetwork databaseNetwork})
    : _databaseNetwork = databaseNetwork;

  Future<void> addData(TestReading data) async {
    try {
      final jsonData = data.toJson();
      await _databaseNetwork.addData(jsonData);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<List<TestReading>> getData() {
    return _databaseNetwork.getData().map((QuerySnapshot snapshot) {
      print("SNAPSHOT SIZE: ${snapshot.docs.length}");
      for (var doc in snapshot.docs) {
        print("DOC DATA: ${doc.data()}");
      }
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return TestReading.fromJson(data);
      }).toList();
    });
  }
}
