import 'package:flutter/widgets.dart';

class SizeService {
  static double height(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }
}
