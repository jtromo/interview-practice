import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_example/models/bottle.dart';
import 'package:simple_example/utils/constants.dart';
import 'package:simple_example/widgets/drawing/level_graphic.dart';

class LevelCard extends StatefulWidget {
  final Bottle bottle;

  const LevelCard(
    this.bottle, {
    super.key,
  });

  @override
  State<LevelCard> createState() => LevelCardState();
}

class LevelCardState extends State<LevelCard> {
  late double percent;
  late String levelString;
  late String capacityString;
  late String unitsString;

  @override
  void initState() {
    levelString = widget.bottle.currentLevelString();
    capacityString = widget.bottle.capacityString();
    unitsString = widget.bottle.unit;
    percent = widget.bottle.percentDecimal();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const contentHeight = 125.0;
    const binWidth = 60.5;
    const textWidth = 80.0;

    // ignore: use_decorated_box
    return Container(
      width: double.infinity,
      decoration: cardShadow,
      child: Card(
        surfaceTintColor: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(roundedCornerRadius))),
        color: cardBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: SizedBox(
                  height: contentHeight,
                  width: textWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AutoSizeText(
                        "Capacity",
                        style: GoogleFonts.lato(color: cardSubtextColor, fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                      AutoSizeText(
                        "$capacityString $unitsString",
                        minFontSize: 10,
                        maxFontSize: 11,
                        style: GoogleFonts.lato(color: cardSubtextColor, fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              LevelGraphic(
                percentDecimal: percent,
                height: contentHeight,
                binGraphicWidth: binWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: SizedBox(
                  height: contentHeight,
                  width: textWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Level",
                        style: GoogleFonts.lato(color: cardTextColor, fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                      AutoSizeText(
                        "$levelString $unitsString",
                        minFontSize: 10,
                        maxFontSize: 12,
                        style: GoogleFonts.lato(color: cardTextColor, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Container(height: 31.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
