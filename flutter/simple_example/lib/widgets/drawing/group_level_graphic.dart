import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_example/utils/constants.dart';

const topPadding = 18.0;
const fillInset = 4.0;
const borderWidth = 2.0;

class GroupLevelGraphic extends StatelessWidget {
  final double percentDecimal;
  final double currentLevel;
  final double capacity;
  final String units;
  final double? capacityHeight;
  final double height;

  const GroupLevelGraphic({
    super.key,
    required this.percentDecimal,
    required this.currentLevel,
    required this.capacity,
    required this.units,
    this.capacityHeight,
    this.height = 71.0,
  });

  double _calculateLeftTextPaddding(double fillWidth, double value, double capacity) {
    const textWidth = 38;
    final percent = value / capacity;
    if (percent < .50) {
      return fillWidth;
    } else if (percent > .50) {
      return fillWidth - textWidth;
    } else {
      return fillWidth - (textWidth / 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final capacityString = "${capacity.toStringAsFixed(1)} $units";
    final currentLevelString = "${currentLevel.toStringAsFixed(1)} $units";

    final levelGraphic = LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      double width = constraints.maxWidth;
      double fillWidth = width - (fillInset * 2);
      Color fillColor = Colors.green;

      final currentLevelWidth = fillWidth * (currentLevel / capacity);
      final currentLevelLeftPadding = _calculateLeftTextPaddding(currentLevelWidth, currentLevel, capacity);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Capacity
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: AutoSizeText(
                capacityString,
                style: GoogleFonts.lato(color: cardTextColor, fontSize: 11, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              // Bar outline
              Container(
                width: double.infinity,
                height: 31,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: borderWidth,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              // Bar fill
              Container(
                margin: const EdgeInsets.only(top: fillInset, left: fillInset, right: fillInset),
                width: currentLevelWidth,
                height: 23, // fill height
                decoration: ShapeDecoration(
                  color: fillColor,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
                ),
              ),
            ],
          ),
          // Current Level
          Padding(
            padding: EdgeInsets.only(top: 4, left: currentLevelLeftPadding),
            child: AutoSizeText(
              currentLevelString,
              style: GoogleFonts.lato(color: cardTextColor, fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      );
    });

    return Padding(
      padding: const EdgeInsets.only(top: topPadding), // top padding
      child: levelGraphic,
    );
  }
}
