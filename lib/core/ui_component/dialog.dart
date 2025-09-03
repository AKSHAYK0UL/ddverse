import 'package:flutter/material.dart';
import 'package:open_mail/open_mail.dart';

void showPasswordSentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Check Your Email",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Text(
            "We’ve sent you a link to reset your password. Please check your inbox (and spam folder if you don’t see it).",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Close",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await OpenMail.openMailApp();
              },
              child: Text(
                "Open Mail",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
  );
}
