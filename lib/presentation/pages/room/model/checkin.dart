import 'package:intl/intl.dart';

enum CheckinDuration { onehour, twohour, threehour, fourhour }

// enum to string
extension CheckinDurationExtension on CheckinDuration {
  String get name {
    switch (this) {
      case CheckinDuration.onehour:
        return '1 Jam';
      case CheckinDuration.twohour:
        return '2 Jam';
      case CheckinDuration.threehour:
        return '3 Jam';
      case CheckinDuration.fourhour:
        return '4 Jam';
      default:
        return '';
    }
  }
}

class CheckIn {
  final CheckinDuration duration;
  final DateTime date;
  final String time;

  CheckIn({
    required this.duration,
    required this.date,
    required this.time,
  });

  CheckIn.copyWith({
    CheckinDuration? duration,
    DateTime? date,
    String? time,
  })  : duration = duration ?? CheckinDuration.onehour,
        date = date ?? DateTime.now(),
        time = time ?? '';

  @override
  String toString() {
    return '${DateFormat('dd MMMM yyyy').format(date)} $time, ${duration.name}';
  }
}
