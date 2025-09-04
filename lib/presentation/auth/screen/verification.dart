import 'dart:async';
import 'package:ddverse/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:ddverse/core/enums/auth_enums.dart';
import 'package:ddverse/core/services/size_service/size_service.dart';
import 'package:ddverse/core/ui_component/snackbar.dart';
import 'package:ddverse/presentation/scan/screen/reading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_mail/open_mail.dart';

class Verification extends StatefulWidget {
  static const routeName = "/verification";
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final ValueNotifier<int> remainingSecondsNotifier = ValueNotifier<int>(120);
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(EmailVerificationEvent());
    startTimer();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSecondsNotifier.value == 0) {
        timer.cancel();
        Navigator.of(context).pop();
      } else {
        remainingSecondsNotifier.value = remainingSecondsNotifier.value - 1;
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    remainingSecondsNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = SizeService.height(context);

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is AuthErrorState &&
              state.errorSource == AuthEnum.verification) {
            print("ERROR : ${state.errorMessage}");
            buildSnackbar(context, state.errorMessage);
          }
          if (state is AuthSuccessState &&
              state.successSource == AuthEnum.verification) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(Reading.routeName, (route) => false);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize * 0.020,
            vertical: screenSize * 0.020,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenSize * 0.130),
                Image.asset(
                  "assets/everify.png",
                  width: screenSize * 0.260,
                  height: screenSize * 0.260,
                ),
                SizedBox(height: screenSize * 0.0250),
                ValueListenableBuilder<int>(
                  valueListenable: remainingSecondsNotifier,
                  builder: (context, value, _) {
                    return RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Check your Email to verify it's you.\nRemaining time ",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: value.toString(),
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(color: Colors.blue),
                          ),
                          TextSpan(
                            text: " seconds",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () async {
            await OpenMail.openMailApp();
          },
          child: Text(
            'Open Mail App',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
