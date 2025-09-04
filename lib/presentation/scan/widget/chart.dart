import 'package:ddverse/model/reading.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BuildChart extends StatelessWidget {
  final List<TestReading> readings;
  const BuildChart({super.key, required this.readings});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => Text(value.toInt().toString()),
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots:
                readings
                    .asMap()
                    .entries
                    .map(
                      (e) => FlSpot(
                        e.key.toDouble(),
                        e.value.temperature.toDouble(),
                      ),
                    )
                    .take(5)
                    .toList(),
            isCurved: true,
            color: Colors.red,
            barWidth: 4,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
          ),
          LineChartBarData(
            spots:
                readings
                    .asMap()
                    .entries
                    .map(
                      (e) =>
                          FlSpot(e.key.toDouble(), e.value.moisture.toDouble()),
                    )
                    .take(5)
                    .toList(),
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
