import 'package:ddverse/presentation/auth/screen/forgotpassword.dart';
import 'package:ddverse/presentation/auth/screen/user_info.dart';
import 'package:ddverse/presentation/auth/screen/verification.dart';
import 'package:ddverse/presentation/auth/widget/switch_signinup.dart';
import 'package:ddverse/presentation/scan/screen/reading.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes = {
  SwitchSigninup.routeName: (context) => SwitchSigninup(),
  Reading.routeName: (context) => const Reading(),
  Verification.routeName: (context) => const Verification(),
  ForgotPassword.routeName: (context) => const ForgotPassword(),
  UserInfo.routeName: (context) => const UserInfo(),
};
