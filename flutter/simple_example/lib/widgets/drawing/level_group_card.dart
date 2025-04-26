import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_example/models/bottle.dart';
import 'package:simple_example/utils/constants.dart';
import 'package:simple_example/widgets/drawing/level_graphic.dart';

class LevelGroupCard extends StatefulWidget {
  final Bottle bottle;
  final double width;
  final bool clickable;

  const LevelGroupCard({
    required this.bottle,
    required this.width,
    this.clickable = true,
    super.key,
  });

  @override
  State<LevelGroupCard> createState() => LevelGroupCardState();
}

class LevelGroupCardState extends State<LevelGroupCard> {
  late String levelString;
  late String capacityString;
  late String unitsString;
  late String percentString;

  @override
  void initState() {
    levelString = widget.bottle.currentLevelString();
    capacityString = widget.bottle.capacityString();
    unitsString = widget.bottle.unit;
    percentString = widget.bottle.percentString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const contentHeight = 125.0;
    const binWidth = 60.5;
    const horizontalPadding = 10.0;
    const verticalPadding = 24.0;

    const clickIconSize = 18.0;

    return GestureDetector(
      onTap: () {},
      child: // ignore: use_decorated_box
          Container(
        width: widget.width,
        decoration: cardShadow,
        child: Card(
          margin: EdgeInsets.zero,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(roundedCornerRadius))),
          color: cardBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  AutoSizeText(
                    widget.bottle.name,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 10,
                    maxLines: 1,
                    style: GoogleFonts.lato(color: cardTextColor, fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  widget.clickable
                      ? Icon(
                          Icons.keyboard_arrow_right,
                          size: clickIconSize,
                          color: cardTextColor,
                        )
                      : Container()
                ]),
                AutoSizeText(
                  "$levelString $unitsString ($percentString)",
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 10,
                  maxLines: 1,
                  style: GoogleFonts.lato(color: cardSubtextColor, fontSize: 14, fontWeight: FontWeight.w500),
                ),
                AutoSizeText(
                  widget.bottle.lastUpdatedString(),
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 8,
                  maxLines: 1,
                  style: GoogleFonts.lato(color: cardTextColor, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Container(height: 16.0),
                LevelGraphic(
                  percentDecimal: widget.bottle.percentDecimal(),
                  height: contentHeight,
                  binGraphicWidth: binWidth,
                  textWidth: widget.width - (2 * horizontalPadding) - binWidth,
                  capacityString: capacityString,
                  levelString: levelString,
                  units: unitsString,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
