import 'package:ddverse/presentation/auth/screen/forgotpassword.dart';
import 'package:ddverse/presentation/auth/screen/verification.dart';
import 'package:ddverse/presentation/home/home.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => const Home(),
  Verification.routeName: (context) => const Verification(),
  ForgotPassword.routeName: (context) => const ForgotPassword(),
};
