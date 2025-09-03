import 'package:ddverse/network/bluetooth/bluetooth_service.dart';
import 'package:ddverse/repository/bluetooth/bluetooth_repo.dart';
import 'package:ddverse/model/reading.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final _bluetoothRepo = BluetoothRepo(btService: BluetoothService());
  List<TestReading> _readings = [];

  Future<void> _scanNewReading() async {
    final data = await _bluetoothRepo.newReading;
    setState(() {
      _readings.add(data);
    });
    print(data.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan New Test")),
      body: Column(
        children: [
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _scanNewReading,
            icon: const Icon(Icons.bluetooth_searching),
            label: const Text("Scan"),
          ),
          const SizedBox(height: 20),
          Expanded(
            child:
                _readings.isEmpty
                    ? const Center(child: Text("No readings yet"))
                    : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: LineChart(
                        LineChartData(
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget:
                                    (value, meta) =>
                                        Text(value.toInt().toString()),
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                              ),
                            ),
                          ),
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(show: true),
                          lineBarsData: [
                            LineChartBarData(
                              spots:
                                  _readings
                                      .asMap()
                                      .entries
                                      .map(
                                        (e) => FlSpot(
                                          e.key.toDouble(),
                                          e.value.temperature.toDouble(),
                                        ),
                                      )
                                      .toList(),
                              isCurved: true,
                              color: Colors.red,
                              barWidth: 4,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(show: false),
                            ),

                            LineChartBarData(
                              spots:
                                  _readings
                                      .asMap()
                                      .entries
                                      .map(
                                        (e) => FlSpot(
                                          e.key.toDouble(),
                                          e.value.moisture.toDouble(),
                                        ),
                                      )
                                      .toList(),
                              isCurved: true,
                              color: Colors.blue,
                              barWidth: 4,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.show_chart, color: Colors.red),
                SizedBox(width: 4),
                Text("Temperature"),
                SizedBox(width: 16),
                Icon(Icons.show_chart, color: Colors.blue),
                SizedBox(width: 4),
                Text("Moisture"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
