import 'package:ddverse/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:ddverse/core/enums/auth_enums.dart';
import 'package:ddverse/core/services/size_service/size_service.dart';
import 'package:ddverse/core/ui_component/snackbar.dart';
import 'package:ddverse/presentation/auth/screen/forgotpassword.dart';
import 'package:ddverse/presentation/auth/widget/text_form.dart';
import 'package:ddverse/presentation/scan/screen/reading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signin extends StatelessWidget {
  final VoidCallback onClick;

  const Signin({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    final height = SizeService.height(context);
    final width = SizeService.width(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.060),

              BlocListener<AuthBloc, AuthState>(
                listenWhen: (previous, current) => previous != current,
                listener: (context, state) {
                  if (state is AuthErrorState &&
                      state.errorSource == AuthEnum.signIn) {
                    //show snackbar
                    print(state.errorMessage);
                    buildSnackbar(context, state.errorMessage);
                  }
                  if (state is AuthSuccessState &&
                      state.successSource == AuthEnum.signIn) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Reading.routeName,
                      (route) => false,
                    );
                  }
                },

                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  height:
                      MediaQuery.of(context).viewInsets.bottom > 0
                          ? height * 0.170
                          : height * 0.265,
                  child: SizedBox(
                    width: width * 0.600,
                    height: height * 0.265,
                    child: Image.asset("assets/ddverselogo.png"),
                  ),
                ),
              ),
              Text(
                "Sign In to Continue",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: height * 0.015),

              TextForm(authRoute: AuthEnum.signIn),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: onClick,
                    child: Text(
                      "Create account",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ForgotPassword.routeName);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
