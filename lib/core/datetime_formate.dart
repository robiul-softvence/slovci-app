import 'package:intl/intl.dart';
import 'package:get/get.dart';

class DatetimeFormat {
  static String formatDateTimeWithDifference(dynamic dateTime) {
    if (dateTime == null) return 'common.time.invalid_date'.tr;

    DateTime? parsedDate;
    if (dateTime is DateTime) {
      parsedDate = dateTime;
    } else {
      parsedDate = DateTime.tryParse(dateTime.toString());
    }
    if (parsedDate == null) return 'common.time.invalid_date'.tr;

    final Duration difference = DateTime.now().difference(parsedDate);

    if (difference.isNegative) {
      final DateFormat formatter = DateFormat('dd MMMM yyyy');
      return formatter.format(parsedDate);
    }

    if (difference.inSeconds < 60) {
      return _ago('seconds', difference.inSeconds);
    } else if (difference.inMinutes < 60) {
      return _ago('minutes', difference.inMinutes);
    } else if (difference.inHours < 24) {
      return _ago('hours', difference.inHours);
    } else if (difference.inDays < 30) {
      return _ago('days', difference.inDays);
    } else {
      final DateFormat formatter = DateFormat('dd MMMM yyyy');
      return formatter.format(parsedDate);
    }
  }

  /// "2 hours ago" / "il y a 2 heures". English uses the singular only for 1,
  /// French for 0 and 1.
  static String _ago(String unit, int count) {
    final isFrench = Get.locale?.languageCode == 'fr';
    final singular = isFrench ? count <= 1 : count == 1;
    return 'common.time.${unit}_ago_${singular ? 'one' : 'other'}'.trParams({
      'count': '$count',
    });
  }
}
