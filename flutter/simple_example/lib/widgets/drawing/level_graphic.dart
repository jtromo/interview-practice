import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_example/utils/constants.dart';

const binTriangleTopHeight = 20.0;
const binTriangleBottomHeight = 12.0;
const binBottomLegSpace = 15.0;
const binFillInset = 5.0;

class LevelGraphic extends StatelessWidget {
  final double percentDecimal;
  final String? capacityString;
  final String? levelString;
  final String? units;
  final double height;
  final double binGraphicWidth;
  final double textWidth;

  const LevelGraphic({
    required this.percentDecimal,
    this.capacityString,
    this.levelString,
    this.units,
    super.key,
    this.height = 125.0,
    this.binGraphicWidth = 60.5,
    this.textWidth = 73.5,
  });

  double getLevelTopPadding({
    required double percent,
    required double totalHeight,
    required double capacityHeight,
  }) {
    final binFillTotal = totalHeight - binBottomLegSpace - (binFillInset * 2);
    // Get the calculated offset (inverse of the percent full since pushing down the text from top)
    final percentOffset = binFillTotal - (binFillTotal * percent);
    // Subtrack the space taken up by the capacity text
    var topPadding = percentOffset - capacityHeight;

    return topPadding < 0 ? 0 : topPadding;
  }

  @override
  Widget build(BuildContext context) {
    double fillPercent;
    if (percentDecimal < minPercentDecimalValue) {
      fillPercent = minPercentDecimalValue;
    } else if (percentDecimal > maxPercentDecimalValue) {
      fillPercent = maxPercentDecimalValue;
    } else {
      fillPercent = percentDecimal;
    }

    Color fillColor = Colors.white;

    const textPadding = 8.0;

    final levelGraphic = Stack(
      children: [
        SvgPicture.asset(
          "assets/images/svgs/bintalk_bin_level_empty.svg",
          height: height,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: binFillInset,
            top: binFillInset,
          ),
          child: _binLevelFill(
              color: fillColor,
              percent: fillPercent,
              binHeight: height,
              binWidth: binGraphicWidth,
              inset: binFillInset),
        ),
      ],
    );

    const textHeight = 14.0;
    const capacityTopPadding = binTriangleTopHeight - (textHeight / 2);
    final levelTopPadding = getLevelTopPadding(
        percent: fillPercent, totalHeight: height, capacityHeight: binTriangleTopHeight + textHeight);
    final unitsString = units != null ? " $units" : "";
    final capacityUnitsString = capacityString != null ? "$capacityString$unitsString" : null;
    final levelUnitsString = levelString != null ? "$levelString$unitsString" : null;

    if (capacityUnitsString != null && levelUnitsString != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          levelGraphic,
          Container(
            width: textWidth - textPadding,
            padding: const EdgeInsets.only(left: textPadding),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: capacityTopPadding < 0 ? 0 : capacityTopPadding),
                child: AutoSizeText(
                  capacityUnitsString,
                  style: GoogleFonts.lato(color: cardSubtextColor, fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: levelTopPadding),
                child: AutoSizeText(
                  levelUnitsString,
                  style: GoogleFonts.lato(color: cardTextColor, fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ]),
          )
        ],
      );
    } else {
      return levelGraphic;
    }
  }

  Widget _binLevelFill(
      {required Color color,
      required double percent,
      required double binHeight,
      required double binWidth,
      required double inset}) {
    Widget binFill = CustomPaint(
      painter: BinFillPainter(
        inset: inset,
        percent: percent,
        color: color,
        paintingStyle: PaintingStyle.fill,
      ),
      child: SizedBox(
        height: binHeight - (inset * 2) - binBottomLegSpace,
        width: binWidth - (inset * 2),
      ),
    );

    return binFill;
  }
}

class BinFillPainter extends CustomPainter {
  final double inset;

  final double percent;
  final Color color;
  final PaintingStyle paintingStyle;

  BinFillPainter(
      {required this.percent, this.inset = 5.0, this.color = Colors.black, this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = paintingStyle;

    double differenceHeight = size.height * (1 - percent);

    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        _getBinFillPath(size.width, size.height),
        Path()..addRect(Rect.fromLTWH(0, 0, size.width, differenceHeight)),
      ),
      paint,
    );
  }

  Path _getBinFillPath(double width, double height) {
    return Path()
      // top triangle
      ..moveTo(0, binTriangleTopHeight)
      ..lineTo(width / 2, 0)
      ..lineTo(width, binTriangleTopHeight)
      // top triangle end
      // rectangle
      ..lineTo(width, height - binTriangleBottomHeight)
      // bottom triangle
      ..lineTo(width / 2, height)
      ..lineTo(0, height - binTriangleBottomHeight)
      // bottom triangle end
      // rectangle
      ..lineTo(0, binTriangleTopHeight);
  }

  @override
  bool shouldRepaint(BinFillPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.paintingStyle != paintingStyle || oldDelegate.percent != percent;
  }
}
