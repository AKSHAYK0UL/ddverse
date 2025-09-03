import 'package:ddverse/presentation/auth/screen/signin.dart';
import 'package:ddverse/presentation/auth/screen/signup.dart';
import 'package:flutter/widgets.dart';

class SwitchSigninup extends StatefulWidget {
  const SwitchSigninup({super.key});

  @override
  State<SwitchSigninup> createState() => _SwitchSigninupState();
}

class _SwitchSigninupState extends State<SwitchSigninup> {
  bool isSignin = true;
  void toggle() {
    print("HELLO WORLD");
    setState(() {
      isSignin = !isSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isSignin ? Signin(onClick: toggle) : SignUp(onClick: toggle);
  }
}
