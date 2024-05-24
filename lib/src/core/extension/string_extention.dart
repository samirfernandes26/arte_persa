import 'package:intl/intl.dart';

final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
final DateFormat dateTimeWithoutSec = DateFormat('yyyy-MM-dd HH:mm');

final RegExp regexDateTimeSec = RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}');

extension StringExtension on String {
  DateTime get toDateTime => regexDateTimeSec.hasMatch(this)
      ? dateFormat.parse(this)
      : dateTimeWithoutSec.parse(this);

  DateTime get toDate => DateFormat('yyyy-MM-dd').parse(this);
}
