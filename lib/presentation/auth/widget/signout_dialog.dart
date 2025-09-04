import 'package:ddverse/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:ddverse/presentation/auth/widget/switch_signinup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void signoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Sign Out",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.red),
          ),
          content: Text(
            "Are you sure you want to sign out?",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Cancel",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<AuthBloc>().add(SignOutEvent());
                Navigator.of(context).pushNamedAndRemoveUntil(
                  SwitchSigninup.routeName,
                  (route) => false,
                );
              },
              child: Text(
                "Sign Out",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: Colors.red),
              ),
            ),
          ],
        ),
  );
}
