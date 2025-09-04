import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ddverse/network/auth/auth_network.dart';
import 'package:ddverse/network/bluetooth/bluetooth_service.dart';
import 'package:ddverse/network/database/database_network.dart';
import 'package:ddverse/repository/auth/auth_repo.dart';
import 'package:ddverse/repository/bluetooth/bluetooth_repo.dart';
import 'package:ddverse/repository/database/databas_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final fireStoreInstance = FirebaseFirestore.instance;
final authDep = AuthRepo(
  authNetwork: AuthNetwork(firebaseAuth: firebaseAuthInstance),
);

final btRepo = BluetoothRepo(btService: BluetoothService());

final dbRepo = DatabaseRepo(
  databaseNetwork: DatabaseNetwork(
    firestoreInstance: fireStoreInstance,
    userId: firebaseAuthInstance.currentUser!.uid,
  ),
);
