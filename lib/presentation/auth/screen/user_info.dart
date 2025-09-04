import 'package:ddverse/core/bloc_dependencies/auth_dep.dart';
import 'package:ddverse/core/helper_func/time_formatter.dart';
import 'package:ddverse/core/services/size_service/size_service.dart';
import 'package:ddverse/presentation/auth/widget/signout_dialog.dart';
import 'package:ddverse/presentation/auth/widget/user_info_title.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserInfo extends StatelessWidget {
  static const routeName = "/userinfo";
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = SizeService.height(context);
    final currentUser = firebaseAuthInstance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(screenSize * 0.166),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: SizeService.height(context) * 0.166,
                    child: Lottie.asset(
                      "assets/userinfo.json",
                      repeat: false,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Chip(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.transparent),
              avatar: const Icon(Icons.check, color: Colors.green),
              label: Text(
                "Your account is secure",
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Card(
              elevation: screenSize * 0.00200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenSize * 0.0131),
              ),
              margin: EdgeInsets.only(
                left: screenSize * 0.0110,
                right: screenSize * 0.0110,
                bottom: screenSize * 0.010,
              ),
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildUserInfo(
                    context: context,
                    title: "Email",
                    data: currentUser!.email!,
                    screenSize: screenSize,
                  ),
                  buildUserInfo(
                    context: context,
                    title: "Register On",
                    data: timeFormatter(currentUser.metadata.creationTime!),
                    screenSize: screenSize,
                  ),
                  buildUserInfo(
                    context: context,
                    title: "Last Sign-In On",
                    data: timeFormatter(currentUser.metadata.lastSignInTime!),
                    screenSize: screenSize,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        ElevatedButton.icon(
          onPressed: () {
            signoutDialog(context);
          },
          icon: Icon(Icons.logout, size: 26, color: Colors.red),
          label: Text(
            "Sign Out",
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
