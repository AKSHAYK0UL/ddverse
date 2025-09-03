import 'dart:math';

class BluetoothService {
  final _rand = Random();
  Future<Map<String, dynamic>> get newReading async {
    try {
      await Future.delayed(Duration(seconds: 3));
      return {
        "temperature": (20 + _rand.nextInt(10)).toString(),
        "moisture": (40 + _rand.nextInt(20)).toString(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
