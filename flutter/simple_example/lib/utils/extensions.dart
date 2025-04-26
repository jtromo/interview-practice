import 'package:simple_example/utils/utils.dart';

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return '';
    return replaceFirst(this[0], this[0].toUpperCase());
  }

  String maxString({required int maxLength}) {
    if (isEmpty) return '';
    if (length > maxLength) return '${substring(0, maxLength)}...';
    return this;
  }
}

extension FormatExtension on double {
  /// Converts a double to a formatted string rounded to the max number of digits and removing any trailing zeros
  String toFormattedString({int? maxDecimalDigits}) {
    return Utils.formatDouble(this, maxDecimalDigits: maxDecimalDigits);
  }

  String toFormattedStringFixedDigits({required int digits}) {
    return Utils.formatDoubleFixedDigits(this, digits: digits);
  }

  double roundTo({required int maxDecimalDigits}) {
    final roundedString = toStringAsFixed(maxDecimalDigits);
    return double.parse(roundedString);
  }

  bool isInteger() => this == roundToDouble();
}
