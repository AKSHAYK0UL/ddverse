import 'package:ddverse/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:ddverse/core/enums/auth_enums.dart';
import 'package:ddverse/core/services/size_service/size_service.dart';
import 'package:ddverse/core/ui_component/dialog.dart';
import 'package:ddverse/core/ui_component/snackbar.dart';
import 'package:ddverse/presentation/auth/widget/forgotpasswordtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatelessWidget {
  static const routeName = "/forgot";
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final height = SizeService.height(context);
    final width = SizeService.width(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back, size: 26),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.060),

              BlocListener<AuthBloc, AuthState>(
                listenWhen: (previous, current) => previous != current,
                listener: (context, state) {
                  if (state is AuthErrorState &&
                      state.errorSource == AuthEnum.forgot) {
                    //show snackbar
                    print(state.errorMessage);
                    buildSnackbar(context, state.errorMessage);
                  }
                  if (state is AuthSuccessState &&
                      state.successSource == AuthEnum.forgot) {
                    //show dialog
                    showPasswordSentDialog(context);
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
                "Reset Password",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: height * 0.015),

              const ForgotPasswordTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
