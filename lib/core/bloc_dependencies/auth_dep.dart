import 'package:ddverse/network/auth/auth_network.dart';
import 'package:ddverse/repository/auth/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final authDep = AuthRepo(
  authNetwork: AuthNetwork(firebaseAuth: firebaseAuthInstance),
);
