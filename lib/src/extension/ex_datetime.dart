import 'package:intl/intl.dart';

extension ExDateTime on DateTime {
  String toDateString({String format = 'yyyy-MM-dd'}) =>
      DateFormat(format).format(this);
}
