import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static const String _timeFormat = 'hh:mm a';

  static String format(DateTime? d) {
    if (d == null) {
      return '-';
    }

    return DateFormat(_timeFormat).format(d);
  }
}
