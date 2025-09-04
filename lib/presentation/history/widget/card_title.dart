import 'package:ddverse/core/helper_func/time_formatter.dart';
import 'package:ddverse/model/reading.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final TestReading reading;
  const CardTitle({super.key, required this.reading});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.thermostat, color: Colors.red),
        title: Text(
          "Temp: ${reading.temperature}°C, Moisture: ${reading.moisture}%",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(
          "Time: ${timeFormatter(reading.timestamp)}",
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
