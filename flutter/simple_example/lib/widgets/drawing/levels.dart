import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_example/models/bottle.dart';
import 'package:simple_example/widgets/drawing/level_card.dart';
import 'package:simple_example/widgets/drawing/level_group_cards.dart';

class Levels extends StatefulWidget {
  final List<Bottle> bottles;

  const Levels({required this.bottles, super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  late bool _displayingBinGroup;

  @override
  void initState() {
    widget.bottles.length > 1 ? _displayingBinGroup = true : _displayingBinGroup = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTitle(),
          _renderLevels(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _getTitle() {
    String titleString;
    if (_displayingBinGroup) {
      titleString = "Levels";
    } else {
      titleString = "Level";
    }

    return Container(
      padding: const EdgeInsets.only(left: 20, top: 25, bottom: 5, right: 20),
      child: AutoSizeText(
        titleString,
        style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _renderLevels() {
    if (_displayingBinGroup) {
      return LevelGroupCards(widget.bottles);
    } else {
      return LevelCard(widget.bottles.first);
    }
  }
}
