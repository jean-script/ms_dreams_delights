import 'dart:math';

import 'package:intl/intl.dart';

extension CurrencyDouble on double {
  String get currency => NumberFormat.simpleCurrency(
        decimalDigits: 2,
      ).format(this);
}

extension TruncateDoubles on double {
  double truncateToDecimalPlaces(int fractionalDigits) =>
      (this * pow(10, fractionalDigits)).truncate() / pow(10, fractionalDigits);
}
