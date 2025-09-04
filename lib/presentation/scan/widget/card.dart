import 'package:ddverse/core/helper_func/time_formatter.dart';
import 'package:ddverse/model/reading.dart';
import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final TestReading latestReading;
  const BuildCard({super.key, required this.latestReading});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Latest Reading",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Temperature: ${latestReading.temperature}°C",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Moisture: ${latestReading.moisture}%",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Time: ${timeFormatter(latestReading.timestamp)}",
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
