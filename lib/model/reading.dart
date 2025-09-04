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
      temperature:
          json["temperature"] is String
              ? int.parse(json["temperature"])
              : (json["temperature"] as num).toInt(),
      moisture:
          json["moisture"] is String
              ? int.parse(json["moisture"])
              : (json["moisture"] as num).toInt(),
      timestamp: DateTime.parse(json["timestamp"].toString()),
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
