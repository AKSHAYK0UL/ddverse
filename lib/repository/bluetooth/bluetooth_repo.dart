import 'package:ddverse/model/reading.dart';
import 'package:ddverse/network/bluetooth/bluetooth_service.dart';

class BluetoothRepo {
  final BluetoothService _btService;

  BluetoothRepo({required BluetoothService btService}) : _btService = btService;

  //get reading
  Future<TestReading> get newReading async {
    try {
      final readingJson = await _btService.newReading;
      return TestReading.fromJson(readingJson);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
