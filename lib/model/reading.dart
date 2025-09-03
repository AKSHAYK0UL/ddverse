class TestReading {
  final int temperature;
  final int moisture;
  final DateTime timestamp;

  TestReading({
    required this.temperature,
    required this.moisture,
    required this.timestamp,
  });

  factory TestReading.fromJson(Map<String, dynamic> json) {
    return TestReading(
      temperature: int.parse(json["temperature"]),
      moisture: int.parse(json["moisture"]),
      timestamp: DateTime.parse(json["timestamp"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "temperature": temperature,
      "moisture": moisture,
      "timestamp": timestamp.toIso8601String(),
    };
  }
}
