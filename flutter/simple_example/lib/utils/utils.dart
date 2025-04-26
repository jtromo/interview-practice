import 'package:intl/intl.dart';

class Utils {
  // Converts int to string with commas
  static String formatInt(int? input) {
    if (input == null) {
      return '';
    }
    var formatter = NumberFormat('###,##0');
    return formatter.format(input);
  }

  // Converts double to string with commas and limited precision removing trailing zeros
  static String formatDouble(double? input, {int? maxDecimalDigits}) {
    if (input == null) {
      return '';
    }

    final formatter = NumberFormat.decimalPattern();
    if (maxDecimalDigits == null) {
      // Default to 10 decimal digits
      formatter.maximumFractionDigits = 10;
    } else {
      formatter.maximumFractionDigits = maxDecimalDigits;
    }

    return formatter.format(input);
  }

  // Converts double to string with fixed digits and no commas
  static String formatDoubleFixedDigits(double? input, {required int digits}) {
    if (input == null) {
      return '';
    }

    return input.toStringAsFixed(digits);
  }
}
