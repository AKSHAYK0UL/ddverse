import 'package:intl/intl.dart';

String timeFormatter(DateTime time) {
  final formattedTime = DateFormat("dd MMM yyyy, hh:mm a").format(time);
  return formattedTime;
}
