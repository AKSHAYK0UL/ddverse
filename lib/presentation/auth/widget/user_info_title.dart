import 'package:flutter/material.dart';

Widget buildUserInfo({
  required BuildContext context,
  required String title,
  required String data,
  required double screenSize,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: screenSize * 0.0197,
      vertical: screenSize * 0.0050,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        SizedBox(height: screenSize * 0.0027),
        Text(
          data,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontSize: screenSize * 0.0276),
        ),
        const Divider(color: Colors.black, thickness: 1.5),
      ],
    ),
  );
}
