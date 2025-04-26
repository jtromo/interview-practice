import 'package:simple_example/utils/extensions.dart';

class Bottle {
  final String id;
  final String name;
  final String unit;
  final double currentLevel;
  final double capacity;
  final bool hasDetails;

  Bottle({
    required this.id,
    required this.name,
    required this.unit,
    required this.currentLevel,
    required this.capacity,
    this.hasDetails = false,
  });

  String lastUpdatedString() {
    return 'Updated ${DateTime.now().hour}:${DateTime.now().minute}';
  }

  double percentDecimal() {
    return currentLevel / capacity;
  }

  String percentString() {
    final percent = percentDecimal() * 100;
    final percentFormatted = percent.roundTo(maxDecimalDigits: 2);
    return "$percentFormatted%";
  }

  String capacityString() {
    return capacity.toString();
  }

  String currentLevelString() {
    return currentLevel.toString();
  }
}
